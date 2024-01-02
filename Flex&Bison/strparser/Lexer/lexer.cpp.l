%option noyywrap
%{
	#include <iostream>
	
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

#include <iostream>

int main()
		{
			setlocale(LC_ALL, "Russian");
			yylex();

			return 0;
		}