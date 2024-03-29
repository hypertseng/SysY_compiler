#include "front/semantic.h"

#include <cassert>

using ir::Function;
using ir::Instruction;
using ir::Operand;
using ir::Operator;

#define TODO assert(0 && "TODO");

#define GET_CHILD_PTR(node, type, index)                     \
    auto node = dynamic_cast<type *>(root->children[index]); \
    assert(node);
#define ANALYSIS(node, type, index)                          \
    auto node = dynamic_cast<type *>(root->children[index]); \
    assert(node);                                            \
    analysis##type(node, buffer);
#define COPY_EXP_NODE(from, to)              \
    to->is_computable = from->is_computable; \
    to->v = from->v;                         \
    to->t = from->t;

map<std::string, ir::Function *> *frontend::get_lib_funcs()
{
    static map<std::string, ir::Function *> lib_funcs = {
        {"getint", new Function("getint", Type::Int)},
        {"getch", new Function("getch", Type::Int)},
        {"getfloat", new Function("getfloat", Type::Float)},
        {"getarray", new Function("getarray", {Operand("arr", Type::IntPtr)}, Type::Int)},
        {"getfarray", new Function("getfarray", {Operand("arr", Type::FloatPtr)}, Type::Int)},
        {"putint", new Function("putint", {Operand("i", Type::Int)}, Type::null)},
        {"putch", new Function("putch", {Operand("i", Type::Int)}, Type::null)},
        {"putfloat", new Function("putfloat", {Operand("f", Type::Float)}, Type::null)},
        {"putarray", new Function("putarray", {Operand("n", Type::Int), Operand("arr", Type::IntPtr)}, Type::null)},
        {"putfarray", new Function("putfarray", {Operand("n", Type::Int), Operand("arr", Type::FloatPtr)}, Type::null)},
    };
    return &lib_funcs;
}

// 进入新作用域时, 向符号表中添加 ScopeInfo, 相当于压栈
void frontend::SymbolTable::add_scope(string name)
{
    ScopeInfo scopeinfo;
    scopeinfo.cnt = block_cnt;
    scopeinfo.name = name + "_" + std::to_string(block_cnt);
    block_cnt++;
    scope_stack.push_back(scopeinfo);
}

// 退出时弹栈
void frontend::SymbolTable::exit_scope()
{
    scope_stack.pop_back();
}

// 输入一个变量名, 返回其在当前作用域下重命名后的名字 (相当于加后缀)
string frontend::SymbolTable::get_scoped_name(string id) const
{
    return id + "_" + scope_stack.back().name;
}

// 输入一个变量名, 在符号表中寻找最近的同名变量, 返回对应的 Operand(注意，此 Operand 的 name 是重命名后的)
Operand frontend::SymbolTable::get_operand(string id) const
{
    for (auto it = scope_stack.rbegin(); it != scope_stack.rend(); ++it)
    {
        auto scope = *it;
        auto ste = scope.table.find(id);
        if (ste != scope.table.end())
        {
            return ste->second.operand;
        }
    }
    assert(0 && "get_operand failed");
}

// 输入一个变量名, 在符号表中寻找最近的同名变量, 返回 STE
frontend::STE frontend::SymbolTable::get_ste(string id) const
{
    for (auto it = scope_stack.rbegin(); it != scope_stack.rend(); ++it)
    {
        auto scope = *it;
        auto ste = scope.table.find(id);
        if (ste != scope.table.end())
        {
            return ste->second;
        }
    }
    assert(0 && "get_ste failed");
}

frontend::Analyzer::Analyzer() : tmp_cnt(0), symbol_table()
{
}

ir::Program frontend::Analyzer::get_ir_program(CompUnit *root)
{
    // 添加全局作用域
    symbol_table.add_scope("global");
    // 添加全局函数
    ir::Function *global_func = new ir::Function("global", ir::Type::null);
    symbol_table.functions["global"] = global_func;
    // 添加库函数
    auto lib_funcs = *get_lib_funcs();
    for (auto it = lib_funcs.begin(); it != lib_funcs.end(); it++)
        symbol_table.functions[it->first] = it->second;
    // 遍历AST，开始分析
    analysisCompUnit(root, ir_program);
    // 将全局变量的初始化指令加入到global函数中
    symbol_table.functions["global"]->InstVec.insert(symbol_table.functions["global"]->InstVec.end(), g_init_inst.begin(), g_init_inst.end());
    // 将全局变量加入到ir_program的globalVal中
    for (auto it = symbol_table.scope_stack[0].table.begin(); it != symbol_table.scope_stack[0].table.end(); it++)
    {
        if (it->second.dimension.size() != 0)
        {
            int arr_len = 1;
            for (int i = 0; i < it->second.dimension.size(); i++)
                arr_len *= it->second.dimension[i];
            // 添加重命名后的全局变量
            ir_program.globalVal.push_back({{it->second.operand.name, Type::IntPtr}, arr_len});
        }
        else
        {
            // 执行IR变量重命名, 并丢弃常量
            if (it->second.operand.type != Type::FloatLiteral && it->second.operand.type != Type::IntLiteral)
                ir_program.globalVal.push_back({{it->second.operand.name, it->second.operand.type}});
        }
    }
    // 为全局函数添加return
    ir::Instruction *globalreturn = new ir::Instruction(ir::Operand(),
                                                        ir::Operand(),
                                                        ir::Operand(), ir::Operator::_return);
    global_func->addInst(globalreturn);
    ir_program.addFunction(*global_func);
    // 在irprogram中main函数开头调用全局函数global
    ir::Operand op1 = {symbol_table.functions["global"]->name, ir::Type::null};
    ir::Operand returnval = {"t0", ir::Type::null};
    ir::CallInst *callinst = new ir::CallInst(op1, returnval);
    for (int i = 0; i < ir_program.functions.size(); i++)
    {
        if (ir_program.functions[i].name == "main")
        {
            ir_program.functions[i].InstVec.insert(ir_program.functions[i].InstVec.begin(), callinst);
            break;
        }
    }
    return ir_program;
}

Type frontend::Analyzer::trans2ptr(Type type)
{
    if (type == Type::Int)
        return Type::IntPtr;
    else if (type == Type::Float)
        return Type::FloatPtr;
    else
        return Type::null;
}

// CompUnit -> (Decl | FuncDef) [CompUnit]
void frontend::Analyzer::analysisCompUnit(CompUnit *root, ir::Program &)
{
    // CompUnit -> (Decl | FuncDef) [CompUnit]
    if (root->children.size() == 2)
    {
        // CompUnit -> Decl [CompUnit]
        if (dynamic_cast<Decl *>(root->children[0]))
        {
            auto decl = dynamic_cast<Decl *>(root->children[0]);
            assert(decl);
            analysisDecl(decl, g_init_inst);
        }
        // CompUnit -> FuncDef [CompUnit]
        else
        {
            auto funcdef = dynamic_cast<FuncDef *>(root->children[0]);
            assert(funcdef);
            ir::Function *function = new ir::Function();
            analysisFuncDef(funcdef, *function);
            ir_program.addFunction(*function);
        }
        analysisCompUnit(dynamic_cast<CompUnit *>(root->children[1]), ir_program);
    }
    // CompUnit -> (Decl | FuncDef)
    else
    {
        // CompUnit -> Decl
        if (dynamic_cast<Decl *>(root->children[0]))
        {
            auto node = dynamic_cast<Decl *>(root->children[0]);
            assert(node);
            analysisDecl(node, g_init_inst);
        }
        // CompUnit -> FuncDef
        else
        {
            auto node = dynamic_cast<FuncDef *>(root->children[0]);
            assert(node);
            ir::Function *function = new ir::Function();
            analysisFuncDef(node, *function);
            ir_program.addFunction(*function);
        }
    }
}

