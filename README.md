Answer Set Programming Assignments
----------------------------------
Bojie Li (PB10000603)

Environment
-----------
* GNU/Linux (Archlinux) 3.5.2 kernel
* clingo 3.0.4 (clasp 1.3.10)
* GCC 4.7.1
* bash 4.2.37
* python 3.2.3

Please contact me (boj AT mail.ustc.edu.cn) if you have trouble with the required software environment.

Sudoku
------

    clingo suduku.lp suduku\_data.lp

To verify sudoku result and pretty-print:

    gcc sudoku_verify.c -o sudoku_verify
    clingo sudoku.lp sudoku_data.lp | awk 'NR==2' | ./sudoku_verify

Rectangle Covering
------------------

one 1x1 tile, 21 1x3 tiles:

    clingo rectangle.lp

two 1x2 tiles, 20 1x3 tiles:

    clingo rectangle23.lp

Ramsey
------

    ./ramsey.sh nodes m n | clingo

For example, judge whether R(3,3)>=6:

    ./ramsey.sh 6 3 3 | clingo

To view the ASP program as bash script's output:

    ./ramsey.sh nodes m n

To calculate R(m,n), use ramsey\_calc.sh. For example R(4,3) = 9:

    ./ramsey_calc.sh 4 3

The ramsey problem can be separated into guess and check parts. The guess part generates a edge coloring and the check part verifies whether there is a mono-color clique with size m (n). The check part itself is NP-Complete. Unfortunately there is neither a way to generate atoms dynamically, nor a way to call a subprocedure in ASP.

IMHO The ramsey problem has complexity NP^ NP and cannot be polynomially represented in normal logic program.

It is possible to follow Godel's approach and encode each edge coloring with a number using Lua script embedded in ASP, thus making a single atom out of a subset of atom. But it is too complicated.

After a few days of thinking I give up the `procedure-call' approach and write a bash script to generate ASP program with variable number of atoms (X1..Xn, Y1..Ym), which is not a pure-ASP solution, while IMHO better than not solving it :)

There is a paper on this topic, which proposes an algorithm to merge two disjunctive programs into a single one. However I cannot understand it. (arXiv:cs/0501084) Towards Automated Integration of Guess and Check Programs in Answer Set Programming

Deductive Reasoning
-------------------

    clingo reasoning.lp

For pretty-printing:

    clingo reasoning.lp | awk 'NR==2' | ./reasoning_check.py


Additional Problems (by my own interest)
----------------------------------------

4-color an indirected graph:

    clingo 4coloring.lp 4coloring_data.lp

Chinese Postman Problem:

    clingo postman.lp postman_data.lp

8 queens problem:

    clingo 8queens.lp

Determine Cliques in Graph: (params: clique size in #const)

    clingo clique.lp clique_data.lp
