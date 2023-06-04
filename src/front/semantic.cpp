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
    scopeinfo.name = name + std::to_string(block_cnt++);
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
        auto ste = scope.table.find(get_scoped_name(id));
        if (ste != scope.table.end())
        {
            return ste->second.operand;
        }
    }
}

// 输入一个变量名, 在符号表中寻找最近的同名变量, 返回 STE
frontend::STE frontend::SymbolTable::get_ste(string id) const
{
    for (auto it = scope_stack.rbegin(); it != scope_stack.rend(); ++it)
    {
        auto scope = *it;
        auto ste = scope.table.find(get_scoped_name(id));
        if (ste != scope.table.end())
        {
            return ste->second;
        }
    }
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
    // 将全局变量加入到ir_program的globalVal中
    for (auto it = symbol_table.scope_stack[0].table.begin(); it != symbol_table.scope_stack[0].table.end(); it++)
    {
        if (it->second.dimension.size() != 0)
        {
            int arr_len = 1;
            for (int i = 0; i < it->second.dimension.size(); i++)
                arr_len *= it->second.dimension[i];
            // 添加重命名后的全局变量
            ir_program.globalVal.push_back({{symbol_table.get_scoped_name(it->second.operand.name), it->second.operand.type}, arr_len});
        }
        else
        {
            // 执行IR变量重命名, 并丢弃常量
            // if (it->second.operand.type != Type::FloatLiteral && it->second.operand.type != Type::IntLiteral)
            ir_program.globalVal.push_back({{symbol_table.get_scoped_name(it->second.operand.name), it->second.operand.type}});
        }
    }
    // 为全局函数添加return
    ir::Instruction *globalreturn = new ir::Instruction(ir::Operand(),
                                                        ir::Operand(),
                                                        ir::Operand(), ir::Operator::_return);
    global_func->addInst(globalreturn);
    ir_program.addFunction(*global_func);
    return ir_program;
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
            symbol_table.functions["global"]->InstVec.insert(symbol_table.functions["global"]->InstVec.end(), g_init_inst.begin(), g_init_inst.end());
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
            symbol_table.functions["global"]->InstVec.insert(symbol_table.functions["global"]->InstVec.end(), g_init_inst.begin(), g_init_inst.end());
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
    // BType -> 'int'
    if (dynamic_cast<Term *>(root->children[0])->token.type == TokenType::INTTK)
    {
        root->t = Type::Int;
    }
    // BType -> 'float'
    else
    {
        root->t = Type::Float;
    }
}

// ConstDef -> Ident { '[' ConstExp ']' } '=' ConstInitVal
// ConstDef.arr_name
void frontend::Analyzer::analysisConstDef(ConstDef *root, vector<ir::Instruction *> &buffer)
{
    // ConstDef -> Ident { '[' ConstExp ']' } '=' ConstInitVal
    GET_CHILD_PTR(ident, Term, 0);
    root->arr_name = ident->token.value;
    symbol_table.scope_stack[0].table.insert({ident->token.value, {root->arr_name}});
    for (int i = 2; i < root->children.size(); i += 3)
    {
        if (dynamic_cast<ConstExp *>(root->children[i]))
        {
            ANALYSIS(constexp, ConstExp, i);
            symbol_table.scope_stack[0].table[ident->token.value].dimension.push_back(stoi(constexp->v)); // 此处添加忽略了数组长度为表达式的情况，需要进行常量优化
        }
        else
        {
            break;
        }
    }
    ANALYSIS(constinitval, ConstInitVal, root->children.size() - 1);
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
    }
}

