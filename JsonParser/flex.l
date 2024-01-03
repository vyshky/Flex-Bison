%option noyywrap
%option yylineno

%{
	#include <iostream>
	#include "Header.h"
%}

%%

"{" { ECHO; return LCURLY; }
"}" { ECHO; return RCURLY; }
"[" { ECHO; return LBRAC; }
"]" { ECHO; return RBRAC; }

%%