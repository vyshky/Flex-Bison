#ifndef YY_YY_PARSER_H_INCLUDED
/* Token kinds.  */
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define LCURLY 258
#define RCURLY 259
#define LBRAC 260
#define RBRAC 261
#define COMMA 262
#define COLON 263
#define VTRUE 264
#define VFALSE 265
#define VNULL 266
#define STRING 267
#define DECIMAL 268

int yyparse (void);

#endif /* !YY_YY_PARSER_H_INCLUDED  */
