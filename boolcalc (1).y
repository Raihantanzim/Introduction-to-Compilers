%{
#include<stdio.h>
#include<math.h>

int yylex (void);
extern int yyparse();
extern FILE* yyin;

void yyerror (char const *);
%}

%define api.value.type {double}

%token NUM
%token AND NOT OR
%token NEWLINE
%start input


%%

input:
  %empty
| input line
;

line:
  NEWLINE
|exp NEWLINE
  {if($1==1){
     printf("TRUE\n");
  }else{
    printf("FALSE\n");
  }}
;

exp:
  NUM
| exp exp AND {$$ = $1 && $2;}
| exp NOT {$$ = !$1;}
| exp exp OR {$$ = $1 || $2;}
;
%%


void yyerror (char const *s){
  fprintf(stderr, "%s\n",s);
}

int main(void){
  yyin = stdin;
  do {
	yyparse();
  } while (!feof(yyin));
  return 0;
}  
