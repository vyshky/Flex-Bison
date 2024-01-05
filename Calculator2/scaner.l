%option noyywrap
%option yylineno

%{
	#include <iostream>
	#include <string>
	#include "parser.tab.h"
%}


%%
[ \t] { /*EMPTY*/ }
[0-9]+ { yylval.value = std::stod(yytext); return T_NUMBER; }
[0-9]+\.[0-9]+ { yylval.value = std::stod(yytext); return T_NUMBER; }
[0-9]+\,[0-9]+ { setlocale(LC_NUMERIC, "Russian"); yylval.value = std::stod(yytext); std::cout<< yylval.value << " "; std::setlocale(LC_NUMERIC, "C"); return T_NUMBER; }
[0-9]+\.[0-9]+\. { /*EMPTY*/ }
"+" { return T_PLUS; }
"-" { return T_MINUS; }
"*" { return T_MULT; }
"/" { return T_DIV; }
\n { return EOL; }
%%