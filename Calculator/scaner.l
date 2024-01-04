%option noyywrap
%option yylineno

%{
	#include "Header.h"	
	#include <iostream>
%}

NUBMER [0-9]+([\.]|[\,])[0-9]+|[0-9]+

%%

[ \t]   { /*skip whitespace*/ }
{NUBMER} { ECHO; return T_NUMBER; }
[+] { ECHO; return T_ADD; }
[\n] { ECHO; return EOL; }

%%