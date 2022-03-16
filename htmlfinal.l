%{ 
#include "htmlfinal.tab.h"  //including the tab.h file that associate the yacc-assigned token codes with your token names.
%} 


%% 

"<li>"  {return LI_S;}
"</li>" {return LI_E;}

"<ul>" { return UL_S;}     // returning unoredered list start tag to the parser.
"</ul"   { return UL_E;}   // returning unoredered list end tag to the parser.

"<ol>" {return OL_S;}      // returning ordered list start tag to the parser.
"</ol>" {return OL_E;}     // returning ordered list end tag to the parser.
.;                         // ignoring 
"<" ;                      // ignoring
">" ;
\n       {return NEWLINE;} // return NEWLINE.


%%	 

int yywrap() {             // This function is called when input is exausted.
    return 1;             
}

