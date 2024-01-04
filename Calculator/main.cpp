#include <iostream>
#include "parser.tab.h"

extern int yylineno;

int main()
{	
	setlocale(LC_ALL, "Russian");
	std::cout << "> ";
	//yylex();
	yyparse();	
	return 0;
}

void yyerror(const char* s)
{
	fprintf(stderr, "error: %s on line %d\n", s, yylineno);
}



//	Since C++11 converting string to floating - point values(like double) is available with functions :
//	stof - convert str to a float
//	stod - convert str to a double
//	stold - convert str to a long double
//
//	As conversion of string to int was also mentioned in the question, there are the following functions in C++11 :
//	stoi - convert str to an int
//	stol - convert str to a long
//	stoul - convert str to an unsigned long
//	stoll - convert str to a long long
//	stoull - convert str to an unsigned long long