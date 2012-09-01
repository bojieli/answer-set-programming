#include<stdio.h>
int main() {
	int board[10][10] = {0};
	int counter[10];
	int r, c, n;
	int i, j, k, l;
	
	while (scanf("x(%d,%d,%d) ", &r, &c, &n) != EOF) {
		if (r<1 || r>9 || c<1 || c>9 || board[r][c] != 0 || n<1 || n>9) {
			printf("Invalid input %d %d %d!", r, c, n);
			return 1;
		}
		board[r][c] = n;
	}

	// check each line
	for (i=1; i<=9; i++) {
		for (j=1; j<=9; j++)
			counter[j] = 0;
		for (j=1; j<=9; j++)
			counter[board[i][j]]++;
		for (j=1; j<=9; j++)
			if (counter[j] != 1) {
				printf("Error Line %d", i);
				return 1;
			}
	}
	// check each row
	for (j=1; j<=9; j++) {
		for (i=1; i<=9; i++)
			counter[i] = 0;
		for (i=1; i<=9; i++)
			counter[board[i][j]]++;
		for (i=1; i<=9; i++)
			if (counter[i] != 1) {
				printf("Error Row %d", j);
				return 1;
			}
	}
	// check each box
	for (i=1; i<=9; i+=3)
		for (j=1; j<=9; j+=3) {
			for (k=1; k<=9; k++)
				counter[k] = 0;
			for (k=0; k<3; k++)
				for (l=0; l<3; l++)
					counter[board[i+k][l+j]]++;
			for (k=1; k<=9; k++)
				if (counter[k] != 1) {
					printf("Error box (%d,%d)", i, j);
					return 1;
				}
		}

	// print
	for (i=1; i<=9; i++) {
		for (j=1; j<=9; j++)
			printf("%d ", board[i][j]);
		printf("\n");
	}
	return 0;
}
