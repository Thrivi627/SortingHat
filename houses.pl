%.... Prolog Program by Thrividya
% .... Protego
%.... Protego Horribilis
%.... Protego Totalum
:- consult('getyesno.pl'). 

% Main control procedures
start :-
 write('Greetings from the Sorting Hat!'),nl,
 write('I am the oldest talking hat in the world'),nl,
 write('Answer the questions with either Y for yes or N for no.'),nl,
 write('Once you finish, I will sort you to your Hogwarts House.'),nl,
 write('May you be sorted to the best house that fits you. Good luck!'),nl,
 clear_stored_answers,
 try_all_possibilities.

try_all_possibilities :- 
 your_house_is(H),
 explain(H),
 fail.
try_all_possibilities. 


% House-sorting knowledge base
% Determines to which house the student belongs to
your_house_is(gryffindor) :-
 student_says(gr,yes),
 student_says(sl,no),
 student_says(ra,no).

your_house_is(slytherin) :-
 student_says(gr,no),
 student_says(sl,yes),
 student_says(ra,no).

your_house_is(ravenclaw) :-
 student_says(gr,no),
 student_says(sl,no),
 student_says(ra,yes).

your_house_is(hufflepuff) :-
 student_says(gr,no),
 student_says(sl,no),
 student_says(ra,no).

your_house_is(centaur) :-
 student_says(gr,yes),
 student_says(sl,yes),
 student_says(ra,no).

your_house_is(house_elf) :-
 student_says(gr,yes),
 student_says(sl,yes),
 student_says(ra,yes).

your_house_is(goblin) :-
 student_says(gr,no),
 student_says(sl,yes),
 student_says(ra,yes).

your_house_is(leprechaun) :-
 student_says(gr,yes),
 student_says(sl,no),
 student_says(ra,yes).


% Houses knowledge base
:- dynamic(stored_answer/2).
clear_stored_answers :- retract(stored_answer(_,_)),fail.
clear_stored_answers.

student_says(Q,A) :- stored_answer(Q,A).

student_says(Q,A) :- \+ stored_answer(Q,_),
 nl,nl,
 ask_question(Q),
 get_yes_or_no(Response),
 asserta(stored_answer(Q,Response)),
 Response = A.

% Sorting questions
ask_question(gr) :-
 write('Are you scared of darkness and uncertainty?'),nl.
ask_question(sl) :-
 write('Are you scared of fire and uncertainty? '),nl.
ask_question(ra) :-
 write('Are you scared of fire and darkness?'),nl.

% Explanations for houses Sorting Hat POV
explain(gryffindor) :-
 nl,
 write('It is GRYFFINDOR!'),nl,
 write('Gryffindors are courageous, brave, determined, daring, and chivalrous.'),nl,
 write('Enjoy your days in the house of Hogwarts Founder Godric Gryffindor!'),nl.
 
explain(slytherin) :-
 nl,
 write('It is SLYTHERIN!'),nl,
 write('Slytherins are resourceful, determined, proud, cunning, and ambitious.'),nl,
 write('Enjoy your days in the house of Hogwarts Founder Salazar Slytherin!'),nl.

explain(ravenclaw) :-
 nl,
 write('It is RAVENCLAW!'),nl,
 write('Ravenclaws are intelligent, witty, creative, determined, and sharp.'),nl,
 write('Enjoy your days in the house of Hogwarts Founder Rowena Ravenclaw!'),nl.

explain(hufflepuff) :-
 nl,
 write('It is HUFFLEPUFF!'),nl,
 write('Hufflepuffs are fair, loyal, hardworking, determined, and brave.'),nl,
 write('Enjoy your days in the house of Hogwarts Founder Helga Hufflepuff!'),nl.

explain(centaur) :-
 nl,
 write('YOU ARE NOT ALLOWED HERE!'),nl,
 write('GO BACK TO THE FORIBIDDEN FOREST!'),nl,
 write('ANNOYING CENTAUR!'),nl,
 write('SHOO!'),nl.

explain(house_elf) :-
 nl,
 write('WHAT ARE YOU DOING HERE WASTING MY TIME?'),nl,
 write('GO BACK TO THE KITCHEN, NOW!'),nl,
 write('STUPID HOUSE ELF!'),nl,
 write('SHOO!'),nl.

explain(goblin) :-
 nl,
 write('WHY THE HELL ARE YOU HERE?'),nl,
 write('IF MY MONEY GETS ROBBED, YOU WILL SUFFER!'),nl,
 write('RUN BACK TO GRINGOTTS!'),nl,
 write('SHOO!'),nl.
 
explain(leprechaun) :-
 nl,
 write('ARE YOU DONE BEING ANNOYING?'),nl,
 write('GO BACK TO YOU STUPID RAINBOW AND FAKE GOLD!'),nl,
 write('UNBEARABLE LEPRECHAUN!'),nl,
 write('SHOO!'),nl.
