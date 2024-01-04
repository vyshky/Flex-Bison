%{
	#include <iostream>
	void yyerror(const char* s);
	int yylex();
%}
%token TOKEN_NUMBER TOKEN_PLUS EOL

%union{
 double value;
}
%type <value> exp TOKEN_NUMBER
%start programma

%%
/*
���������: ���������_�������( L + R )( ������ ������ )( ��������� + ��������� )
	| ���������_�������
	| ���������_������� { ��������; }	
	| ���������_������� { ��������; } ���������_�������
	| ���������_�������1 ���������_�������2 ���������_�������3 { $$ = $1(����1) * $3(����3) }	
*/
programma:
	| programma result // pragramma == '' - �� ���� ����� ������� ��� ������� ����� �������� ��� ����� ��������, ��� ��� �� ����� ����� �� �������� � ����� ���������� |||||||| result == EOL - ��� ������� enter ����� ���������� ������� ����. ��� ������ ������� � ������� result � ���� ����������
	;

result: EOL
	| exp EOL { std::cout << "Result = " << $1 << "\n"; }
	;

exp: TOKEN_NUMBER { $$ = $1; }
	| exp TOKEN_PLUS exp { $$ = $1 + $3; }
	;


%%