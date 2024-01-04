%{
	#include <iostream>
	extern char* yytext;
	void yyerror(const char* s);
	int yylex();
%}

/* ������� ������, ������� ����� ���������� � ������(������) */
%token T_NUBMER T_INDEX T_EOL T_EXIT

/* ������� ��������� � ������ � ����� YYSTYPE */
%union {
  char *text;
  double decimal;
}

/* ������ ��������� ������� */
%start programm

%%
/*
���������: ���������_�������( L+R )( ������ ������ )( ��������� + ��������� )
	| ���������_�������
	| ���������_������� { ��������; }	
	| ���������_������� { ��������; } ���������_�������
	| ���������_�������1 ���������_�������2 ���������_�������3 { $$ = $1(����1) *(����2) $3(����3) }	
*/

programm:
	| T_EOL { std::cout << "\n> "; } programm
	// TODO :: ������� ���, ����� ����� ���� �������� ��������� ������� ����� ��� Iteratora
	| T_INDEX T_EOL { std::cout << "������� - " << yylval.text << "\n"; } programm
	| T_EXIT T_EOL {  std::cout << "Shutdown"; exit(1); }
	;

%%