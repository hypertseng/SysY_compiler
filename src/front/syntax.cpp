#include "front/syntax.h"

#include <iostream>
#include <cassert>

using frontend::Parser;

// #define DEBUG_PARSER
#define TODO assert(0 && "todo")
#define CUR_TOKEN_IS(tk_type) (token_stream[index].type == TokenType::tk_type)
// #define CUR_TOKEN_IS(tk_type) (token_stream[index].type == tk_type)
#define PARSE_TOKEN(tk_type) root->children.push_back(parseTerm(root, TokenType::tk_type))
#define PARSE(name, type) auto name = new type(root); assert(parse##type(name)); root->children.push_back(name); 


Parser::Parser(const std::vector<frontend::Token> &tokens) : index(0), token_stream(tokens)
{
}

Parser::~Parser() {}

frontend::Term *Parser::parseTerm(AstNode *parent, TokenType expected)
{
	if (token_stream[index].type == expected)
	{
		Term *Term_node = new Term(token_stream[index++], parent);
		return Term_node;
	}
	else
	{
		assert(0 && "invalid token type");
	}
}

frontend::CompUnit *Parser::get_abstract_syntax_tree()
{
	auto root = new frontend::CompUnit();
	if (parseCompUnit(root))
	{
		return root;
	}
	else
	{
		delete root;
		return nullptr;
	}
}

bool Parser::parseCompUnit(frontend::CompUnit *root)
{
	if (root == nullptr)
		return false;
	log(root);
	if (CUR_TOKEN_IS(CONSTTK))
	{
		PARSE(decl, Decl);
	}
	else if (CUR_TOKEN_IS(VOIDTK))
	{
		PARSE(funcdef, FuncDef);
	}
	else	// int float
	{
		if(token_stream[index+2].type == TokenType::LPARENT)
		{
			PARSE(funcdef, FuncDef);
		}
		else
		{
			PARSE(decl, Decl);
		}
	}
	if (index < token_stream.size())
	{
		PARSE(compunit, CompUnit);
	}
	return true;
}

bool Parser::parseDecl(frontend::Decl *root)
{
	if (root == nullptr)
		return false;
	log(root);
	if (CUR_TOKEN_IS(CONSTTK))
	{
		PARSE(constdecl, ConstDecl);
	}
	else
	{
		PARSE(vardecl, VarDecl);
	}
	return true;
}

bool Parser::parseConstDecl(frontend::ConstDecl *root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE_TOKEN(CONSTTK);
	PARSE(btype, BType);
	PARSE(constdef, ConstDef);
	while (CUR_TOKEN_IS(COMMA))
	{
		PARSE_TOKEN(COMMA);
		PARSE(constdef, ConstDef);
	}
	PARSE_TOKEN(SEMICN);
	return true;
}

bool Parser::parseBType(frontend::BType *root)
{
	if (root == nullptr)
		return false;
	log(root);
	if (CUR_TOKEN_IS(INTTK))
	{
		PARSE_TOKEN(INTTK);
	}
	else
	{
		PARSE_TOKEN(FLOATTK);
	}
	return true;
}

bool Parser::parseConstDef(frontend::ConstDef *root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE_TOKEN(IDENFR);
	while (CUR_TOKEN_IS(LBRACK))
	{
		PARSE_TOKEN(LBRACK);
		PARSE(constexp, ConstExp);
		PARSE_TOKEN(RBRACK);
	}
	PARSE_TOKEN(ASSIGN);
	PARSE(constinitval, ConstInitVal);
	return true;
}

bool Parser::parseConstInitVal(frontend::ConstInitVal *root)
{
	if (root == nullptr)
		return false;
	log(root);
	if (CUR_TOKEN_IS(LBRACE))
	{
		PARSE_TOKEN(LBRACE);
		if(CUR_TOKEN_IS(RBRACE))
		{
			PARSE_TOKEN(RBRACE);
		}
		else
		{
			PARSE(constinitval, ConstInitVal);
			while (CUR_TOKEN_IS(COMMA))
			{
				PARSE_TOKEN(COMMA);
				PARSE(constinitval, ConstInitVal);
			}
			PARSE_TOKEN(RBRACE);
		}
	}
	else
	{
		PARSE(constexp, ConstExp);
	}
	return true;
}

