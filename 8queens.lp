row(1..8).
col(1..8).
8 { queen(R,C) : row(R) : col(C) } 8.
:- queen(R,C1), queen(R,C2), C1 != C2.
:- queen(R1,C), queen(R2,C), R1 != R2.
:- queen(R1,C1), queen(R2,C2), R1 != R2, R1 - C1 == R2 - C2.
:- queen(R1,C1), queen(R2,C2), R1 != R2, R1 + C1 == R2 + C2.
#hide.
#show queen/2.
