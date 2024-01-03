//#include <iostream>
//#include "parser.h"
//#include "header.h"
//
//int main()
//{
//	setlocale(LC_ALL, "Russian");
//	yylex(); // Flex
//	//yyparse(); // Bison
//	return 0;
//}

#include "parser.h"
#include <iostream>
using namespace std;

int main()
{
	yyparse();
	return 0;
}