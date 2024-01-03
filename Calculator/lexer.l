%option noyywrap
%option yylineno

%{
	#include "Header.h"
	#include <iostream>
%}	


%%

start { std::cout << "Token == Start"; }
exit { std::cout << "Token == Exit"; }

%%