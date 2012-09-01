% Generate
1 { cycle(X,Y) : cost(X,Y,C) } 1 :- node(X).
1 { cycle(X,Y) : cost(X,Y,C) } 1 :- node(Y).
% Define
reached(X) :- cycle(1,X).
reached(X) :- reached(Y), cycle(Y,X).
% Test
:- node(Y), not reached(Y).
#minimize [ cycle(X,Y) = C : cost(X,Y,C) ].
% Show
#hide.
#show cycle/2.
