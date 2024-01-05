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
%token T_PLUS T_MINUS T_MULT T_DIV
%token EOL

%union{
 double value;
}

/*
��������� %type
%type <value> expression T_NUMBER - �������� �������� <value> �� ��������� union � ����������� expression � �� ���� <value> ������������� � ������ T_NUMBER
%type <value> expression - �������� �������� <value> �� ��������� union � ����������� expression
%type <value> T_NUMBER - �������� �������� <value> �� ��������� union � ������ expression
*/
%type <value> expression T_NUMBER // %type <value> exp - ��������� ��, �� ��� exp ����� ����� value, � TOKEN_NUMBER ��� �������� ������ �� �������� ����� ������� ��������

/*
�� ������� ��� ������(%right) ��������������� ������ -> ������ � ��� ������, �����, �������, ����� ��������� ����� �������, ������ %left
������: x op y op z - �� �������(%right),������� ���������� ��������� ������� y op z. ���� �������� %left op, �� �������� ����� ���������� � ������ �������� x op y
%right token
%left token
%right <value> token
%left <value> token
*/
%left T_MINUS T_PLUS 
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
	| expression T_MULT expression { $$ = $1 * $3; }
	| expression T_DIV expression { $$ = $1 / $3; std::cout << $1 << " : " << $3 << " = " << $1 / $3 << "\n"; }
	;

result: EOL
	| expression EOL { std::cout << "Result = " << $1 << "\n"; }
	;

%%