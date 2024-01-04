%option noyywrap
%option yylineno

%{
	#include "parser.tab.h"	
	#include <iostream>
	int i = 0;
	const int size = 10;
	char str[size];
%}

NUBMER [0-9]+([\.]|[\,])[0-9]+|[0-9]+

%%

[\n] { return T_EOL; }
exit { return T_EXIT; }
i {  snprintf(str,size-1,"%d",i++); yylval.text = str; return T_INDEX; }

%%