// Decl -> ConstDecl | VarDecl
void frontend::Analyzer::analysisDecl(Decl *root, vector<ir::Instruction *> &buffer)
{
    // Decl -> ConstDecl
    if (dynamic_cast<ConstDecl *>(root->children[0]))
    {
        ANALYSIS(constdecl, ConstDecl, 0);
    }
    // Decl -> VarDecl
    else
    {
        ANALYSIS(vardecl, VarDecl, 0);
    }
}

// ConstDecl -> 'const' BType ConstDef { ',' ConstDef } ';'
void frontend::Analyzer::analysisConstDecl(ConstDecl *root, vector<ir::Instruction *> &buffer)
{
    // ConstDecl -> 'const' BType ConstDef { ',' ConstDef } ';'
    GET_CHILD_PTR(btype, BType, 1);
    analysisBType(btype);
    for (int i = 2; i < root->children.size() - 1; i += 2)
    {
        ANALYSIS(constdef, ConstDef, i);
    }
}

// BType -> 'int' | 'float'
// BType.t
void frontend::Analyzer::analysisBType(BType *root)
{
    if (dynamic_cast<Term *>(root->children[0])->token.type == TokenType::INTTK)
        root->t = Type::Int;
    else
        root->t = Type::Float;
}

// ConstDef -> Ident { '[' ConstExp ']' } '=' ConstInitVal
// ConstDef.arr_name
void frontend::Analyzer::analysisConstDef(ConstDef *root, vector<ir::Instruction *> &buffer)
{
    GET_CHILD_PTR(ident, Term, 0);
    root->arr_name = ident->token.value;
    // 根据父节点中btype为int还是float来确定常量的类型
    Type consttype = dynamic_cast<BType *>(root->parent->children[1])->t;
    // 若是数组则类型为IntPtr
    if (root->children.size() > 1 && dynamic_cast<ConstExp *>(root->children[2]))
        consttype = Type::IntPtr;
    symbol_table.scope_stack.back().table.insert({root->arr_name, {{symbol_table.get_scoped_name(ident->token.value), consttype}}});
    for (int i = 2; i < root->children.size() - 1; i += 3)
    {
        if (dynamic_cast<ConstExp *>(root->children[i]))
        {
            ANALYSIS(constexp, ConstExp, i);
            symbol_table.scope_stack.back().table[ident->token.value].dimension.push_back(std::stoi(constexp->v));
        }
        else
        {
            break;
        }
    }
    ANALYSIS(constinitval, ConstInitVal, root->children.size() - 1);
    // ConstDef -> Ident { '[' ConstExp ']' } '=' ConstInitVal
    if (dynamic_cast<ConstExp *>(root->children[2]))
    {
        // 添加分配数组ir指令
        // 计算数组大小
        int arr_len = 1;
        for (int i = 0; i < symbol_table.scope_stack.back().table[ident->token.value].dimension.size(); i++)
            arr_len *= symbol_table.scope_stack.back().table[ident->token.value].dimension[i];
        Operand op1 = {std::to_string(arr_len), Type::IntLiteral};
        Operand des = {symbol_table.get_scoped_name(root->arr_name), Type::IntPtr};
        buffer.push_back(new Instruction({op1}, {}, des, Operator::alloc));
        // 按子节点constinitval->v中的值来添加初始化数组ir指令
        auto constinitval = dynamic_cast<ConstInitVal *>(root->children[root->children.size() - 1]);
        auto constinitval_v = constinitval->v;
        auto constinitval_t = constinitval->t;
        // 按逗号分割constinitval_v
        vector<string> constinitval_v_vec;
        int pos = 0;
        for (int i = 0; i < constinitval_v.size(); i++)
        {
            if (constinitval_v[i] == ',')
            {
                constinitval_v_vec.push_back(constinitval_v.substr(pos, i - pos));
                pos = i + 1;
            }
            if (i == constinitval_v.size() - 1)
                constinitval_v_vec.push_back(constinitval_v.substr(pos, i - pos + 1));
        }
        for (int i = 0; i < constinitval_v_vec.size(); i++)
        {
            Operand op1 = symbol_table.get_ste(root->arr_name).operand;
            Operand op2 = {std::to_string(i), Type::IntLiteral};
            Operand des = {constinitval_v_vec[i], Type::IntLiteral};
            buffer.push_back(new Instruction(op1, op2, des, Operator::store));
        }
    }
    // ConstDef -> Ident { '[' ConstExp ']' } '=' ConstInitVal
    else
    {
        symbol_table.varval.emplace(symbol_table.get_scoped_name(root->arr_name), constinitval->v);
        buffer.push_back(new Instruction({constinitval->v, constinitval->t}, {}, {symbol_table.get_operand(root->arr_name)}, Operator::def));
    }
}

// ConstInitVal -> ConstExp | '{' [ ConstInitVal { ',' ConstInitVal } ] '}'
// ConstInitVal.v
// ConstInitVal.t
void frontend::Analyzer::analysisConstInitVal(ConstInitVal *root, vector<ir::Instruction *> &buffer)
{
    // ConstInitVal -> ConstExp
    if (dynamic_cast<ConstExp *>(root->children[0]))
    {
        ANALYSIS(constexp, ConstExp, 0);
        root->v = constexp->v;
        root->t = constexp->t;
    }
    // ConstInitVal -> '{' [ ConstInitVal { ',' ConstInitVal } ] '}'
    else
    {
        // ConstInitVal -> '{' '}'
        if (root->children.size() == 2)
        {
            root->v = "";
            root->t = Type::null;
        }
        // ConstInitVal -> '{' ConstInitVal { ',' ConstInitVal } '}'
        else
        {
            ANALYSIS(constinitval, ConstInitVal, 1);
            root->v = constinitval->v;
            root->t = constinitval->t;
            for (int i = 3; i < root->children.size(); i += 2)
            {
                ANALYSIS(constinitval, ConstInitVal, i);
                root->v += "," + constinitval->v;
                root->t = constinitval->t;
            }
        }
    }
}

// VarDecl -> BType VarDef { ',' VarDef } ';'
// VarDecl.t
void frontend::Analyzer::analysisVarDecl(VarDecl *root, vector<ir::Instruction *> &buffer)
{
    GET_CHILD_PTR(btype, BType, 0);
    analysisBType(btype);
    for (int i = 1; i < root->children.size() - 1; i += 2)
    {
        ANALYSIS(vardef, VarDef, i);
        // 如果是数组，则ir不需要添加btype
        if (vardef->children.size() == 1 || !dynamic_cast<ConstExp *>(vardef->children[2]))
        {
            buffer.back()->des.type = btype->t;
        }
        if (buffer.back()->op1.type == Type::null)
        {
            buffer.back()->op1.type = Type::IntLiteral; // 定义变量时，如果没有初始化，则默认初始化为0
            buffer.back()->op1.name = "0";
        }
    }
}

