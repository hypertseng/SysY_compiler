#include"front/semantic.h"

#include<cassert>

using ir::Instruction;
using ir::Function;
using ir::Operand;
using ir::Operator;

#define TODO assert(0 && "TODO");

#define GET_CHILD_PTR(node, type, index) auto node = dynamic_cast<type*>(root->children[index]); assert(node); 
#define ANALYSIS(node, type, index) auto node = dynamic_cast<type*>(root->children[index]); assert(node); analysis##type(node, buffer);
#define COPY_EXP_NODE(from, to) to->is_computable = from->is_computable; to->v = from->v; to->t = from->t;

map<std::string,ir::Function*>* frontend::get_lib_funcs() {
    static map<std::string,ir::Function*> lib_funcs = {
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

void frontend::SymbolTable::add_scope(Block* node) {
    TODO;
}
void frontend::SymbolTable::exit_scope() {
    TODO;
}

string frontend::SymbolTable::get_scoped_name(string id) const {
    TODO;
}

Operand frontend::SymbolTable::get_operand(string id) const {
    TODO;
}

frontend::STE frontend::SymbolTable::get_ste(string id) const {
    TODO;
}

frontend::Analyzer::Analyzer(): tmp_cnt(0), symbol_table() {
    TODO;
}

ir::Program frontend::Analyzer::get_ir_program(CompUnit* root) {
    TODO;
}


void frontend::Analyzer::analysisFuncDef(FuncDef* root, ir::Function& function) {
    auto tk = dynamic_cast<Term*>(root->children[0]->children[0])->token.type;
    root->t = tk == TokenType::VOIDTK ? Type::null : (tk == TokenType::INTTK ? Type::Int : Type::Float);
    root->n = dynamic_cast<Term*>(root->children[1])->token.value;
    function.name = root->n;
    function.returnType = root->t;
    symbol_table.scope_stack.push_back({0, "fp", map_str_ste()});
    symbol_table.functions.insert({root->n, &function});
    auto params = dynamic_cast<FuncFParams*>(root->children[3]);
    if(params)
    {
        analysisFuncFParams(params, function);
        analysisBlock(dynamic_cast<Block*>(root->children[5]), function.InstVec);
    }
    else
    {
        analysisBlock(dynamic_cast<Block*>(root->children[4]), function.InstVec);
    }
    symbol_table.exit_scope();
}

// LOrExp -> LAndExp [ '||' LOrExp ]
void frontend::Analyzer::analysisLOrExp(LOrExp *root, vector<ir::Instruction*>& buffer)
{
    // LOrExp -> LAndExp
    if(root->children.size() == 1)
    {
        ANALYSIS(node, LAndExp, 0);
        COPY_EXP_NODE(node, root);
    }
    // LOrExp -> LAndExp '||' LOrExp
    else
    {
        ANALYSIS(andexp, LAndExp, 0);
        auto tmp = vector<Instruction*>();
        auto orexp = dynamic_cast<LOrExp*>(root->children[2]);
        assert(orexp);
        analysisLOrExp(orexp, tmp);
        root->v = "t" + std::to_string(tmp_cnt++);
        root->t = Type::Int;
        Operator op1 = {andexp->v, andexp->t};
        Operator op2 = {orexp->v, orexp->t};
        Operator op3 = {root->v, root->t};
        buffer.push_back(new Instruction({op1, {}, {std::to_string(tmp.size() + 3), Type::IntLiteral}, Operator::_goto}));
        buffer.insert(buffer.end(), tmp.begin(), tmp.end());
        buffer.push_back(new Instruction({op2, {}, des, Operator::mov}));
        buffer.push_back(new Instruction({}, {}, {"2", Type::IntLiteral}, Operator::_goto));
        buffer.push_back(new Instruction({"1", Type::IntLiteral}, {}, des, Operator::mov));
    }
}