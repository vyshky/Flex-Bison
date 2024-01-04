%option noyywrap
%option yylineno

%{
	#include <iostream>	
%}


%%
[0-9]+ { std::cout << "DIGIT\n"; }
[0-9]+\.[0-9]+ { std::cout << "DOUBLE DIGIT\n"; }
[0-9]+\.[0-9]+\. { std::cout << "NOT DOUBLE DIGIT\n"; }
"+" { std::cout << "PLUS\n"; }
%%