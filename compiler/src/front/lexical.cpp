#include "front/lexical.h"

#include <map>
#include <cassert>
#include <string>

#define TODO assert(0 && "todo")

// #define DEBUG_DFA
// #define DEBUG_SCANNER

// 本文件使用的所有额外函数的声明
bool issignal(char c);
bool isnumber(char c);
bool isletter(char c);
frontend::TokenType get_on_type(std::string s);
std::string preprocess(std::ifstream &fin);

std::string frontend::toString(State s)
{
    switch (s)
    {
    case State::Empty:
        return "Empty";
    case State::Ident:
        return "Ident";
    case State::IntLiteral:
        return "IntLiteral";
    case State::FloatLiteral:
        return "FloatLiteral";
    case State::op:
        return "op";
    default:
        assert(0 && "invalid State");
    }
    return "";
}

std::set<std::string> frontend::keywords = {
    "const", "int", "float", "if", "else", "while", "continue", "break", "return", "void"};

frontend::DFA::DFA() : cur_state(frontend::State::Empty), cur_str() {}

frontend::DFA::~DFA() {}

std::set<std::string> keywords = {
    "const",
    "int",
    "void",
    "if",
    "else",
    "while",
    "break",
    "continue",
    "return"};

bool issignal(char c)
{
    return c == '+' || c == '-' || c == '*' || c == '/' || c == '%' || c == '=' || c == '<' || c == '>' || c == '!' || c == '&' || c == '|' || c == '^' || c == '~' || c == '?' || c == ':' || c == '.' || c == ',' || c == ';' || c == '(' || c == ')' || c == '[' || c == ']' || c == '{' || c == '}';
}

bool isnumber(char c)
{
    return c >= '0' && c <= '9';
}

bool isletter(char c)
{
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
}

frontend::TokenType get_on_type(std::string s)
{
    if (s == "const")
    {
        return frontend::TokenType::CONSTTK;
    }
    else if (s == "int")
    {
        return frontend::TokenType::INTTK;
    }
    else if (s == "float")
    {
        return frontend::TokenType::FLOATTK;
    }
    else if (s == "void")
    {
        return frontend::TokenType::VOIDTK;
    }
    else if (s == "if")
    {
        return frontend::TokenType::IFTK;
    }
    else if (s == "else")
    {
        return frontend::TokenType::ELSETK;
    }
    else if (s == "while")
    {
        return frontend::TokenType::WHILETK;
    }
    else if (s == "break")
    {
        return frontend::TokenType::BREAKTK;
    }
    else if (s == "continue")
    {
        return frontend::TokenType::CONTINUETK;
    }
    else if (s == "return")
    {
        return frontend::TokenType::RETURNTK;
    }
    else if (s == "+")
    {
        return frontend::TokenType::PLUS;
    }
    else if (s == "-")
    {
        return frontend::TokenType::MINU;
    }
    else if (s == "*")
    {
        return frontend::TokenType::MULT;
    }
    else if (s == "/")
    {
        return frontend::TokenType::DIV;
    }
    else if (s == "%")
    {
        return frontend::TokenType::MOD;
    }
    else if (s == "==")
    {
        return frontend::TokenType::EQL;
    }
    else if (s == "!=")
    {
        return frontend::TokenType::NEQ;
    }
    else if (s == "<")
    {
        return frontend::TokenType::LSS;
    }
    else if (s == "<=")
    {
        return frontend::TokenType::LEQ;
    }
    else if (s == ">")
    {
        return frontend::TokenType::GTR;
    }
    else if (s == ">=")
    {
        return frontend::TokenType::GEQ;
    }
    else if (s == "&&")
    {
        return frontend::TokenType::AND;
    }
    else if (s == "||")
    {
        return frontend::TokenType::OR;
    }
    else if (s == "!")
    {
        return frontend::TokenType::NOT;
    }
    else if (s == "=")
    {
        return frontend::TokenType::ASSIGN;
    }
    else if (s == ";")
    {
        return frontend::TokenType::SEMICN;
    }
    else if (s == ",")
    {
        return frontend::TokenType::COMMA;
    }
    else if (s == "(")
    {
        return frontend::TokenType::LPARENT;
    }
    else if (s == ")")
    {
        return frontend::TokenType::RPARENT;
    }
    else if (s == "[")
    {
        return frontend::TokenType::LBRACK;
    }
    else if (s == "]")
    {
        return frontend::TokenType::RBRACK;
    }
    else if (s == "{")
    {
        return frontend::TokenType::LBRACE;
    }
    else if (s == "}")
    {
        return frontend::TokenType::RBRACE;
    }
    else
    {
        assert(0 && "get_on_type: unknown operator");
    }
}

