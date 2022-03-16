%{
#include<stdio.h>       // including the required libraries.
#include<stdlib.h>      //
int yyerror();          // function declared 
int yyparse();          //
int yylex();            //
%}

%token LI_S LI_E        // token for list (LI_S) start tag and (LI_E) end tag.
%token UL_S UL_E        // tokens for unordered list (UL_S) start tag and (UL_E) end tag.
%token OL_S OL_E        // tokens for ordered list (OL_S) start tag and (OL_E) end tag.
%token NEWLINE          // token for NEWLINE

%%


// when the input is valid it will print Valid Statement.
statement : statement S NEWLINE { printf("\nValid Statement!\n"); return 0; }  
          | 
          ;

S : UL_S S1 UL_E         // input must start with start tag and must end with end tag. (unordered list)
  | OL_S S1 OL_E         //  for onordered list tags
  | LI_S oneitem LI_E    //  for list  tags
  | S S1 S               //  for linear input tags
  ;

S1 : UL_S S1 UL_E
   | OL_S S1 OL_E
   | LI_S oneitem LI_E    
   | S1 S1
   |
   ;

oneitem : /*empty*/ | LI_S oneitem LI_E  // the li tag cannot contain the unordered or ordered list tag inside it. 
                                         // 
%%


int main(){
  printf("Enter the HTML: \n");   // Asking user for entering the input
  yyparse();                      // yyparse function called
  system("pause");                
  return 0;                        
}



int yyerror (char *str) {         // this funtion will be called when the input is not valid.
  printf("Invalid Statement \n");
  return 1;
}
 

