%{
	#include <iostream>
	extern char* yytext;
	void yyerror(const char* s);
	int yylex();
%}

/* создает токены, которые нужно подключить в лексер(сканер) */
%token T_NUBMER T_INDEX T_EOL T_EXIT

/* создает структуру в хедере с типом YYSTYPE */
%union {
  char *text;
  double decimal;
}

/* начало программы парсера */
%start programm

%%
/*
результат: компонент_правила( L+R )( пустая строка )( результат + результат )
	| компонент_правила
	| компонент_правила { действие; }	
	| компонент_правила { действие; } компонент_правила
	| компонент_правила1 компонент_правила2 компонент_правила3 { $$ = $1(комп1) *(комп2) $3(комп3) }	
*/

programm:
	| T_EOL { std::cout << "\n> "; } programm
	// TODO :: сделать так, чтобу можно было отправть несколько токенов сразу дла Iteratora
	| T_INDEX T_EOL { std::cout << "Получил - " << yylval.text << "\n"; } programm
	| T_EXIT T_EOL {  std::cout << "Shutdown"; exit(1); }
	;

%%