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
foobar   ECHO; std::cout << " - ������ ����� foobar\n";
{DIGIT}+ {
	std::cout << "������ ����� DIGIT\n";
}
{DIGIT}+"."{DIGIT}* {
	std::cout << "������ ����� DIGIT.DIGIT - Double\n" << yytext;
}

primery {
	     std::cout << "������ ����� primery\n";
		//	wc[ \t]+ - '+' ���� ����� ���������� ������� � ���������, �������� ��� ������ "wc"
		//	Digit [0-9]
		//	HexDigit[0-9a-fA-F]
		//	Number[0-9]({ Digit })*
		//	HexNumber 0x({ HexDigit })*
		//	[0-9] return TOKEN_NUBMER;
}
[0-9] {
	std::cout << "������ ����� NUBMER\n";
	//return TOKEN_NUBMER;
}
[a-zA-Z] {
		  std::cout << "������ ����� TOKEN_LITERAL\n";
		  //return LITERAL;
}
"{" { std::cout << "������ ����� {\n"; }
"}" { std::cout << "������ ����� }\n"; }
exit {
			std::cout << "������ ����� exit";
			exit(1);
}
%%