// VarDef -> Ident { '[' ConstExp ']' } [ '=' InitVal ]
// VarDef.arr_name
void frontend::Analyzer::analysisVarDef(VarDef *root, vector<ir::Instruction *> &buffer)
{
    GET_CHILD_PTR(ident, Term, 0);
    root->arr_name = ident->token.value;
    Type consttype = dynamic_cast<BType *>(root->parent->children[0])->t;
    // 若是数组则类型为IntPtr
    if (root->children.size() > 1 && dynamic_cast<ConstExp *>(root->children[2]))
        consttype = Type::IntPtr;
    symbol_table.scope_stack.back().table.insert({root->arr_name, {{symbol_table.get_scoped_name(ident->token.value), consttype}}});
    for (int i = 2; i < root->children.size(); i += 3)
    {
        if (dynamic_cast<ConstExp *>(root->children[i]))
        {
            ANALYSIS(constexp, ConstExp, i);
            symbol_table.scope_stack.back().table[ident->token.value].dimension.push_back(std::stoi(constexp->v));
        }
        else
        {
            break;
        }
    }
    // VarDef -> Ident { '[' ConstExp ']' } '=' InitVal
    if (dynamic_cast<InitVal *>(root->children[root->children.size() - 1]))
    {
        ANALYSIS(initval, InitVal, root->children.size() - 1);
        // 添加定义变量def指令
        if (dynamic_cast<ConstExp *>(root->children[2]))
        {
            // 添加分配数组ir指令
            // 计算数组大小
            int arr_len = 1;
            for (int i = 0; i < symbol_table.scope_stack.back().table[ident->token.value].dimension.size(); i++)
                arr_len *= symbol_table.scope_stack.back().table[ident->token.value].dimension[i];
            Operand op1 = {std::to_string(arr_len), Type::IntLiteral};
            Operand des = {symbol_table.get_scoped_name(root->arr_name), Type::IntPtr};
            buffer.push_back(new Instruction({op1}, {}, des, Operator::alloc));
            // 按子节点initval->v中的值来添加初始化数组ir指令
            auto initval = dynamic_cast<InitVal *>(root->children[root->children.size() - 1]);
            auto initval_v = initval->v;
            auto initval_t = initval->t;
            // 按逗号分割initval_v
            vector<string> initval_v_vec;
            int pos = 0;
            for (int i = 0; i < initval_v.size(); i++)
            {
                if (initval_v[i] == ',')
                {
                    initval_v_vec.push_back(initval_v.substr(pos, i - pos));
                    pos = i + 1;
                }
                if (i == initval_v.size() - 1)
                    initval_v_vec.push_back(initval_v.substr(pos, i - pos + 1));
            }
            for (int i = 0; i < initval_v_vec.size(); i++)
            {
                Operand op1 = symbol_table.get_ste(root->arr_name).operand;
                Operand op2 = {std::to_string(i), Type::IntLiteral};
                Operand des = {initval_v_vec[i], Type::IntLiteral};
                buffer.push_back(new Instruction(op1, op2, des, Operator::store));
                symbol_table.varval.emplace(op1.name + "[" + op2.name + "]", des.name);
            }
            // 其他未赋值元素，默认赋值为0
            for (int i = initval_v_vec.size(); i < arr_len; i++)
            {
                Operand op1 = symbol_table.get_ste(root->arr_name).operand;
                Operand op2 = {std::to_string(i), Type::IntLiteral};
                Operand des = {"0", Type::IntLiteral};
                buffer.push_back(new Instruction(op1, op2, des, Operator::store));
                symbol_table.varval.emplace(op1.name + "[" + op2.name + "]", des.name);
            }
        }
        else
        {
            symbol_table.varval.emplace(symbol_table.get_scoped_name(root->arr_name), initval->v);
            buffer.push_back(new Instruction({initval->v, initval->t}, {}, {symbol_table.get_operand(root->arr_name)}, Operator::def));
        }
    }
    // VarDef -> Ident { '[' ConstExp ']' }
    else
    {
        // 添加定义数组def指令
        if (root->children.size() > 1)
        {
            // 添加分配数组ir指令
            // 计算数组大小
            int arr_len = 1;
            for (int i = 0; i < symbol_table.scope_stack.back().table[ident->token.value].dimension.size(); i++)
                arr_len *= symbol_table.scope_stack.back().table[ident->token.value].dimension[i];
            Operand op1 = {std::to_string(arr_len), Type::IntLiteral};
            Operand des = {symbol_table.get_scoped_name(root->arr_name), Type::IntPtr};
            buffer.push_back(new Instruction({op1}, {}, des, Operator::alloc));
            // 如果是全局变量，则添加初始化指令，数组元素初始化为0
            if (symbol_table.scope_stack.size() == 1)
            {
                for (int i = 0; i < arr_len; i++)
                {
                    Operand op1 = symbol_table.get_ste(root->arr_name).operand;
                    Operand op2 = {std::to_string(i), Type::IntLiteral};
                    Operand des = {"0", Type::IntLiteral};
                    buffer.push_back(new Instruction(op1, op2, des, Operator::store));
                    symbol_table.varval.emplace(op1.name + "[" + op2.name + "]", des.name);
                }
            }
        }
        else    // 添加定义变量def指令
            buffer.push_back(new Instruction({}, {}, {symbol_table.get_operand(root->arr_name)}, Operator::def));
    }
}

// InitVal -> Exp | '{' [ InitVal { ',' InitVal } ] '}'
// InitVal.is_computable
// InitVal.v
// InitVal.t
void frontend::Analyzer::analysisInitVal(InitVal *root, vector<ir::Instruction *> &buffer)
{
    // InitVal -> Exp
    if (dynamic_cast<Exp *>(root->children[0]))
    {
        ANALYSIS(exp, Exp, 0);
        COPY_EXP_NODE(exp, root);
    }
    // InitVal -> '{' [ InitVal { ',' InitVal } ] '}'
    else
    {
        // InitVal -> '{' '}'
        if (root->children.size() == 2)
        {
            root->is_computable = true;
            root->v = "";
            root->t = Type::null;
        }
        // InitVal -> '{' InitVal { ',' InitVal } '}'
        else
        {
            ANALYSIS(initval, InitVal, 1);
            root->is_computable = initval->is_computable;
            root->v = initval->v;
            root->t = initval->t;
            for (int i = 3; i < root->children.size(); i += 2)
            {
                ANALYSIS(initval, InitVal, i);
                root->is_computable = root->is_computable && initval->is_computable;
                root->v += "," + initval->v;
                root->t = initval->t;
            }
        }
    }
}

// FuncDef -> FuncType Ident '(' [FuncFParams] ')' Block
// FuncDef.t
// FuncDef.n
void frontend::Analyzer::analysisFuncDef(FuncDef *root, ir::Function &function)
{
    GET_CHILD_PTR(functype, FuncType, 0);
    analysisFuncType(functype);
    GET_CHILD_PTR(ident, Term, 1);
    root->n = ident->token.value;
    root->t = functype->t;
    function.name = root->n;
    function.returnType = root->t;
    symbol_table.add_scope(root->n); // 添加block作用域，名称为函数名
    symbol_table.functions.insert({root->n, &function});
    auto params = dynamic_cast<FuncFParams *>(root->children[3]);
    if (params)
    {
        analysisFuncFParams(params, function);
        analysisBlock(dynamic_cast<Block *>(root->children[5]), function.InstVec);
    }
    else
    {
        analysisBlock(dynamic_cast<Block *>(root->children[4]), function.InstVec);
    }
    // 如果函数没有返回值，则在函数末尾添加空return指令，避免退出时跳错地址，比如62_percolation.sy
    if (function.returnType == Type::null)
    {
        ir::Instruction *returninst = new ir::Instruction(ir::Operand(),
                                                          ir::Operand(),
                                                          ir::Operand(), ir::Operator::_return);
        function.addInst(returninst);
    }
    symbol_table.exit_scope();
}

