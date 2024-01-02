%{
	#define TOKEN_NUBMER 1
	#define LITERAL 2
	#include <iostream>
	#include "Header.h"
%}

%option noyywrap
%option yylineno

%%
[0-9] {
		std::cout << "������ ����� TOKEN_NUBMER\n";
		//return TOKEN_NUBMER;
	  }
[a-zA-Z] {
		  std::cout << "������ ����� LITERAL\n";
		  //return LITERAL;
		  }
"{" { std::cout << "������ ����� {\n"; }
"}" { std::cout << "������ ����� }\n"; }
exit {
			std::cout << "�����";
			exit(1);
		}
%%