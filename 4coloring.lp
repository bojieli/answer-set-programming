#const n = 4.
1 { color(X,1..n) } 1 :- node(X).
:- edge(X,Y), color(X,C), color(Y,C).
:- edge(Y,X), color(X,C), color(Y,C).
#hide.
#show color/2.
