%option noyywrap
%option yylineno

%{
	#define TOKEN_NUBMER 1
	#define LITERAL 2
	#include <iostream>
	#include "Header.h"
%}

%%
[0-9] {
		std::cout << "Найден токен TOKEN_NUBMER\n";
		//return TOKEN_NUBMER;
	  }
[a-zA-Z] {
		  std::cout << "Найден токен LITERAL\n";
		  //return LITERAL;
		  }
"{" { std::cout << "Найден токен {\n"; }
"}" { std::cout << "Найден токен }\n"; }
exit {
			std::cout << "Выход";
			exit(1);
		}
%%