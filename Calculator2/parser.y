%{
	#include <iostream>
	void yyerror(const char* s);
	int yylex();
%}

/*
Структура %token
%token T_NUMBER - Создание токена без привязок к значениям из структуры
%token <value> T_NUMBER - Создание токена с привязкой к <value> из структуры union
*/
%token T_NUMBER
%token T_PLUS T_MINUS T_MULT T_DIV
%token EOL

%union{
 double value;
}

/*
Структура %type
%type <value> expression T_NUMBER - Создание привязки <value> из структуры union к нетерминалу expression и за одно <value> привязывается к токену T_NUMBER
%type <value> expression - Создание привязки <value> из структуры union к нетерминалу expression
%type <value> T_NUMBER - Создание привязки <value> из структуры union к токену expression
*/
%type <value> expression T_NUMBER // %type <value> exp - указывает на, то что exp будет типом value, а TOKEN_NUMBER это привязка токена из которого будет браться значение

/*
По дефолту все токены(%right) воспроизводятся справо -> налево и при минусе, плюсе, делении, нужно считывать слево направо, опцией %left
Пример: x op y op z - по дефолту(%right),сначало выполнится последняя операци y op z. Если пропишем %left op, то операции будут выполнятся с первой операции x op y
%right token
%left token
%right <value> token
%left <value> token
*/
%left T_MINUS T_PLUS 
%start programma
%%
/*
нетерминал(результат, так же могут быть проблемы с типом данных, нужно создавать %type с нужным типом данных): компонент_правила (действие)(пустая строка)( L + R )( $$ = 1$ + 10)( нетерминал + нетерминал )
	| компонент_правила
	| компонент_правила { действие; }	
	| компонент_правила { действие; } компонент_правила
	| компонент_правила1 компонент_правила2 компонент_правила3 { $$ = $1(комп1) * $3(комп3) }
Приоритет правил с верху вниз, верхнии правили имеют больший приоритет
*/

programma:
	| programma result { std::cout<< "programma\n"; } // pragramma == '' - то есть равно пустоте это правило будет вызванно при любом действии, так как ни какой токен не привязан к этому компоненту |||||||| result == EOL - при нажатии enter будет вызываться правило ниже. Оно делает переход в правило result и ищет совпадения
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