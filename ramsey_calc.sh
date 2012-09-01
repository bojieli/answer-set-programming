#!/bin/bash

echoerr() { echo "$@" 1>&2; }

nodes=2;
output=0;
while [ "UNSATISFIABLE" != "$(./ramsey.sh $nodes $1 $2 | clingo | awk 'NR==1')" ]
do
	(( nodes++ ))
	echoerr -n "$nodes ";
	echoerr `date +%s`;
done
echo $nodes;
