%{
	#include <iostream>	
%}

%option main
%option yylineno

%%
"{" { std::cout << "Naiden {\n"; }
"}" { std::cout << "Naiden }\n"; }
exit {
			std::cout << "�����";
			exit(1);
		}
%%