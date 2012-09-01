man(1..4).

% Use lower case because of limitations of ASP grammar.
petname(sparky;waggles;unknown1;unknown2).
1 { petname(X,P) : petname(P) } 1 :- man(X).
1 { petname(X,P) : man(X) } 1 :- petname(P).

firstname(abner;chuck;duane;bruce).
1 { firstname(X,P) : firstname(P) } 1 :- man(X).
1 { firstname(X,P) : man(X) } 1 :- firstname(P).

lastname(engels;foster;gunter;halevy).
1 { lastname(X,P) : lastname(P) } 1 :- man(X).
1 { lastname(X,P) : man(X) } 1 :- lastname(P).

pet(iguana;jackel;kingcobra;llama).
1 { pet(X,P) : pet(P) } 1 :- man(X).
1 { pet(X,P) : man(X) } 1 :- pet(P).

% Rule 1
petname(X, sparky) :- lastname(X, engels).
:- firstname(X, abner), lastname(X, engels).
:- firstname(X, abner), lastname(X, foster).

% Rule 2
:- pet(X, iguana), firstname(X, chuck).
:- pet(X, iguana), firstname(X, duane).

% Rule 3
:- pet(X, jackel), lastname(X, foster).
:- pet(X, kingcobra), lastname(X, foster).

% Rule 4
petname(X, waggles) :- firstname(X, duane).
:- pet(X, llama), firstname(X, duane).

% Rule 5
:- pet(X, kingcobra), firstname(X, abner).
:- firstname(X, abner), lastname(X, gunter).

% Rule 6
:- firstname(X, bruce), lastname(X, foster).

% Rule 7
:- pet(X, iguana), lastname(X, halevy).

#hide.
#show pet/2.
#show firstname/2.
#show lastname/2.