// VarDef -> Ident { '[' ConstExp ']' } [ '=' InitVal ]
// VarDef.arr_name
void frontend::Analyzer::analysisVarDef(VarDef *root, vector<ir::Instruction *> &buffer)
{
    GET_CHILD_PTR(ident, Term, 0);
    root->arr_name = ident->token.value;
    symbol_table.scope_stack[0].table.insert({ident->token.value, {root->arr_name}});
    for (int i = 2; i < root->children.size(); i += 3)
    {
        if (dynamic_cast<ConstExp *>(root->children[i]))
        {
            ANALYSIS(constexp, ConstExp, i);
            symbol_table.scope_stack[0].table[ident->token.value].dimension.push_back(stoi(constexp->v));
        }
        else
        {
            break;
        }
    }
    // VarDef -> Ident { '[' ConstExp ']' }
    if (dynamic_cast<InitVal *>(root->children[root->children.size() - 1]))
    {
        ANALYSIS(initval, InitVal, root->children.size() - 1);
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
    function.name = root->n;
    function.returnType = root->t;
    symbol_table.scope_stack.push_back({0, "fp", map_str_ste()});
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
        function.ParameterList.push_back({ident->token.value, btype->t});
        symbol_table.scope_stack[0].table.insert({ident->token.value, {ident->token.value}});
    }
    // FuncFParam -> BType Ident '[' ']' { '[' Exp ']' }
    else
    {
        GET_CHILD_PTR(btype, BType, 0);
        analysisBType(btype);
        GET_CHILD_PTR(ident, Term, 1);
        function.ParameterList.push_back({ident->token.value, btype->t});
        symbol_table.scope_stack[0].table.insert({ident->token.value, {ident->token.value}});
        for (int i = 5; i < root->children.size(); i += 3)
        {
            if (dynamic_cast<Exp *>(root->children[i]))
            {
                GET_CHILD_PTR(exp, Exp, i);
                analysisExp(exp, function.InstVec);
                symbol_table.scope_stack[0].table[ident->token.value].dimension.push_back(stoi(exp->v));
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
    }
}

// enum class Operator
// {
//     _return, // return   op1
//     _goto,   // goto     [op1=cond_var/null],    des = offset
//     call,    // call     op1 = func_name,    des = retval  /* func.name = function, func.type = return type*/
//     // alloc [arr_size]*4 byte space on stack for array named [arr_name], do not use this for global arrays
//     alloc,  // alloc    op1 = arr_size,     des = arr_name
//     store,  // store    des,    op1,    op2    op2为下标 -> 偏移量  op1为 store 的数组名, des 为被存储的变量
//     load,   // load     des,    op1,    op2    op2为下标 -> 偏移量  op1为 load 的数组名, des 为被赋值变量
//     getptr, // op1: arr_name, op2: arr_off

//     def,
//     fdef,
//     mov,
//     fmov,
//     cvt_i2f, // convert [Int]op1 to [Float]des
//     cvt_f2i, // convert [Float]op1 to [Int]des
//     add,
//     addi,
//     fadd,
//     sub,
//     subi,
//     fsub,
//     mul,
//     fmul,
//     div,
//     fdiv,
//     mod,
//     lss,
//     flss,
//     leq,
//     fleq,
//     gtr,
//     fgtr,
//     geq,
//     fgeq,
//     eq,
//     feq,
//     neq,
//     fneq,
//     _not,
//     _and,
//     _or,
//     __unuse__
// };

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
        Operand op1 = {exp->v, exp->t};
        Operand op2 = {lval->v, lval->t};
        buffer.push_back(new Instruction({op1, op2, {}, Operator::mov}));
    }
    // Stmt -> Block
    else if (dynamic_cast<Block *>(root->children[0]))
    {
        GET_CHILD_PTR(block, Block, 0);
        analysisBlock(block, buffer);
    }
    // Stmt -> 'if' '(' Cond ')' Stmt [ 'else' Stmt ]
    else if (dynamic_cast<Term *>(root->children[0])->token.type == TokenType::IFTK)
    {
        GET_CHILD_PTR(cond, Cond, 2);
        analysisCond(cond, buffer);
        GET_CHILD_PTR(stmt1, Stmt, 4);
        analysisStmt(stmt1, buffer);
        if (root->children.size() == 7)
        {
            GET_CHILD_PTR(stmt2, Stmt, 6);
            analysisStmt(stmt2, buffer);
        }
    }
    // Stmt -> 'while' '(' Cond ')' Stmt
    else if (dynamic_cast<Term *>(root->children[0])->token.type == TokenType::WHILETK)
    {
        GET_CHILD_PTR(cond, Cond, 2);
        analysisCond(cond, buffer);
        GET_CHILD_PTR(stmt, Stmt, 4);
        analysisStmt(stmt, buffer);
    }
    // Stmt -> 'break' ';'
    else if (dynamic_cast<Term *>(root->children[0])->token.type == TokenType::BREAKTK)
    {
        buffer.push_back(new Instruction({}, {}, {}, Operator::_goto));
    }
    // Stmt -> 'continue' ';'
    else if (dynamic_cast<Term *>(root->children[0])->token.type == TokenType::CONTINUETK)
    {
        buffer.push_back(new Instruction({}, {}, {}, Operator::_goto));
    }
    // Stmt -> 'return' [Exp] ';'
    else if (dynamic_cast<Term *>(root->children[0])->token.type == TokenType::RETURNTK)
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
    root->v = symbol_table.get_scoped_name(ident->token.value);
    root->t = symbol_table.get_ste(ident->token.value).operand.type;
    root->is_computable = true;
    for (int i = 1; i < root->children.size(); i += 3)
    {
        GET_CHILD_PTR(exp, Exp, i);
        analysisExp(exp, buffer);
        Operand op1 = {exp->v, exp->t};
        Operand op2 = {root->v, root->t};
        Operand des = {root->v, root->t};
        buffer.push_back(new Instruction({op1, op2, des, Operator::add}));
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
        root->t = Type::Int;
    }
    // Number -> floatConst
    else
    {
        root->is_computable = true;
        root->v = dynamic_cast<Term *>(root->children[0])->token.value;
        root->t = Type::Float;
    }
}

