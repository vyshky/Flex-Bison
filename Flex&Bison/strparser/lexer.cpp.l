%option noyywrap
%option yylineno

%{
	#define TOKEN_NUBMER 1
	#define TOKEN_LITERAL 2	
	#include <iostream>
	#include "Header.h"
%}

DIGIT[0-9]

%%
{DIGIT}+ {
	std::cout << "Найден токен DIGIT\n";
}
{DIGIT}+"."{DIGIT}* {
	std::cout << "Найден токен DIGIT.DIGIT - Double\n" << yytext;
}

primery {
	     std::cout << "Найден токен primery\n";
		//	wc[ \t]+ - '+' ищет любое совпадение пробела и табуляции, задается имя токена "wc"
		//	Digit [0-9]
		//	HexDigit[0-9a-fA-F]
		//	Number[0-9]({ Digit })*
		//	HexNumber 0x({ HexDigit })*
		//	[0-9] return TOKEN_NUBMER;
}
[0-9] {
	std::cout << "Найден токен NUBMER\n";
	//return TOKEN_NUBMER;
}
[a-zA-Z] {
		  std::cout << "Найден токен TOKEN_LITERAL\n";
		  //return LITERAL;
}
"{" { std::cout << "Найден токен {\n"; }
"}" { std::cout << "Найден токен }\n"; }
exit {
			std::cout << "Найден токен exit";
			exit(1);
}
%%