// FuncType -> 'void' | 'int' | 'float'
void frontend::Analyzer::analysisFuncType(FuncType *root)
{
    // FuncType -> 'void'
    if (dynamic_cast<Term *>(root->children[0])->token.type == TokenType::VOIDTK)
    {
        root->t = Type::null;
    }
    // FuncType -> 'int'
    else if (dynamic_cast<Term *>(root->children[0])->token.type == TokenType::INTTK)
    {
        root->t = Type::Int;
    }
    // FuncType -> 'float'
    else
    {
        root->t = Type::Float;
    }
}

// FuncFParam -> BType Ident ['[' ']' { '[' Exp ']' }]
void frontend::Analyzer::analysisFuncFParam(FuncFParam *root, ir::Function &function)
{
    // FuncFParam -> BType Ident
    if (root->children.size() == 2)
    {
        GET_CHILD_PTR(btype, BType, 0);
        analysisBType(btype);
        GET_CHILD_PTR(ident, Term, 1);
        function.ParameterList.push_back({symbol_table.get_scoped_name(ident->token.value), btype->t});
        symbol_table.scope_stack.back().table.insert({ident->token.value, {{symbol_table.get_scoped_name(ident->token.value), btype->t}}});
    }
    // FuncFParam -> BType Ident '[' ']' { '[' Exp ']' }
    else
    {
        GET_CHILD_PTR(btype, BType, 0);
        analysisBType(btype);
        GET_CHILD_PTR(ident, Term, 1);
        function.ParameterList.push_back({symbol_table.get_scoped_name(ident->token.value), trans2ptr(btype->t)});
        symbol_table.scope_stack.back().table.insert({ident->token.value,
                                                      {{symbol_table.get_scoped_name(ident->token.value),
                                                        trans2ptr(btype->t)}}});
        for (int i = 5; i < root->children.size(); i += 3)
        {
            if (dynamic_cast<Exp *>(root->children[i]))
            {
                GET_CHILD_PTR(exp, Exp, i);
                analysisExp(exp, function.InstVec);
                symbol_table.scope_stack.back().table[ident->token.value].dimension.push_back(std::stoi(exp->v));
            }
            else
            {
                break;
            }
        }
    }
}

// FuncFParams -> FuncFParam { ',' FuncFParam }
void frontend::Analyzer::analysisFuncFParams(FuncFParams *root, ir::Function &function)
{
    for (int i = 0; i < root->children.size(); i += 2)
    {
        GET_CHILD_PTR(funcfparam, FuncFParam, i);
        analysisFuncFParam(funcfparam, function);
    }
}

// Block -> '{' { BlockItem } '}'
void frontend::Analyzer::analysisBlock(Block *root, vector<ir::Instruction *> &buffer)
{
    for (int i = 1; i < root->children.size() - 1; i++)
    {
        ANALYSIS(blockitem, BlockItem, i);
        for (auto it = blockitem->jump_bow.begin(); it != blockitem->jump_bow.end(); it++)
            root->jump_bow.emplace(*it);
        for (auto it = blockitem->jump_eow.begin(); it != blockitem->jump_eow.end(); it++)
            root->jump_eow.emplace(*it);
    }
}

// BlockItem -> Decl | Stmt
void frontend::Analyzer::analysisBlockItem(BlockItem *root, vector<ir::Instruction *> &buffer)
{
    // BlockItem -> Decl
    if (dynamic_cast<Decl *>(root->children[0]))
    {
        ANALYSIS(decl, Decl, 0);
    }
    // BlockItem -> Stmt
    else
    {
        ANALYSIS(stmt, Stmt, 0);
        root->jump_eow = stmt->jump_eow;
        root->jump_bow = stmt->jump_bow;
    }
}