bool Parser::parseVarDecl(frontend::VarDecl *root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(btype, BType);
	PARSE(vardef, VarDef);
	while (CUR_TOKEN_IS(COMMA))
	{
		PARSE_TOKEN(COMMA);
		PARSE(vardef, VarDef);
	}
	PARSE_TOKEN(SEMICN);
	return true;
}

bool Parser::parseVarDef(frontend::VarDef *root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE_TOKEN(IDENFR);
	while (CUR_TOKEN_IS(LBRACK))
	{
		PARSE_TOKEN(LBRACK);
		PARSE(constexp, ConstExp);
		PARSE_TOKEN(RBRACK);
	}
	if (CUR_TOKEN_IS(ASSIGN))
	{
		PARSE_TOKEN(ASSIGN);
		PARSE(initval, InitVal);
	}
	return root;
}

bool Parser::parseInitVal(frontend::InitVal *root)
{
	if (root == nullptr)
		return false;
	log(root);
	if(CUR_TOKEN_IS(LBRACE))
	{
		PARSE_TOKEN(LBRACE);
		if(CUR_TOKEN_IS(RBRACE))
		{
			PARSE_TOKEN(RBRACE);
		}
		else
		{
			PARSE(initval, InitVal);
			while (CUR_TOKEN_IS(COMMA))
			{
				PARSE_TOKEN(COMMA);
				PARSE(initval, InitVal);
			}
			PARSE_TOKEN(RBRACE);
		}
	}
	else
	{
		PARSE(exp, Exp);
	}
	return true;
}

bool Parser::parseFuncDef(frontend::FuncDef *root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(functype, FuncType);
	PARSE_TOKEN(IDENFR);
	PARSE_TOKEN(LPARENT);
	if (CUR_TOKEN_IS(RPARENT))
	{
		PARSE_TOKEN(RPARENT);
	}
	else
	{
		PARSE(funcfparams, FuncFParams);
		PARSE_TOKEN(RPARENT);
	}
	PARSE(block, Block);
	return true;
}

bool Parser::parseFuncType(frontend::FuncType *root)
{
	if (root == nullptr)
		return false;
	log(root);
	if (CUR_TOKEN_IS(VOIDTK))
	{
		PARSE_TOKEN(VOIDTK);
	}
	else if(CUR_TOKEN_IS(INTTK))
	{
		PARSE_TOKEN(INTTK);
	}
	else
	{
		PARSE_TOKEN(FLOATTK);
	}
	return true;
}

bool Parser::parseFuncFParam(frontend::FuncFParam *root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(btype, BType);
	PARSE_TOKEN(IDENFR);
	if (CUR_TOKEN_IS(LBRACK))
	{
		PARSE_TOKEN(LBRACK);
		PARSE_TOKEN(RBRACK);
		while (CUR_TOKEN_IS(LBRACK))
		{
			PARSE_TOKEN(LBRACK);
			PARSE(exp, Exp);
			PARSE_TOKEN(RBRACK);
		}
	}
	return true;
}

bool Parser::parseFuncFParams(frontend::FuncFParams *root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(funcfparam, FuncFParam);
	while (CUR_TOKEN_IS(COMMA))
	{
		PARSE_TOKEN(COMMA);
		PARSE(funcfparam, FuncFParam);
	}
	return true;
}

bool Parser::parseBlock(frontend::Block *root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE_TOKEN(LBRACE);
	while (!CUR_TOKEN_IS(RBRACE))
	{
		PARSE(blockitem, BlockItem);
	}
	PARSE_TOKEN(RBRACE);
	return true;
}

bool Parser::parseBlockItem(frontend::BlockItem *root)
{
	if (root == nullptr)
		return false;
	log(root);
	if (CUR_TOKEN_IS(CONSTTK) || CUR_TOKEN_IS(INTTK) || CUR_TOKEN_IS(FLOATTK))
	{
		PARSE(decl, Decl);
	}
	else
	{
		PARSE(stmt, Stmt);
	}
	return true;
}

