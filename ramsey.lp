#const nodes = 5.
#const m = 3.
#const n = 3.

node(1..nodes).
1 { red(X,Y), blue(X,Y) } 1 :- node(X;Y), X < Y.

:- red(X1,X2), red(X2,X3), red(X1,X3), node(X1;X2;X3).
:- blue(X1,X2), blue(X2,X3), blue(X1,X3), node(X1;X2;X3).

#hide.
#show red/2.
