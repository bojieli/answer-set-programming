num(1..9).
border(1;4;7).
% each cell contains one number
1 { x(R,C,N) : num(N) } :- num(R), num(C).
% each number once per each box
1 { x(R,C,N) : num(R) : num(C) : R1<=R : R<=R1+2 : C1<=C : C<=C1+2 } 1 :- num(N), border(R1), border(C1).
% each number once per each row
1 { x(R,C,N) : num(C) } 1 :- num(R), num(N).
% each number once per each column
1 { x(R,C,N) : num(R) } 1 :- num(C), num(N).
% show
#hide.
#show x/3.
