%{
    #include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	#include<math.h>
%}

KEY         [a-zA-Z][_a-zA-Z0-9]*
NUM         [0-9]*
FLOAT       [0-9]+[.][0-9]+
TYPES       "int"|"float"|"char"

%%
['('][' ']*{KEY}[' ']*['=']['=']['='][' ']*{KEY}[' ']*[')']                               {  printf("Check Equal\n"); }

['('][' ']*{KEY}[' ']*['!']['!']['!'][' ']*{KEY}[' ']*[')']                               { printf("Check INEQUAL \n"); }

['('][' ']*{KEY}[' ']*['<'][' ']*{KEY}[' ']*[')']                                         { printf("LT\n"); }

['('][' ']*{KEY}[' ']*['>'][' ']*{KEY}[' ']*[')']                                         { printf("GT\n"); }

['('][' ']*{KEY}[' ']*['<']['='][' ']*{KEY}[' ']*[')']                                    { printf("LESS OR EQUAL\n"); }

['('][' ']*{KEY}[' ']*['>']['='][' ']*{KEY}[' ']*[')']                                    { printf("GREATER OR EQUAL\n"); }

"for"['('][' ']*{KEY}[' ']+"in"[' ']*"["[ ]*{NUM}[,][ ]*{NUM}[,][ ]*{NUM}[ ]*"]"[ ]*[')'] { printf("FOR Loop, Range and Increment\n"); }

"print"[ ]*['(']({KEY}|{NUM})[')'][;]                                                     { printf("Print Variable\n"); }

"print"[ ]*['('](.*)[')'][;]                                                              { printf("Print Text String\n"); }

"import"[ ]+{KEY}[.][h][ ]*                                                               { printf("INCLUDE Header\n"); }

"cos"[ ]*[(]({KEY}|{NUM})[)][;]                                                           { printf("Cosine Function\n"); }

"sin"[ ]*[(]({KEY}|{NUM})[)][;]                                                           { printf("Sine Function\n"); }

"tan"[ ]*[(]({KEY}|{NUM})[)][;]                                                           { printf("Tangent Function\n"); }

"max"[(]({NUM})[,]({NUM})[)][;]                                                           { printf("Maximum Number check\n"); }

"min"[(]({NUM})[,]({NUM})[)][;]                                                           { printf("Minimum Number check\n"); }

"@@"                                                                                      {
                                                                                                 printf("Single Line Comment\n");
                                                                                                 char c;
                                                                                                 while(c = input() != '\n') {
                                                                                                 printf("%c", c);
                                                                                                   }
                                                                                                 printf("\n");
                                                                                            }

"int"[ ]*                                                           { printf("Integer Declaration\n"); }
"float"[ ]*                                                         { printf("Float Declaration\n"); }
"char"[ ]*                                                          { printf("Character Declaration\n"); }
"const"[ ]*                                                         { printf("Constant Declaration\n"); }
"sqr"                                                               { printf("SQUARE\n"); }
"cub"                                                               { printf("CUBIC\n"); }
"max"                                                               { printf("MAXIMUM Check\n"); }
"min"                                                               { printf("MINIMUM Check\n"); }


"if"                                                                { printf("Conditional Statement if\n"); }
"elif"                                                              { printf("Conditional Statement elif\n"); }
"else"                                                              { printf("Conditional Statement else\n"); }


"for"                                                               { printf("Loop\n"); }

"while"                                                             { printf("Loop\n"); }

"="                                                                 { printf("ASSIGNMENT\n"); }

"+"                                                                 { printf("ADDITION\n"); }

"-"                                                                 { printf("SUBTRACTION\n"); }

"*"                                                                 { printf("MULTIPLICATION\n"); }

"/"                                                                 { printf("DIVISION\n"); }

"^"                                                                 { printf("EXPONENTIATION\n"); }

"++"                                                                { printf("INCREMENT\n"); }   

"--"                                                                { printf("DECREMENT\n"); }  

"<"                                                                 { printf("LESS THAN\n"); }

">"                                                                 { printf("GREATER THAN\n"); }

"<="                                                                { printf("LESS THAN OR EQUAL\n"); }

">="                                                                { printf("GREATER THAN OR EQUAL\n"); }

"==="                                                               { printf("Check Equality\n"); }

"!="                                                                { printf("Check Inequality\n"); }

"&&"                                                                { printf("AND Operator\n"); }

"||"                                                                { printf("OR Operator\n"); }

"~~"                                                                { printf("NOT Operator\n"); }


"{"                                                                 { printf("Opening Bracket\n"); }

"}"                                                                 { printf("Closing Bracket\n"); }

"("                                                                 { printf("Opening Parenthesis\n"); }

")"                                                                 { printf("Closing Parenthesis\n"); }

"["                                                                 { printf("Opening Bracket\n"); }

"]"                                                                 { printf("Closing Bracket\n"); }

";"                                                                 { printf("Semicolon\n"); }

{KEY}                                                               { printf("VARIABLE\n"); }

{FLOAT}                                                             { printf("FLOAT Point Value\n"); }

{NUM}                                                               { printf("NUM\n"); }

\n                                                                  { printf("\n"); }
[ ] {}

%%

int yywrap() {
    return 1;
}

int main() {
    yyin = freopen("in.txt", "r", stdin);
    yyout = freopen("out.txt", "w", stdout);
    yylex();
    return 0;
}