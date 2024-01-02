%{
	#include <iostream>
	#include "Header.h"
%}

%option noyywrap
%option yylineno

%%
"{" { std::cout << "Найден {\n"; }
"}" { std::cout << "Найден }\n"; }
exit {
			std::cout << "Выход";
			exit(1);
		}
%%