bool Parser::parseStmt(frontend::Stmt *root)
{
	if (root == nullptr)
		return false;
	log(root);
	if (CUR_TOKEN_IS(IDENFR) && token_stream[index+1].type != TokenType::LPARENT)
	{
		PARSE(lval, LVal);
		PARSE_TOKEN(ASSIGN);
		PARSE(exp, Exp);
		PARSE_TOKEN(SEMICN);
	}
	else if (CUR_TOKEN_IS(LBRACE))
	{
		PARSE(block, Block);
	}
	else if (CUR_TOKEN_IS(IFTK))
	{
		PARSE_TOKEN(IFTK);
		PARSE_TOKEN(LPARENT);
		PARSE(cond, Cond);
		PARSE_TOKEN(RPARENT);
		PARSE(stmt, Stmt);
		if (CUR_TOKEN_IS(ELSETK))
		{
			PARSE_TOKEN(ELSETK);
			PARSE(stmt, Stmt);
		}
	}
	else if (CUR_TOKEN_IS(WHILETK))
	{
		PARSE_TOKEN(WHILETK);
		PARSE_TOKEN(LPARENT);
		PARSE(cond, Cond);
		PARSE_TOKEN(RPARENT);
		PARSE(stmt, Stmt);
	}
	else if (CUR_TOKEN_IS(BREAKTK))
	{
		PARSE_TOKEN(BREAKTK);
		PARSE_TOKEN(SEMICN);
	}
	else if (CUR_TOKEN_IS(CONTINUETK))
	{
		PARSE_TOKEN(CONTINUETK);
		PARSE_TOKEN(SEMICN);
	}
	else if (CUR_TOKEN_IS(RETURNTK))
	{
		PARSE_TOKEN(RETURNTK);
		if (!CUR_TOKEN_IS(SEMICN))
		{
			PARSE(exp, Exp);
		}
		PARSE_TOKEN(SEMICN);
	}
	else
	{
		if (CUR_TOKEN_IS(SEMICN))
		{
			PARSE_TOKEN(SEMICN);
		}
		else
		{
			PARSE(exp, Exp);
			PARSE_TOKEN(SEMICN);
		}
	}
	return true;
}

bool Parser::parseExp(frontend::Exp * root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(addexp, AddExp)
	return true;
}

bool Parser::parseCond(frontend::Cond * root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(lorexp, LOrExp)
	return true;
}

bool Parser::parseLVal(frontend::LVal * root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE_TOKEN(IDENFR);
	while (CUR_TOKEN_IS(LBRACK))
	{
		PARSE_TOKEN(LBRACK);
		PARSE(exp, Exp)
		PARSE_TOKEN(RBRACK);
	}
	return true;
}

bool Parser::parseNumber(frontend::Number * root)
{
	if (root == nullptr)
		return false;
	log(root);
	if (CUR_TOKEN_IS(INTLTR))
	{
		PARSE_TOKEN(INTLTR);
	}
	else
	{
		PARSE_TOKEN(FLOATLTR);
	}
	return true;
}

bool Parser::parsePrimaryExp(frontend::PrimaryExp * root)
{
	if (root == nullptr)
		return false;
	log(root);
	if (CUR_TOKEN_IS(IDENFR))
	{
		PARSE(lval, LVal)
	}
	else if (CUR_TOKEN_IS(INTLTR) || CUR_TOKEN_IS(FLOATLTR))
	{
		PARSE(number, Number)
	}
	else
	{
		PARSE_TOKEN(LPARENT);
		PARSE(exp, Exp)
		PARSE_TOKEN(RPARENT);
	}
	return true;
}

bool Parser::parseUnaryExp(frontend::UnaryExp * root)
{
	if (root == nullptr)
		return false;
	log(root);
	if (CUR_TOKEN_IS(PLUS) || CUR_TOKEN_IS(MINU) || CUR_TOKEN_IS(NOT))
	{
		PARSE(unaryop, UnaryOp)
		PARSE(unaryexp, UnaryExp)
	}
	else if (CUR_TOKEN_IS(IDENFR))
	{
		if(token_stream[index+1].type == TokenType::LPARENT)
		{
			PARSE_TOKEN(IDENFR);
			PARSE_TOKEN(LPARENT);
			if (!CUR_TOKEN_IS(RPARENT))
			{
				PARSE(funcrparams, FuncRParams)
			}
			PARSE_TOKEN(RPARENT);
		}
		else
		{
			PARSE(primaryexp, PrimaryExp)
		}
	}
	else
	{
		PARSE(primaryexp, PrimaryExp)
	}
	return true;
}