// Stmt -> LVal '=' Exp ';' | Block | 'if' '(' Cond ')' Stmt [ 'else' Stmt ] | 'while' '(' Cond ')' Stmt | 'break' ';' | 'continue' ';' | 'return' [Exp] ';' | [Exp] ';'
void frontend::Analyzer::analysisStmt(Stmt *root, vector<ir::Instruction *> &buffer)
{
    // Stmt -> LVal '=' Exp ';'
    if (dynamic_cast<LVal *>(root->children[0]))
    {
        GET_CHILD_PTR(lval, LVal, 0);
        analysisLVal(lval, buffer);
        GET_CHILD_PTR(exp, Exp, 2);
        analysisExp(exp, buffer);
        if (symbol_table.varval.find(lval->v) != symbol_table.varval.end() && symbol_table.scope_stack.size() == 1)
        {
            symbol_table.varval[lval->v] = exp->v;
        }
        if (lval->children.size() > 1)  // 数组赋值
        {
            Operand op1 = symbol_table.get_ste(dynamic_cast<Term *>(lval->children[0])->token.value).operand;
            Operand des = {exp->v, exp->t};
            if(lval->i==-1)
            {
                Operand op2 = {lval->v, lval->t};
                buffer.push_back(new Instruction(op1, op2, des, Operator::store));
            }
            else
            {
                Operand op2 = {std::to_string(lval->i), Type::IntLiteral};
                buffer.push_back(new Instruction(op1, op2, des, Operator::store));
            }
        }
        else    // 变量赋值
        {
            Operand op1 = {exp->v, exp->t};
            Operand des = {lval->v, lval->t};
            buffer.push_back(new Instruction(op1, {}, des, Operator::mov)); //给变量赋值
        }
    }
    // Stmt -> Block
    else if (dynamic_cast<Block *>(root->children[0]))
    {
        auto signal = dynamic_cast<Term *>(root->parent->children[0]);
        if (signal != nullptr)
        {
            if (signal->token.type == TokenType::WHILETK)
                symbol_table.add_scope("while");
            else if (signal->token.type == TokenType::IFTK)
                symbol_table.add_scope("if");
            else
                symbol_table.add_scope("else");
        }
        else
        {
            symbol_table.add_scope("else");
        }
        GET_CHILD_PTR(block, Block, 0);
        analysisBlock(block, buffer);
        root->jump_bow = block->jump_bow;
        root->jump_eow = block->jump_eow;
        // 如果是while块且有需要回填的指令，则计算回填的地址
        if (symbol_table.scope_stack.back().name.substr(0, 5) == "while")
        {
            if (!root->jump_eow.empty())
            {
                int jump_eow_addr = 0;
                for (auto it = root->jump_eow.begin(); it != root->jump_eow.end(); it++)
                {
                    // 找到jump_eow中指令在buffer中的索引
                    int index = 0;
                    for (auto it2 = buffer.begin(); it2 != buffer.end(); it2++)
                    {
                        if (*it == *it2)
                        {
                            jump_eow_addr = index;
                            break;
                        }
                        index++;
                    }
                    // buffer大小减去jump_eow_addr，得到回填地址
                    (*it)->des.name = std::to_string(buffer.size() - jump_eow_addr + 1);
                    (*it)->des.type = Type::IntLiteral;
                }
            }
            if (!root->jump_bow.empty())
            {
                int jump_bow_addr = 0;
                for (auto it = root->jump_bow.begin(); it != root->jump_bow.end(); it++)
                {
                    // 找到jump_bow中指令在buffer中的索引
                    int index = 0;
                    for (auto it2 = buffer.begin(); it2 != buffer.end(); it2++)
                    {
                        if (*it == *it2)
                        {
                            jump_bow_addr = index;
                            break;
                        }
                        index++;
                    }
                    // buffer大小减去jump_bow_addr，得到回填地址
                    (*it)->des.name = std::to_string(-jump_bow_addr);
                    (*it)->des.type = Type::IntLiteral;
                }
            }
            {

            }
        }
        symbol_table.exit_scope();
    }
    // Stmt -> 'if' '(' Cond ')' Stmt [ 'else' Stmt ]
    else if (dynamic_cast<Term *>(root->children[0]) && dynamic_cast<Term *>(root->children[0])->token.type == TokenType::IFTK)
    {
        // symbol_table.scope_stack.back().name = "if_" + std::to_string(symbol_table.block_cnt);
        GET_CHILD_PTR(cond, Cond, 2);
        // cond中涉及的跳转已在LOrExp中分析
        analysisCond(cond, buffer);
        GET_CHILD_PTR(stmt1, Stmt, 4);
        vector<ir::Instruction *> buffer1; // 用于存储stmt1中的指令
        analysisStmt(stmt1, buffer1);
        root->jump_bow = stmt1->jump_bow;
        root->jump_eow = stmt1->jump_eow;
        buffer.push_back(new Instruction({cond->v, Type::Int}, {}, {"2", Type::IntLiteral}, Operator::_goto));
        buffer.push_back(new Instruction({}, {}, {std::to_string(buffer1.size() + 1), Type::IntLiteral}, Operator::_goto)); // 条件为false跳过stmt1
        buffer.insert(buffer.end(), buffer1.begin(), buffer1.end());
        // Stmt -> 'if' '(' Cond ')' Stmt [ 'else' Stmt ]
        if (root->children.size() == 7)
        {
            vector<ir::Instruction *> buffer2; // 用于存储stmt2中的指令
            GET_CHILD_PTR(stmt2, Stmt, 6);
            analysisStmt(stmt2, buffer2);
            for (auto it = stmt2->jump_bow.begin(); it != stmt2->jump_bow.end(); it++)
                root->jump_bow.emplace(*it);
            for (auto it = stmt2->jump_eow.begin(); it != stmt2->jump_eow.end(); it++)
                root->jump_eow.emplace(*it);
            buffer.push_back(new Instruction({cond->v, Type::Int}, {}, {std::to_string(buffer2.size() + 1), Type::IntLiteral}, Operator::_goto));
            buffer.insert(buffer.end(), buffer2.begin(), buffer2.end());
            buffer.push_back(new Instruction({}, {}, {}, Operator::__unuse__)); 
        }
    }
    // Stmt -> 'while' '(' Cond ')' Stmt
    else if (dynamic_cast<Term *>(root->children[0]) && dynamic_cast<Term *>(root->children[0])->token.type == TokenType::WHILETK)
    {
        // symbol_table.scope_stack.back().name = "while_" + std::to_string(symbol_table.block_cnt);
        vector<ir::Instruction *> buffer_cond;
        vector<ir::Instruction *> buffer_while;
        GET_CHILD_PTR(cond, Cond, 2);
        analysisCond(cond, buffer_cond);
        GET_CHILD_PTR(stmt, Stmt, 4);
        analysisStmt(stmt, buffer_while);
        root->jump_eow = stmt->jump_eow; // 把stmt中的跳转指令加入到root中
        // 为了获得while块的条数，以便cond判断跳出，所以从头部插入
        buffer_while.insert(buffer_while.begin(), new Instruction({}, {}, {std::to_string(int(buffer_while.size()) + 2), Type::IntLiteral}, Operator::_goto)); // 不满足跳出循环
        buffer_while.insert(buffer_while.begin(), new Instruction({cond->v, cond->t}, {}, {"2", Type::IntLiteral}, Operator::_goto));
        buffer_while.insert(buffer_while.begin(), buffer_cond.begin(), buffer_cond.end());                                               // buffer.size()是无符号整数，需要转换一下
        buffer_while.push_back(new Instruction({}, {}, {std::to_string(-int(buffer_while.size())), Type::IntLiteral}, Operator::_goto)); // 跳回while块的第一个语句
        buffer.insert(buffer.end(), buffer_while.begin(), buffer_while.end());
    }
    // Stmt -> 'break' ';'
    else if (dynamic_cast<Term *>(root->children[0]) && dynamic_cast<Term *>(root->children[0])->token.type == TokenType::BREAKTK)
    {
        // 记录当前buffer的大小
        int buffer_size = buffer.size();
        // 把待填跳转指令放入jump_eow
        auto *breakir = new Instruction({}, {}, {}, Operator::_goto);
        root->jump_eow.emplace(breakir);
        buffer.push_back(breakir);
    }
    // Stmt -> 'continue' ';'
    else if (dynamic_cast<Term *>(root->children[0]) && dynamic_cast<Term *>(root->children[0])->token.type == TokenType::CONTINUETK)
    {
        // 记录一下当前buffer的大小
        int buffer_size = buffer.size();
        // 把待填跳转指令放入jump_eow
        auto *continueir = new Instruction({}, {}, {}, Operator::_goto);
        root->jump_bow.emplace(continueir);
        buffer.push_back(continueir);
    }
    // Stmt -> 'return' [Exp] ';'
    else if (dynamic_cast<Term *>(root->children[0]) && dynamic_cast<Term *>(root->children[0])->token.type == TokenType::RETURNTK)
    {
        if (root->children.size() == 3)
        {
            GET_CHILD_PTR(exp, Exp, 1);
            analysisExp(exp, buffer);
            Operand op1 = {exp->v, exp->t};
            buffer.push_back(new Instruction({op1, {}, {}, Operator::_return}));
        }
        else
        {
            buffer.push_back(new Instruction({}, {}, {}, Operator::_return));
        }
    }
    //  Stmt -> [Exp] ';'
    else
    {
        if (root->children.size() == 2)
        {
            GET_CHILD_PTR(exp, Exp, 0);
            analysisExp(exp, buffer);
        }
    }
}

// Exp -> AddExp
// Exp.is_computable
// Exp.v
// Exp.t
void frontend::Analyzer::analysisExp(Exp *root, vector<ir::Instruction *> &buffer)
{
    ANALYSIS(addexp, AddExp, 0);
    COPY_EXP_NODE(addexp, root);
}

// Cond -> LOrExp
// Cond.is_computable
// Cond.v
// Cond.t
void frontend::Analyzer::analysisCond(Cond *root, vector<ir::Instruction *> &buffer)
{
    ANALYSIS(lorexp, LOrExp, 0);
    COPY_EXP_NODE(lorexp, root);
}

