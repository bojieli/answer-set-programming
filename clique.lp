#const size = 4.
size { in(X) : node(X) }.
:- in(X), in(Y), not edge(X,Y), not edge(Y,X), X != Y.
#hide.
#show in/1.