bool Parser::parseUnaryOp(frontend::UnaryOp * root)
{
	if (root == nullptr)
		return false;
	log(root);
	if (CUR_TOKEN_IS(PLUS))
	{
		PARSE_TOKEN(PLUS);
	}
	else if (CUR_TOKEN_IS(MINU))
	{
		PARSE_TOKEN(MINU);
	}
	else
	{
		PARSE_TOKEN(NOT);
	}
	return true;
}

bool Parser::parseFuncRParams(frontend::FuncRParams * root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(exp, Exp)
	while (CUR_TOKEN_IS(COMMA))
	{
		PARSE_TOKEN(COMMA);
		PARSE(exp, Exp)
	}
	return true;
}

bool Parser::parseMulExp(frontend::MulExp * root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(unaryexp, UnaryExp)
	while(CUR_TOKEN_IS(MULT) || CUR_TOKEN_IS(DIV) || CUR_TOKEN_IS(MOD))
	{
		if (CUR_TOKEN_IS(MULT))
		{
			PARSE_TOKEN(MULT);
			PARSE(unaryexp, UnaryExp)
		}
		else if (CUR_TOKEN_IS(DIV))
		{
			PARSE_TOKEN(DIV);
			PARSE(unaryexp, UnaryExp)
		}
		else
		{
			PARSE_TOKEN(MOD);
			PARSE(unaryexp, UnaryExp)
		}
	}
	return true;
}

bool Parser::parseAddExp(frontend::AddExp * root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(mulexp, MulExp)
	while (CUR_TOKEN_IS(PLUS) || CUR_TOKEN_IS(MINU))
	{
		if (CUR_TOKEN_IS(PLUS))
		{
			PARSE_TOKEN(PLUS);
			PARSE(mulexp, MulExp)
		}
		else
		{
			PARSE_TOKEN(MINU);
			PARSE(mulexp, MulExp)
		}
	}
	return true;
}

bool Parser::parseRelExp(frontend::RelExp * root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(addexp, AddExp)
	if (CUR_TOKEN_IS(LSS) || CUR_TOKEN_IS(LEQ) || CUR_TOKEN_IS(GTR) || CUR_TOKEN_IS(GEQ))
	{
		if (CUR_TOKEN_IS(LSS))
		{
			PARSE_TOKEN(LSS);
			PARSE(addexp, AddExp)
		}
		else if (CUR_TOKEN_IS(LEQ))
		{
			PARSE_TOKEN(LEQ);
			PARSE(addexp, AddExp)
		}
		else if (CUR_TOKEN_IS(GTR))
		{
			PARSE_TOKEN(GTR);
			PARSE(addexp, AddExp)
		}
		else if (CUR_TOKEN_IS(GEQ))
		{
			PARSE_TOKEN(GEQ);
			PARSE(addexp, AddExp)
		}
	}
	return true;
}

bool Parser::parseEqExp(frontend::EqExp * root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(relexp, RelExp)
	while (CUR_TOKEN_IS(EQL) || CUR_TOKEN_IS(NEQ))
	{
		if (CUR_TOKEN_IS(EQL))
		{
			PARSE_TOKEN(EQL);
			PARSE(relexp, RelExp)
		}
		else
		{
			PARSE_TOKEN(NEQ);
			PARSE(relexp, RelExp)
		}
	}
	return true;
}

bool Parser::parseLAndExp(frontend::LAndExp * root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(eqexp, EqExp)
	if (CUR_TOKEN_IS(AND))
	{
		PARSE_TOKEN(AND);
		PARSE(landexp, LAndExp)
	}
	return true;
}

bool Parser::parseLOrExp(frontend::LOrExp * root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(landexp, LAndExp)
	if (CUR_TOKEN_IS(OR))
	{
		PARSE_TOKEN(OR);
		PARSE(lorexp, LOrExp)
	}
	return true;
}

bool Parser::parseConstExp(frontend::ConstExp * root)
{
	if (root == nullptr)
		return false;
	log(root);
	PARSE(addexp, AddExp)
	return true;
}

void Parser::log(AstNode * node)
{
	#ifdef DEBUG_PARSER
	std::cout << "in parse" << toString(node->type) << ", cur_token_type::" << toString(token_stream[index].type) << ", token_val::" << token_stream[index].value << '\n';
	#endif
}
