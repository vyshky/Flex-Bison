%{
	#include <iostream>
	void yyerror(const char* s);
	int yylex();
%}

/*
��������� %token
	| %token T_NUMBER - �������� ������ ��� �������� � ��������� �� ���������
	| %token <value> T_NUMBER - �������� ������ � ��������� � <value> �� ��������� union
	| %token T_NUMBER 300 - �������� enum �������� 300, ����� ����� �� ������, ����� ���������� ���������. ����� bison ��� ������� id ��� ������
*/

%token T_NUMBER EOL
%token T_RIGHT_BRACKET T_LEFT_BRACKET

%union{
 double value;
}

/*
��������� %type
	| %type <value> expression T_NUMBER - �������� �������� <value> �� ��������� union � ����������� expression � �� ���� <value> ������������� � ������ T_NUMBER
	| %type <value> expression - �������� �������� <value> �� ��������� union � ����������� expression
	| %type <value> T_NUMBER - �������� �������� <value> �� ��������� union � ������ expression
*/
%type <value> expression T_NUMBER // %type <value> exp - ��������� ��, �� ��� exp ����� ����� value, � TOKEN_NUMBER ��� �������� ������ �� �������� ����� ������� ��������

/*
��������� %left %right
�� ������� ��� ������(%right) ��������������� ������ -> ������ � ��� ������, �����, �������, ����� ��������� ����� �������, ������ %left
������: x op y op z - �� �������(%right),������� ���������� ��������� ������� y op z. ���� �������� %left op, �� �������� ����� ���������� � ������ �������� x op y
	| %right token
	| %left token
	| %right <value> token
	| %left <value> token
*/

%left T_MINUS T_PLUS
%left T_MULT T_DIV T_EXPON

%start programma
%%
/*
����������(����� ���������� ����� ����������� � <value> �� union, ����� ������ ��� ���������� ����� ������� ���� %type � %token): ���������_������� (��������)(������ ������)( L + R )( $$ = 1$ + 10)( ���������� + ���������� )
	| ���������_�������
	| ���������_������� { ��������; }	
	| ���������_������� { ��������; } ���������_�������
	| ���������_�������1 ���������_�������2 ���������_�������3 { $$ = $1(����1) * $3(����3) }
��������� ������ � ����� ����, ������� ������� ����� ������� ���������
*/

/*
����������� �������
������������ � �������������, ��������, ������ ����� �� ������
����������:
	| ���������� ���������_������� { ��������; } - �������� ����������, �������� ���������_�������, �������� { ��������; }
	| ���������_������� ���������� { ��������; } - �������� ���������_�������, �������� ������� �� �����������, �� �������� { ��������; }
	| ���������_������� { ��������; } ���������� - �������� ���������_�������, �������� ������� �� �����������, �������� { ��������; }
*/

programma:
	| programma result // ����������� ����� ������� �� ����� �����������. pragramma == '' - �� ���� ����� ������� ��� ������� ����� �������� ��� ����� ��������, ��� ��� �� ����� ����� �� �������� � ����� ����������. result == EOL - ��� ������� enter ����� ���������� ������� ����. ��� ������ ������� � ������� result � ���� ����������
	;

result: EOL
	| expression EOL { std::cout << "Result = " << $1 << "\n"; }
	;

expression: T_NUMBER { $$ = $1; } // ��������� �� �����������, �������� ����� ��� ��
	| expression T_PLUS expression { $$ = $1 + $3; std::cout << $1 << " + " << $3 << " = " << $1 + $3 << "\n"; }
	| expression T_MINUS expression { $$ = $1 - $3; std::cout << $1 << " - " << $3 << " = " << $1 - $3 << "\n"; }
	| T_MINUS expression { $$ = -$2; }
	| expression T_MULT expression { $$ = $1 * $3; std::cout << $1 << " * " << $3 << " = " << $1 * $3 << "\n"; }
	| expression T_DIV expression { $$ = $1 / $3; std::cout << $1 << " : " << $3 << " = " << $1 / $3 << "\n"; }
	| T_LEFT_BRACKET expression T_RIGHT_BRACKET { $$ = $2; }
	;

%%