%{
	#include <iostream>
	void yyerror(const char* s);
	int yylex();
%}

/*
—труктура %token
%token T_NUMBER - —оздание токена без прив€зок к значени€м из структуры
%token <value> T_NUMBER - —оздание токена с прив€зкой к <value> из структуры union
*/
%token T_NUMBER
%token T_PLUS T_MINUS
%token EOL

%union{
 double value;
}

/*
—труктура %type
%type <value> expression T_NUMBER - —оздание прив€зки <value> из структуры union к нетерминалу expression и за одно <value> прив€зываетс€ к токену T_NUMBER
%type <value> expression - —оздание прив€зки <value> из структуры union к нетерминалу expression
%type <value> T_NUMBER - —оздание прив€зки <value> из структуры union к токену T_NUMBER
*/
%type <value> expression T_NUMBER // %type <value> exp - указывает на, то что exp будет типом value, а TOKEN_NUMBER это прив€зка токена из которого будет братьс€ значение
%start programma
%%
/*
нетерминал(результат, так же могут быть проблемы с типом данных, нужно создавать %type с нужным типом данных): компонент_правила (действие)(пуста€ строка)( L + R )( $$ = 1$ + 10)( нетерминал + нетерминал )
	| компонент_правила
	| компонент_правила { действие; }	
	| компонент_правила { действие; } компонент_правила
	| компонент_правила1 компонент_правила2 компонент_правила3 { $$ = $1(комп1) * $3(комп3) }
ѕриоритет правил с верху вниз, верхнии правили имеют больший приоритет
*/

programma:
	| programma result { std::cout<< "programma\n"; } // pragramma == '' - то есть равно пустоте это правило будет вызванно при любом действии, так как ни какой токен не прив€зан к этому компоненту |||||||| result == EOL - при нажатии enter будет вызыватьс€ правило ниже. ќно делает переход в правило result и ищет совпадени€
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