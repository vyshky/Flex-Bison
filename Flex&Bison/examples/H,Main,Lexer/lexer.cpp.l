%option noyywrap
%{
	#include <iostream>
	#include "Header.h"
%}


%option yylineno

%%
"{" { std::cout << "Naiden {\n"; }
"}" { std::cout << "Naiden }\n"; }
exit {
			std::cout << "Выход";
			exit(1);
		}
%%