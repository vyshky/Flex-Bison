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
результат: компонент_правила( L + R )( пустая строка )( результат + результат )
	| компонент_правила
	| компонент_правила { действие; }	
	| компонент_правила { действие; } компонент_правила
	| компонент_правила1 компонент_правила2 компонент_правила3 { $$ = $1(комп1) * $3(комп3) }	
*/
programma:
	| programma result // pragramma == '' - то есть равно пустоте это правило будет вызванно при любом действии, так как ни какой токен не привязан к этому компоненту |||||||| result == EOL - при нажатии enter будет вызываться правило ниже. Оно делает переход в правило result и ищет совпадения
	;

result: EOL
	| exp EOL { std::cout << "Result = " << $1 << "\n"; }
	;

exp: TOKEN_NUMBER { $$ = $1; }
	| exp TOKEN_PLUS exp { $$ = $1 + $3; }
	;


%%