#const n = 8.
#const num2x1 = 2.
#const num3x1 = 20.

% tiles and board
two(1..num2x1).
three(1..num3x1).
row(1..n).
col(1..n).

% cell2(R,C,T) means: (R,C) of the board is filled with No. T 1x2 tile.
2 { cell2(R,C,T) : row(R) : col(C) } 2 :- two(T).
% cell3(R,C,T) means: (R,C) of the board is filled with No. T 1x3 tile.
3 { cell3(R,C,T) : row(R) : col(C) } 3 :- three(T).

% only one tile for each cell
:- row(R), col(C), cell2(R,C,T1), cell3(R,C,T2).
:- row(R), col(C), cell2(R,C,T1), cell2(R,C,T2), T1 != T2.
:- row(R), col(C), cell3(R,C,T1), cell3(R,C,T2), T1 != T2.

% cells covered by 1x2 tile must be adjacent
:- cell2(R1,C1,T), cell2(R2,C2,T), R1 - R2 > 1.
:- cell2(R1,C1,T), cell2(R2,C2,T), C1 - C2 > 1.
:- cell2(R1,C1,T), cell2(R2,C2,T), R1 != R2, C1 != C2.

% cells covered by 1x3 tile must be adjacent
:- cell3(R1,C1,T), cell3(R2,C2,T), R1 - R2 > 2.
:- cell3(R1,C1,T), cell3(R2,C2,T), C1 - C2 > 2.
:- cell3(R1,C1,T), cell3(R2,C2,T), R1 != R2, C1 != C2.

% show
#hide.
#show cell2/3.
#show cell3/3.
