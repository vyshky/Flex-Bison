%option noyywrap
%option yylineno

%{
	#include <iostream>
	#include "parser.h"
	extern void yyerror(const char* message);
	#define ECHO fwrite( yytext, yyleng, 1, yyout )
%}

EXP ([Ee][-+]?[0-9]+)

%%

"{" { ECHO; return LCURLY; }
"}" { ECHO; return RCURLY; }
"[" { ECHO; return LBRAC; }
"]" { ECHO; return RBRAC; }
"," { ECHO; return COMMA; }
":" { ECHO; return COLON; }
"true" { ECHO; return VTRUE; }
"false" { ECHO; return VFALSE; }
"null" { ECHO; return VNULL; }
[ \t\r\n]+ { /* eat whitespace */ }
\"[^"]*\" {  ECHO; return STRING;  }
[1-9]+\.?[0-9]*{EXP}? { ECHO; return DECIMAL; }

%%