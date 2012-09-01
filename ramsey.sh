#!/bin/bash

echo "
#const nodes = $1.
#const m = $2.
#const n = $3.

node(1..nodes).
1 { red(X,Y), blue(X,Y) } 1 :- node(X;Y), X < Y.
"

function show {
	echo -n ":- "
	for ((i=1; i<$n; i++)) do
		for ((j=$i+1; j<=$n; j++)) do
			echo -n "$color(X$i,X$j),"
		done
	done
	echo -n "node("
	for ((i=1; i<$n; i++)) do
		echo -n "X$i;"
	done
	echo "X$n)."
}

color="red"
n=$2
show
color="blue"
n=$3
show

echo "
#hide.
#show red/2.
"
