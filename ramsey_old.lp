#const nodes = 9.
#const m = 3.
#const n = 4.

node(1..nodes).
color(red, m).
color(blue, n).
color(C) :- color(C,N).

% Foreach edge coloring
1 { edge(X,Y,C) : color(C) } 1 :- node(X), node(Y), X < Y.

% Foreach clique
in(X,C) | out(X,C) :- node(X), color(C).

% Is it a clique?
notclique(C) :- in(X,C), in(Y,C), not edge(X,Y,C), X < Y.

% Is the clique of valid size?
notclique(C) :- color(C,N), (N+1) { in(X,C) : node(X) }.
notclique(C) :- color(C,N), (nodes-N+1) { out(X,C) : node(X) }.

% Derive if notclique(C)
in(1..nodes, C) :- notclique(C).
out(1..nodes, C) :- notclique(C).

% no such cliques are allowed
:- color(C), not notclique(C).

#hide.
#show edge/3.
