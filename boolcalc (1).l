%{
  #include <stdio.h>
  #include "boolcalc.tab.h"
%}
%option noyywrap

%%

[ \t]	;
(T|t|1)([A-Z|a-z]*)            	{yylval = 1; return NUM;}
(F|f|0)([A-Z|a-z]*)             {yylval = 0; return NUM;}
\n                              {return NEWLINE;}
\&				{return AND;}
\!				{return NOT;}
\|				{return OR;}


%%