// LVal -> Ident {'[' Exp ']'}
// LVal.is_computable
// LVal.v
// LVal.t
// LVal.i
void frontend::Analyzer::analysisLVal(LVal *root, vector<ir::Instruction *> &buffer)
{
    GET_CHILD_PTR(ident, Term, 0);
    Operand real_ident = symbol_table.get_ste(ident->token.value).operand; // 实际参与运算的变量
    root->v = real_ident.name;
    root->t = real_ident.type;
    vector<string> index;
    for (int i = 2; i < root->children.size(); i += 3)
    {
        GET_CHILD_PTR(exp, Exp, i);
        analysisExp(exp, buffer);
        if (symbol_table.scope_stack.back().name.substr(0, 5) == "global")
        {
            int tmp;
            if (symbol_table.varval.find(exp->v) != symbol_table.varval.end())
                tmp = std::stoi(symbol_table.varval[exp->v]);
            else
                tmp = std::stoi(exp->v);
            index.push_back(std::to_string(tmp));
        }
        else
            index.push_back(exp->v);
    }
    bool flag = 0;  //索引中是否有变量
    bool index_is_computable[index.size()] = {true};
    for (int i = 0; i < index.size(); i++)
    {
        // 如果该位置索引是变量,即判断index[i]是否是整数
        for (auto j : index[i])
            if (!isdigit(j))
            {
                flag = 1;
                index_is_computable[i] = false;
                break;
            }
    }
    if (flag)
    {
        // 计算多维数组的偏移量(索引中含变量)
        root->i = -1; // 标识一下，方便处理父节点
        Operand rst = {"t" + std::to_string(tmp_cnt++), Type::Int};
        buffer.push_back(new Instruction({{"0", Type::IntLiteral}, {}, rst, Operator::def}));
        for (int i = 0; i < index.size(); i++)
        {
            int arr_len = 1;
            for (int j = i + 1; j < index.size(); j++)
                arr_len *= symbol_table.get_ste(ident->token.value).dimension[j];
            Operand op2 = {"t" + std::to_string(tmp_cnt++), Type::Int};
            buffer.push_back(new Instruction({{std::to_string(arr_len), Type::IntLiteral}, {}, op2, Operator::def}));
            Operand op1 = {index[i], index_is_computable[i] ? Type::IntLiteral : Type::Int};
            Operand des = {"t" + std::to_string(tmp_cnt++), Type::Int};
            buffer.push_back(new Instruction({op1, op2, des, Operator::mul}));
            buffer.push_back(new Instruction({rst, des, rst, Operator::add}));
        }
        if (dynamic_cast<PrimaryExp *>(root->parent))
        {
            // load
            Operand op1 = {root->v, Type::IntPtr};
            Operand des = {"t" + std::to_string(tmp_cnt++), Type::Int};
            root->v = des.name;
            root->t = des.type;
            buffer.push_back(new Instruction(op1, rst, des, Operator::load));
        }
        else
        {
            root->v = rst.name;
            root->t = rst.type;
        }
    }
    else
    {
        // 计算多维数组的偏移量
        int offset = 0;
        for (int i = 0; i < index.size(); i++)
        {
            int arr_len = 1;
            for (int j = i + 1; j < index.size(); j++)
                arr_len *= symbol_table.get_ste(ident->token.value).dimension[j];
            offset += stoi(index[i]) * arr_len;
        }
        root->i = offset;
        if (dynamic_cast<PrimaryExp *>(root->parent))
        {
            // 如果是数组，则添加load指令
            if (root->children.size() > 1)
            {
                // 判断
                Operand op1 = {root->v, Type::IntPtr};
                Operand op2 = {std::to_string(root->i), Type::IntLiteral};
                Operand des = {"t" + std::to_string(tmp_cnt++), Type::Int};
                root->v = des.name;
                root->t = des.type;
                buffer.push_back(new Instruction(op1, op2, des, Operator::load));
                symbol_table.varval.emplace(des.name, symbol_table.varval[op1.name + "[" + op2.name + "]"]);
            }
        }
    }
}

// Number -> IntConst | floatConst
// Number.is_computable
// Number.v
// Number.t
void frontend::Analyzer::analysisNumber(Number *root, vector<ir::Instruction *> &buffer)
{
    // Number -> IntConst
    if (dynamic_cast<Term *>(root->children[0])->token.type == TokenType::INTLTR)
    {
        root->is_computable = true;
        root->v = dynamic_cast<Term *>(root->children[0])->token.value;
        root->t = Type::IntLiteral;
    }
    // Number -> floatConst
    else
    {
        root->is_computable = true;
        root->v = dynamic_cast<Term *>(root->children[0])->token.value;
        root->t = Type::FloatLiteral;
    }
}

// PrimaryExp -> '(' Exp ')' | LVal | Number
// PrimaryExp.is_computable
// PrimaryExp.v
// PrimaryExp.t
void frontend::Analyzer::analysisPrimaryExp(PrimaryExp *root, vector<ir::Instruction *> &buffer)
{
    // PrimaryExp -> Number
    if (dynamic_cast<Number *>(root->children[0]))
    {
        ANALYSIS(number, Number, 0);
        COPY_EXP_NODE(number, root);
    }
    // PrimaryExp -> LVal
    else if (dynamic_cast<LVal *>(root->children[0]))
    {
        ANALYSIS(lval, LVal, 0);
        COPY_EXP_NODE(lval, root);
    }
    // PrimaryExp -> '(' Exp ')'
    else
    {
        ANALYSIS(exp, Exp, 1);
        COPY_EXP_NODE(exp, root);
    }
}

// UnaryExp -> PrimaryExp | Ident '(' [FuncRParams] ')' | UnaryOp UnaryExp
// UnaryExp.is_computable
// UnaryExp.v
// UnaryExp.t
void frontend::Analyzer::analysisUnaryExp(UnaryExp *root, vector<ir::Instruction *> &buffer)
{
    // UnaryExp -> PrimaryExp
    if (dynamic_cast<PrimaryExp *>(root->children[0]))
    {
        ANALYSIS(primaryexp, PrimaryExp, 0);
        COPY_EXP_NODE(primaryexp, root);
    }
    else if (root->children.size() > 2)
    {
        // UnaryExp -> Ident '(' ')' 没有参数情况
        if (root->children.size() == 3)
        {
            GET_CHILD_PTR(ident, Term, 0);
            auto func = symbol_table.functions[ident->token.value];
            root->v = "t" + std::to_string(tmp_cnt++);
            root->t = func->returnType;
            Operand op1 = {func->name, Type::null};
            Operand returnval = {root->v, root->t};
            ir::CallInst *callinst = new ir::CallInst(op1, returnval);
            buffer.push_back(callinst);
        }
        // UnaryExp -> Ident '(' [FuncRParams] ')'
        else
        {
            GET_CHILD_PTR(ident, Term, 0);
            auto func = symbol_table.functions[ident->token.value];
            root->v = "t" + std::to_string(tmp_cnt++);
            root->t = func->returnType;
            Operand op1 = {func->name, func->returnType};
            Operand returnval = {root->v, root->t};
            // UnaryExp -> Ident '(' ')' 无参数情况
            if (root->children.size() == 3)
            {
                ir::CallInst *callinst = new ir::CallInst(op1, returnval);
                buffer.push_back(callinst);
            }
            // UnaryExp -> Ident '(' [FuncRParams] ')'
            else
            {
                GET_CHILD_PTR(funcrparams, FuncRParams, 2);
                ir::CallInst *callinst = new ir::CallInst(op1, returnval);
                analysisFuncRParams(funcrparams, buffer, *callinst);
                buffer.push_back(callinst);
            }
        }
    }
    // UnaryExp -> UnaryOp UnaryExp
    else
    {
        GET_CHILD_PTR(unaryop, UnaryOp, 0);
        analysisUnaryOp(unaryop);
        ANALYSIS(unaryexp, UnaryExp, 1);
        if (unaryop->op == TokenType::PLUS)
        {
            root->v = unaryexp->v;
        }
        else if (unaryop->op == TokenType::MINU)
        {
            if (unaryexp->t == Type::Int || unaryexp->t == Type::Float)
            {
                root->v = "t" + std::to_string(tmp_cnt++);
                Operand op2 = {unaryexp->v, unaryexp->t};
                Operand des = {root->v, root->t};
                // 先定义一个临时变量赋值为0最为被减数
                buffer.push_back(new Instruction({{"0", Type::IntLiteral}, {}, des, Operator::mov}));
                // 0减去本身，求的相反数
                buffer.push_back(new Instruction({des, {op2}, des, Operator::sub}));
            }
            else
            {
                root->v = std::to_string(-std::stoi(unaryexp->v));
                root->t = Type::IntLiteral;
            }
        }
        else
        {
            root->v = "t" + std::to_string(tmp_cnt++);
            root->t = Type::Int;
            Operand op1 = {unaryexp->v, unaryexp->t};
            Operand des = {root->v, root->t};
            buffer.push_back(new Instruction({op1, {}, des, Operator::_not}));
        }
    }
}