bool frontend::DFA::next(char input, Token &buf)
{
#ifdef DEBUG_DFA
#include <iostream>
    // std::cout << "in state [" << toString(cur_state) << "], input = \'" << input << "\', str = " << cur_str << "\t" << std::endl;
#endif
    bool ret;
    switch (cur_state)
    {
    case State::Empty:
        if (issignal(input))
        {
            cur_state = State::op;
            cur_str += input;
            ret = false;
        }
        else if (isnumber(input))
        {
            cur_state = State::IntLiteral;
            cur_str += input;
            ret = false;
        }
        else if (isletter(input) || input == '_')
        {
            cur_state = State::Ident;
            cur_str += input;
            ret = false;
        }
        else
        {
            ret = false;
        }
        break;

    case State::Ident:
        if (isletter(input) || isnumber(input) || input == '_')
        {
            cur_str += input;
            ret = false;
        }
        else
        {
            if (keywords.find(cur_str) != keywords.end())
            {
                buf.type = get_on_type(cur_str);
                buf.value = cur_str;
            }
            else
            {
                buf.type = TokenType::IDENFR;
                buf.value = cur_str;
            }
            if (issignal(input))
            {
                cur_str = input;
                cur_state = State::op;
                ret = true;
            }
            else
            {
                cur_str = "";
                cur_state = State::Empty;
                ret = true;
            }
        }
        break;

    case State::IntLiteral:
        if (isnumber(input) || isletter(input))
        {
            cur_str += input;
            ret = false;
        }
        else if (input == '.')
        {
            cur_state = State::FloatLiteral;
            cur_str += input;
            ret = false;
        }
        else if (issignal(input))
        {
            buf.type = TokenType::INTLTR;
            buf.value = cur_str;
            cur_str = input;
            cur_state = State::op;
            ret = true;
        }
        else
        {
            buf.type = TokenType::INTLTR;
            buf.value = cur_str;
            cur_str = "";
            cur_state = State::Empty;
            ret = true;
        }
        break;

    case State::FloatLiteral:
        if (isnumber(input))
        {
            cur_str += input;
            ret = false;
        }
        else
        {
            buf.type = TokenType::FLOATLTR;
            buf.value = cur_str;
            if (issignal(input))
            {
                cur_str = input;
                cur_state = State::op;
                ret = true;
            }
            else
            {
                cur_str = "";
                cur_state = State::Empty;
                ret = true;
            }
        }
        break;

    case State::op:
        if (issignal(input))
        {
            if ((input == '=' && cur_str == "=") || (input == '&' && cur_str == "&") ||
                (input == '|' && cur_str == "|") || (input == '=' && cur_str == "<") ||
                (input == '=' && cur_str == ">") || (input == '=' && cur_str == "!"))
            {
                cur_str += input;
                ret = false;
            }
            else
            {
                buf.type = get_on_type(cur_str);
                buf.value = cur_str;
                cur_str = input;
                cur_state = State::op;
                ret = true;
            }
        }
        else if (isletter(input) || input == '_')
        {
            buf.type = get_on_type(cur_str);
            buf.value = cur_str;
            cur_str = input;
            cur_state = State::Ident;
            ret = true;
        }
        else if (isnumber(input))
        {
            if(cur_str==".")
            {
                cur_str += input;
                cur_state = State::FloatLiteral;
                ret = false;
            }
            else
            {
                buf.type = get_on_type(cur_str);
                buf.value = cur_str;
                cur_str = input;
                cur_state = State::IntLiteral;
                ret = true;
            }
        }
        else
        {
            buf.type = get_on_type(cur_str);
            buf.value = cur_str;
            cur_str = "";
            cur_state = State::Empty;
            ret = true;
        }
        break;

    default:
        break;
    }
#ifdef DEBUG_DFA
    // std::cout << "next state is [" << toString(cur_state) << "], next str = " << cur_str << "\t, ret = " << ret << std::endl;
#endif
    return ret;
}

void frontend::DFA::reset()
{
    cur_state = State::Empty;
    cur_str = "";
}

frontend::Scanner::Scanner(std::string filename) : fin(filename)
{
    if (!fin.is_open())
    {
        assert(0 && "in Scanner constructor, input file cannot open");
    }
}

frontend::Scanner::~Scanner()
{
    fin.close();
}

std::string preprocess(std::ifstream &fin) // 按行读取文件字符,忽略掉两种注释内容
{
    std::string ret;
    std::string line;
    while (getline(fin, line))
    {
        std::string::size_type pos;
        if ((pos = line.find("//")) != std::string::npos)
        {
            line = line.substr(0, pos);
        }
        if ((pos = line.find("/*")) != std::string::npos)
        {
            std::string tmpline = line.substr(pos + 2);   //  /*后面的内容
            std::string line1 = line.substr(0, pos);
            std::string line2 = "";
            if ((pos = tmpline.find("*/")) != std::string::npos)     //解决 /*/*中包含*/
            {
                line2 = tmpline.substr(pos + 2);
                // std::cout<<line2<<std::endl;
            }
            else
            {
                while (getline(fin, line))
                {
                    if ((pos = line.find("*/")) != std::string::npos)
                    {
                        line2 += line.substr(pos + 2);
                        break;
                    }
                }
            }
            line = line1 + line2;
        }
        std::cout<<line<<std::endl;
        ret += line;
    }
    return ret;
}

std::vector<frontend::Token> frontend::Scanner::run()
{
    std::vector<Token> ret;
    Token tk;
    DFA dfa;
    std::string s = preprocess(fin);
    // 添加换行符,方便结尾字符的输出
    s += '\n';
    for (auto c : s)
    {
        if (dfa.next(c, tk))
        {
            ret.push_back(tk);
// dfa.reset();
#ifdef DEBUG_SCANNER
#include <iostream>
            // std::cout << "token: " << toString(tk.type) << "\t" << tk.value << std::endl;
#endif
        }
    }
    return ret;
    // ret.push_back()
    // #ifdef DEBUG_SCANNER
    // #include <iostream>
    //     std::cout << "token: " << toString(tk.type) << "\t" << tk.value << std::endl;
    // #endif
}