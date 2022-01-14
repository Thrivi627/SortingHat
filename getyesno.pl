%.... Prolog Program by Thrividya 
%.... Obtaining user input
%.... Only yes or no answers are accepted
get_yes_or_no(Result) :- get(Char), 
 		   get0(_), 
		   interpret(Char,Result), !.

get_yes_or_no(Result) :- nl,
 		     write('Type Y or N:'),
		     get_yes_or_no(Result).
interpret(89,yes). 
interpret(121,yes). 
interpret(78,no). 
interpret(110,no). 
