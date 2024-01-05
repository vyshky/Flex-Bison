%{
	#include <iostream>
	void yyerror(const char* s);
	int yylex();
%}

/*
��������� %token
%token T_NUMBER - �������� ������ ��� �������� � ��������� �� ���������
%token <value> T_NUMBER - �������� ������ � ��������� � <value> �� ��������� union
*/
%token T_NUMBER
%token T_PLUS T_MINUS
%token EOL

%union{
 double value;
}

/*
��������� %type
%type <value> expression T_NUMBER - �������� �������� <value> �� ��������� union � ����������� expression � �� ���� <value> ������������� � ������ T_NUMBER
%type <value> expression - �������� �������� <value> �� ��������� union � ����������� expression
%type <value> T_NUMBER - �������� �������� <value> �� ��������� union � ������ T_NUMBER
*/
%type <value> expression T_NUMBER // %type <value> exp - ��������� ��, �� ��� exp ����� ����� value, � TOKEN_NUMBER ��� �������� ������ �� �������� ����� ������� ��������
%start programma
%%
/*
����������(���������, ��� �� ����� ���� �������� � ����� ������, ����� ��������� %type � ������ ����� ������): ���������_������� (��������)(������ ������)( L + R )( $$ = 1$ + 10)( ���������� + ���������� )
	| ���������_�������
	| ���������_������� { ��������; }	
	| ���������_������� { ��������; } ���������_�������
	| ���������_�������1 ���������_�������2 ���������_�������3 { $$ = $1(����1) * $3(����3) }
��������� ������ � ����� ����, ������� ������� ����� ������� ���������
*/

programma:
	| programma result { std::cout<< "programma\n"; } // pragramma == '' - �� ���� ����� ������� ��� ������� ����� �������� ��� ����� ��������, ��� ��� �� ����� ����� �� �������� � ����� ���������� |||||||| result == EOL - ��� ������� enter ����� ���������� ������� ����. ��� ������ ������� � ������� result � ���� ����������
	;

expression: T_NUMBER { $$ = $1; }
	| expression T_PLUS expression { $$ = $1 + $3; }
	| expression T_MINUS expression { $$ = $1 - $3; }
	| T_MINUS expression { $$ = -$2; }
	| T_MINUS expression T_MINUS T_MINUS expression { $$ = $2 + $5; }
	;

result: EOL
	| expression EOL { std::cout << "Result = " << $1 << "\n"; }
	;

%%