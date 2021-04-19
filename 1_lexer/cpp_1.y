%{
	#include<stdio.h>
	int yylex(void);
	void yyerror(char*);
	int flag = 1;
%}

%token T_colon
%token T_ques
%token WHILE
%token FOR
%token IF
%token ELSE
%token COUT
%token ENDL
%token BREAK
%token CONTINUE
%token INT
%token CHAR
%token VOID
%token INCLUDE
%token MAINTOK
%token NUM
%token FLOAT
%token ID
%token H
%token STRING

%left T_eq
%left T_or
%left T_and
%left T_eqeq T_neq
%left T_lt T_gt T_lteq T_gteq
%left T_pl T_min
%left T_mul T_div
%left T_not

%%
S
	: START
	;
START
	: INCLUDE T_lt H T_gt MAIN
	| INCLUDE '\"' H '\"' MAIN
	;
MAIN
	: VOID MAINTOK BODY
	| INT MAINTOK BODY
	;
BODY
	: '{' C '}'
	;
C
	: C statement ';'
	| C LOOPS
	| statement ';'
	| LOOPS
	;
LOOPS
	: WHILE '(' COND ')' LOOPBODY
	| FOR '(' ASSIGN_EXPR ';' COND ';' statement ')' LOOPBODY
	| IF '(' COND ')' LOOPBODY
	| IF '(' COND ')' LOOPBODY ELSE LOOPBODY
	;
LOOPBODY
	: '{' LOOPC '}'
	| ';'
	| statement ';'
	;
LOOPC
	: LOOPC statement ';'
	| LOOPC LOOPS
	| statement ';'
	| LOOPS
	;
statement
	: ASSIGN_EXPR
	| EXP
	| TERNARY_EXPR
	| PRINT
	;
COND
	: LIT RELOP LIT
	| LIT
	| LIT RELOP LIT bin_boolop LIT RELOP LIT
	| un_boolop '(' LIT RELOP LIT ')'
	| un_boolop LIT RELOP LIT
	| LIT bin_boolop LIT
	| un_boolop '(' LIT ')'
	| un_boolop LIT
	;
ASSIGN_EXPR
	: ID T_eq EXP
	| TYPE ID T_eq EXP
	;
EXP
	: ADDSUB
	| EXP T_lt ADDSUB
	| EXP T_gt ADDSUB
	;
ADDSUB
	: TERM
	| EXP T_pl TERM
	| EXP T_min TERM
	;
TERM
	: FACTOR
	| TERM T_mul FACTOR
	| TERM T_div FACTOR
	;
FACTOR
	: LIT
	| '(' EXP ')'
	;
TERNARY_EXPR
	: '(' COND ')' T_ques ternary_statement
	;
ternary_statement
	: statement T_colon statement
	;
PRINT
	: COUT T_lt T_lt STRING
	| COUT T_lt T_lt STRING T_lt T_lt ENDL
	;
LIT
	: ID
	| NUM
	;
TYPE
	: INT
	| CHAR
	| FLOAT
	;
RELOP
	: T_lt
	| T_gt
	| T_lteq
	| T_gteq
	| T_neq
	| T_eqeq
	;
bin_boolop
	: T_and
	| T_or
	;
	/* un_arop
	: T_incr
	| T_decr
	;
	*/
un_boolop
	: T_not
	;
%%
void yyerror(char *s) 
{
	fprintf(stderr, "%s\n", s);
	flag = 0;
}

int main(void)
{
	yyparse();
	if(flag)
		printf("Valid syntax\n");
	return 0;
}
