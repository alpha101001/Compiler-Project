%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	#include "project.tab.h"
	extern int yyval;
	
%}


variable [a-zA-Z]*
digit [0-9]
header		"import ".*
Comment		[!].*

%%

"IF" 			{return IF;   }
"ELSE" 		   	{return ELSE; }
"{" 		   	{return BS;  }
"}"  		   	{return BE;	}
"FOR" 		   	{return floop;}
"WHILE"		   	{return wloop;}
"SWITCH" 		{return SWITCH;}
"CASE" 			{return CASE;}
"DEFAULT" 		{return DEFAULT;}
"alpha53"	{printf("\nMain Function Start\n"); return major; }

"PRINT" 	{return print; } 
"int"  		{return INT;}
"char" 		     {return CHAR;}
"float"			 {return FLOAT;}
"array"			{return array;}

"oddeven"		{return odd_even;}
"fact"		{return factorial;}



"CLASS"			{printf("New Class  Name : ");ECHO; return class;}
"function"		{ECHO; return function;}
"sin"		   {return SIN;}
"cos"          {return COS;}
"log"		{return LOG;}
"tan"          {return TAN;}

{digit}+		{yylval.v = atoi(yytext); return NUM; }
{variable}	    {ECHO;printf("\n"); yylval.d = *yytext - 'a'; return	var; }
{Comment}		{printf("\nSingle line Comment found :: ");ECHO;printf("\n");}
{header}  				{printf("\nHeader file found :\n");ECHO;printf("\n");}
[-+/*<>=,():;%^]     {return *yytext;	}


[ ]*	    			{}
[\n]*				{}
[\t]*					{}
.						{printf("\nUnknown Syntax : %s\n",yytext);}


%%