// PrimaryExp -> '(' Exp ')' | LVal | Number
// PrimaryExp.is_computable
// PrimaryExp.v
// PrimaryExp.t
void frontend::Analyzer::analysisPrimaryExp(PrimaryExp *root, vector<ir::Instruction *> &buffer)
{
    // PrimaryExp -> '(' Exp ')'
    if (dynamic_cast<Exp *>(root->children[1]))
    {
        ANALYSIS(exp, Exp, 1);
        COPY_EXP_NODE(exp, root);
    }
    // PrimaryExp -> LVal
    else if (dynamic_cast<LVal *>(root->children[0]))
    {
        ANALYSIS(lval, LVal, 0);
        COPY_EXP_NODE(lval, root);
    }
    // PrimaryExp -> Number
    else
    {
        ANALYSIS(number, Number, 0);
        COPY_EXP_NODE(number, root);
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
    // UnaryExp -> Ident '(' [FuncRParams] ')'
    else if (dynamic_cast<Term *>(root->children[1])->token.type == TokenType::LPARENT)
    {
        GET_CHILD_PTR(ident, Term, 0);
        auto func = symbol_table.functions[ident->token.value];
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = func->returnType;
        Operand op1 = {func->name, Type::null};
        Operand returnval = {root->v, root->t};
        GET_CHILD_PTR(funcrparams, FuncRParams, 2);
        ir::CallInst *callinst = new ir::CallInst(op1, returnval);
        buffer.push_back(callinst);
        analysisFuncRParams(funcrparams, buffer, *dynamic_cast<ir::CallInst *>(buffer.back()));
    }
    // UnaryExp -> UnaryOp UnaryExp
    else
    {
        GET_CHILD_PTR(unaryop, UnaryOp, 0);
        analysisUnaryOp(unaryop);
        ANALYSIS(unaryexp, UnaryExp, 1);
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = unaryexp->t;
        Operand op1 = {unaryexp->v, unaryexp->t};
        Operand des = {root->v, root->t};
        if (unaryop->op == TokenType::PLUS)
        {
            buffer.push_back(new Instruction({op1, {}, des, Operator::add}));
        }
        else if (unaryop->op == TokenType::MINU)
        {
            buffer.push_back(new Instruction({op1, {}, des, Operator::sub}));
        }
        else
        {
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
void frontend::Analyzer::analysisFuncRParams(FuncRParams *root, vector<ir::Instruction *> &buffer, ir::CallInst& callinst)
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
    for (int i = 1; i < root->children.size(); i += 2)
    {
        auto tmp = vector<Instruction *>();
        auto unaryexp = dynamic_cast<UnaryExp *>(root->children[i + 1]);
        assert(unaryexp);
        analysisUnaryExp(unaryexp, tmp);
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = Type::Int;
        Operand op1 = {unaryexp->v, unaryexp->t};
        Operand op2 = {root->v, root->t};
        Operand des = {root->v, root->t};
        if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::MULT)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::mul}));
        }
        else if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::DIV)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::div}));
        }
        else
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::mod}));
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
    for (int i = 1; i < root->children.size(); i += 2)
    {
        auto tmp = vector<Instruction *>();
        auto mulexp = dynamic_cast<MulExp *>(root->children[i + 1]);
        assert(mulexp);
        analysisMulExp(mulexp, tmp);
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = Type::Int;
        Operand op1 = {mulexp->v, mulexp->t};
        Operand op2 = {root->v, root->t};
        Operand des = {root->v, root->t};
        if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::PLUS)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::add}));
        }
        else
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::sub}));
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
    for (int i = 1; i < root->children.size(); i += 2)
    {
        auto tmp = vector<Instruction *>();
        auto addexp = dynamic_cast<AddExp *>(root->children[i + 1]);
        assert(addexp);
        analysisAddExp(addexp, tmp);
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = Type::Int;
        Operand op1 = {addexp->v, addexp->t};
        Operand op2 = {root->v, root->t};
        Operand des = {root->v, root->t};
        if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::LSS)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::lss}));
        }
        else if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::LEQ)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::leq}));
        }
        else if (dynamic_cast<Term *>(root->children[i])->token.type == TokenType::GTR)
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::gtr}));
        }
        else
        {
            buffer.push_back(new Instruction({op1, op2, des, Operator::geq}));
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
    for (int i = 1; i < root->children.size(); i += 2)
    {
        auto tmp = vector<Instruction *>();
        auto relexp = dynamic_cast<RelExp *>(root->children[i + 1]);
        assert(relexp);
        analysisRelExp(relexp, tmp);
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = Type::Int;
        Operand op1 = {relexp->v, relexp->t};
        Operand op2 = {root->v, root->t};
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
        buffer.push_back(new Instruction({op1, {}, {std::to_string(tmp.size() + 3), Type::IntLiteral}, Operator::_goto}));
        buffer.push_back(new Instruction({op2, {}, des, Operator::mov}));
        buffer.push_back(new Instruction({}, {}, {"2", Type::IntLiteral}, Operator::_goto));
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
        buffer.push_back(new Instruction({op1, {}, {std::to_string(tmp.size() + 3), Type::IntLiteral}, Operator::_goto}));
        buffer.push_back(new Instruction({op2, {}, des, Operator::mov}));
        buffer.push_back(new Instruction({}, {}, {"2", Type::IntLiteral}, Operator::_goto));
        buffer.push_back(new Instruction({"1", Type::IntLiteral}, {}, des, Operator::mov));
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
}