// UnaryOp -> '+' | '-' | '!'
void frontend::Analyzer::analysisUnaryOp(UnaryOp *root)
{
    // UnaryOp -> '+'
    if (dynamic_cast<Term *>(root->children[0])->token.type == TokenType::PLUS)
    {
        root->op = TokenType::PLUS;
    }
    // UnaryOp -> '-'
    else if (dynamic_cast<Term *>(root->children[0])->token.type == TokenType::MINU)
    {
        root->op = TokenType::MINU;
    }
    // UnaryOp -> '!'
    else
    {
        root->op = TokenType::NOT;
    }
}

// FuncRParams -> Exp { ',' Exp }
void frontend::Analyzer::analysisFuncRParams(FuncRParams *root, vector<ir::Instruction *> &buffer, ir::CallInst &callinst)
{
    for (int i = 0; i < root->children.size(); i += 2)
    {
        ANALYSIS(exp, Exp, i);
        Operand op1 = {exp->v, exp->t};
        callinst.argumentList.push_back(op1);
    }
}

// MulExp -> UnaryExp { ('*' | '/' | '%') UnaryExp }
// MulExp.is_computable
// MulExp.v
// MulExp.t
void frontend::Analyzer::analysisMulExp(MulExp *root, vector<ir::Instruction *> &buffer)
{
    ANALYSIS(unaryexp, UnaryExp, 0);
    COPY_EXP_NODE(unaryexp, root);
    Operand op1 = {unaryexp->v, unaryexp->t};
    for (int i = 1; i < root->children.size(); i += 2)
    {
        auto tmp = vector<Instruction *>();
        auto unaryexp = dynamic_cast<UnaryExp *>(root->children[i + 1]);
        assert(unaryexp);
        analysisUnaryExp(unaryexp, tmp);
        // tmp中的ir指令添加到buffer中
        for (auto inst : tmp)
            buffer.push_back(inst);
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = Type::Int;
        Operand op2 = {unaryexp->v, unaryexp->t};
        Operand des = {root->v, root->t};
        if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::MULT)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::mul}));
            // 计算目标变量的值，存入varval
            if (symbol_table.scope_stack.size() == 1)
            {
                int a, b; // 表示两个操作数的真实值
                if (op1.type == Type::Int && symbol_table.varval.find(op1.name) != symbol_table.varval.end())
                    a = std::stoi(symbol_table.varval[op1.name]);
                else
                    a = std::stoi(op1.name);
                if (op2.type == Type::Int && symbol_table.varval.find(op2.name) != symbol_table.varval.end())
                    b = std::stoi(symbol_table.varval[op2.name]);
                else
                    b = std::stoi(op2.name);
                symbol_table.varval[des.name] = std::to_string(a * b);
            }
            op1 = {root->v, root->t}; // op1 = op1 * op2, 将op1做为上一次计算的结果
        }
        else if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::DIV)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::div}));
            // 计算目标变量的值，存入varval
            if (symbol_table.scope_stack.size() == 1)
            {
                int a, b;
                if (op1.type == Type::Int && symbol_table.varval.find(op1.name) != symbol_table.varval.end())
                    a = std::stoi(symbol_table.varval[op1.name]);
                else
                    a = std::stoi(op1.name);
                if (op2.type == Type::Int && symbol_table.varval.find(op2.name) != symbol_table.varval.end())
                    b = std::stoi(symbol_table.varval[op2.name]);
                else
                    b = std::stoi(op2.name);
                symbol_table.varval[des.name] = std::to_string(a / b);
            }
            op1 = {root->v, root->t}; // op1 = op1 / op2, 将op1做为上一次计算的结果
        }
        else
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::mod}));
            // 计算目标变量的值，存入varval
            if (symbol_table.scope_stack.size() == 1)
            {
                int a, b;
                if (op1.type == Type::Int && symbol_table.varval.find(op1.name) != symbol_table.varval.end())
                    a = std::stoi(symbol_table.varval[op1.name]);
                else
                    a = std::stoi(op1.name);
                if (op2.type == Type::Int && symbol_table.varval.find(op2.name) != symbol_table.varval.end())
                    b = std::stoi(symbol_table.varval[op2.name]);
                else
                    b = std::stoi(op2.name);
                symbol_table.varval[des.name] = std::to_string(a % b);
            }
            op1 = {root->v, root->t}; // op1 = op1 % op2, 将op1做为上一次计算的结果
        }
    }
}

// AddExp -> MulExp { ('+' | '-') MulExp }
// AddExp.is_computable
// AddExp.v
// AddExp.t
void frontend::Analyzer::analysisAddExp(AddExp *root, vector<ir::Instruction *> &buffer)
{
    ANALYSIS(mulexp, MulExp, 0);
    COPY_EXP_NODE(mulexp, root);
    Operand op1 = {mulexp->v, mulexp->t};
    for (int i = 1; i < root->children.size(); i += 2)
    {
        auto tmp = vector<Instruction *>();
        auto mulexp = dynamic_cast<MulExp *>(root->children[i + 1]);
        assert(mulexp);
        analysisMulExp(mulexp, tmp);
        // tmp中的ir指令添加到buffer中
        for (auto inst : tmp)
            buffer.push_back(inst);
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = Type::Int;
        Operand op2 = {mulexp->v, mulexp->t};
        Operand des = {root->v, root->t};
        if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::PLUS)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::add}));
            // 计算目标变量的值，存入varval
            if (symbol_table.scope_stack.size() == 1)
            {
                int a, b;
                if (op1.type == Type::Int && symbol_table.varval.find(op1.name) != symbol_table.varval.end())
                    a = std::stoi(symbol_table.varval[op1.name]);
                else
                    a = std::stoi(op1.name);
                if (op2.type == Type::Int && symbol_table.varval.find(op2.name) != symbol_table.varval.end())
                    b = std::stoi(symbol_table.varval[op2.name]);
                else
                    b = std::stoi(op2.name);
                symbol_table.varval[des.name] = std::to_string(a + b);
            }
            op1 = {root->v, root->t}; // op1 = op1 + op2, 将op1做为上一次计算的结果
        }
        else
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::sub}));
            // 计算目标变量的值，存入varval
            if (symbol_table.scope_stack.size() == 1)
            {
                int a, b;
                if (op1.type == Type::Int && symbol_table.varval.find(op1.name) != symbol_table.varval.end())
                    a = std::stoi(symbol_table.varval[op1.name]);
                else
                    a = std::stoi(op1.name);
                if (op2.type == Type::Int && symbol_table.varval.find(op2.name) != symbol_table.varval.end())
                    b = std::stoi(symbol_table.varval[op2.name]);
                else
                    b = std::stoi(op2.name);
                symbol_table.varval[des.name] = std::to_string(a - b);
            }
            op1 = {root->v, root->t}; // op1 = op1 - op2,将op1做为上一次计算的结果
        }
    }
}

