#include <iostream>
#include "Header.h"

int main()
{
	setlocale(LC_ALL, "Russian");
	yylex(); // Flex
	//yyparse(); // Bison
	return 0;
}