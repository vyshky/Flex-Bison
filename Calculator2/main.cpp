#include <iostream>
#include <string>
#include "parser.tab.h"

extern int yylineno;

int main()
{
	//setlocale(LC_NUMERIC, "Russian");
	//yylex();
	yyparse();	
	return 0;
}


void yyerror(const char* s)
{
	fprintf(stderr, "error: %s on line %d\n", s, yylineno);
}