// RelExp -> AddExp { ('<' | '>' | '<=' | '>=') AddExp }
// RelExp.is_computable
// RelExp.v
// RelExp.t
void frontend::Analyzer::analysisRelExp(RelExp *root, vector<ir::Instruction *> &buffer)
{
    ANALYSIS(addexp, AddExp, 0);
    COPY_EXP_NODE(addexp, root);
    Operand op1 = {addexp->v, addexp->t};
    for (int i = 1; i < root->children.size(); i += 2)
    {
        auto tmp = vector<Instruction *>();
        auto addexp = dynamic_cast<AddExp *>(root->children[i + 1]);
        assert(addexp);
        analysisAddExp(addexp, tmp);
        // tmp中的ir指令添加到buffer中
        for (auto inst : tmp)
            buffer.push_back(inst);
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = Type::Int;
        Operand op2 = {addexp->v, addexp->t};
        Operand des = {root->v, root->t};
        if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::LSS)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::lss}));
            op1 = {root->v, root->t}; // op1 = op1 < op2, 将op1做为上一次计算的结果
        }
        else if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::LEQ)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::leq}));
            op1 = {root->v, root->t}; // op1 = op1 <= op2, 将op1做为上一次计算的结果
        }
        else if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::GTR)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::gtr}));
            op1 = {root->v, root->t}; // op1 = op1 > op2, 将op1做为上一次计算的结果
        }
        else
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::geq}));
            op1 = {root->v, root->t}; // op1 = op1 >= op2, 将op1做为上一次计算的结果
        }
    }
}

// EqExp -> RelExp { ('==' | '!=') RelExp }
// EqExp.is_computable
// EqExp.v
// EqExp.t
void frontend::Analyzer::analysisEqExp(EqExp *root, vector<ir::Instruction *> &buffer)
{
    ANALYSIS(relexp, RelExp, 0);
    COPY_EXP_NODE(relexp, root);
    Operand op1 = {relexp->v, relexp->t};
    for (int i = 1; i < root->children.size(); i += 2)
    {
        auto tmp = vector<Instruction *>();
        auto relexp = dynamic_cast<RelExp *>(root->children[i + 1]);
        assert(relexp);
        analysisRelExp(relexp, tmp);
        // tmp中的ir指令添加到buffer中
        for (auto inst : tmp)
            buffer.push_back(inst);
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = Type::Int;
        Operand op2 = {relexp->v, relexp->t};
        Operand des = {root->v, root->t};
        if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::EQL)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::eq}));
        }
        else
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::neq}));
        }
    }
}

// LAndExp -> EqExp [ '&&' LAndExp ]
// LAndExp.is_computable
// LAndExp.v
// LAndExp.t
void frontend::Analyzer::analysisLAndExp(LAndExp *root, vector<ir::Instruction *> &buffer)
{
    // LAndExp -> EqExp
    if (root->children.size() == 1)
    {
        ANALYSIS(node, EqExp, 0);
        COPY_EXP_NODE(node, root);
    }
    // LAndExp -> EqExp '&&' LAndExp
    else
    {
        ANALYSIS(eqexp, EqExp, 0);
        auto tmp = vector<Instruction *>();
        auto landexp = dynamic_cast<LAndExp *>(root->children[2]);
        assert(landexp);
        analysisLAndExp(landexp, tmp);
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = Type::Int;
        Operand op1 = {eqexp->v, eqexp->t};
        Operand op2 = {landexp->v, landexp->t};
        Operand des = {root->v, root->t};
        // 短路运算
        buffer.push_back(new Instruction({op1, {}, {"3", Type::IntLiteral}, Operator::_goto}));
        // 左边为假，直接跳到mov语句，将0赋值给des
        buffer.push_back(new Instruction({"0", Type::IntLiteral}, {}, des, Operator::mov));
        buffer.push_back(new Instruction({{}, {}, {std::to_string(tmp.size() + 5), Type::IntLiteral}, Operator::_goto}));
        buffer.insert(buffer.end(), tmp.begin(), tmp.end());
        // 继续判断LAndExp的值，决定是否跳转
        buffer.push_back(new Instruction(op2, {}, {"3", Type::IntLiteral}, Operator::_goto));
        buffer.push_back(new Instruction({"0", Type::IntLiteral}, {}, des, Operator::mov)); // 结果赋值0
        buffer.push_back(new Instruction({{}, {}, {"2", Type::IntLiteral}, Operator::_goto}));
        buffer.push_back(new Instruction({"1", Type::IntLiteral}, {}, des, Operator::mov));
    }
}

// LOrExp -> LAndExp [ '||' LOrExp ]
// LOrExp.is_computable
// LOrExp.v
// LOrExp.t
void frontend::Analyzer::analysisLOrExp(LOrExp *root, vector<ir::Instruction *> &buffer)
{
    // LOrExp -> LAndExp
    if (root->children.size() == 1)
    {
        // 跳转在子结点中处理
        ANALYSIS(node, LAndExp, 0);
        COPY_EXP_NODE(node, root);
    }
    // LOrExp -> LAndExp '||' LOrExp
    else
    {
        ANALYSIS(landexp, LAndExp, 0);
        auto tmp = vector<Instruction *>();
        auto lorexp = dynamic_cast<LOrExp *>(root->children[2]);
        assert(lorexp);
        analysisLOrExp(lorexp, tmp);
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = Type::Int;
        Operand op1 = {landexp->v, landexp->t};
        Operand op2 = {lorexp->v, lorexp->t};
        Operand des = {root->v, root->t};
        // 短路运算先判断左边的值
        buffer.push_back(new Instruction({op1, {}, {std::to_string(tmp.size() + 4), Type::IntLiteral}, Operator::_goto}));
        // 判断LOrExp的值，决定是否跳转
        buffer.insert(buffer.end(), tmp.begin(), tmp.end());
        buffer.push_back(new Instruction(op2, {}, {"3", Type::IntLiteral}, Operator::_goto));
        buffer.push_back(new Instruction({"0", Type::IntLiteral}, {}, des, Operator::mov)); // 结果赋值0
        buffer.push_back(new Instruction({}, {}, {"2", Type::IntLiteral}, Operator::_goto));
        buffer.push_back(new Instruction({"1", Type::IntLiteral}, {}, des, Operator::mov)); // 结果赋值1
    }
}
// ConstExp -> AddExp
// ConstExp.is_computable: true
// ConstExp.v
// ConstExp.t
void frontend::Analyzer::analysisConstExp(ConstExp *root, vector<ir::Instruction *> &buffer)
{
    ANALYSIS(addexp, AddExp, 0);
    COPY_EXP_NODE(addexp, root);
    if (symbol_table.varval.find(root->v) != symbol_table.varval.end())
    {
        root->v = symbol_table.varval[root->v];
        if (root->t == Type::Int)
            root->t = Type::IntLiteral;
        else
            root->t = Type::FloatLiteral;
    }
}
