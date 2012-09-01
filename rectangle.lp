#const n = 8.
#const num1x1 = 1.
#const num3x1 = 21.

% tiles and board
one(1..num1x1).
three(1..num3x1).
row(1..n).
col(1..n).

% cell1(R,C,T) means: (R,C) of the board is filled with No. T 1x1 tile.
1 { cell1(R,C,T) : row(R) : col(C) } 1 :- one(T).
% cell3(R,C,T) means: (R,C) of the board is filled with No. T 1x3 tile.
3 { cell3(R,C,T) : row(R) : col(C) } 3 :- three(T).

% only one tile for each cell
:- row(R), col(C), cell1(R,C,T1), cell3(R,C,T2).
:- row(R), col(C), cell1(R,C,T1), cell1(R,C,T2), T1 != T2.
:- row(R), col(C), cell3(R,C,T1), cell3(R,C,T2), T1 != T2.

% cells covered by 1x3 tile must be adjacent
:- cell3(R1,C1,T), cell3(R2,C2,T), R1 - R2 > 2.
:- cell3(R1,C1,T), cell3(R2,C2,T), C1 - C2 > 2.
:- cell3(R1,C1,T), cell3(R2,C2,T), R1 != R2, C1 != C2.

% show
#hide.
#show cell1/3.
#show cell3/3.
