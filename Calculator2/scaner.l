%option noyywrap
%option yylineno

%{
	#include <iostream>
	#include <string>
	#include "parser.tab.h"
%}


%%
[ \t] { /*EMPTY*/ }
[0-9]+ { yylval.value = std::stod(yytext); return TOKEN_NUMBER; }
[0-9]+\.[0-9]+ { yylval.value = std::stod(yytext); return TOKEN_NUMBER; }
[0-9]+\,[0-9]+ { setlocale(LC_NUMERIC, "Russian"); yylval.value = std::stod(yytext); std::cout<< yylval.value << " "; std::setlocale(LC_NUMERIC, "C"); return TOKEN_NUMBER; }
[0-9]+\.[0-9]+\. { /*EMPTY*/ }
"+" { return TOKEN_PLUS; }
\n { return EOL; }
%%