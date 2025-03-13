#include <stdio.h>
#include "libcheckprime.h"

void main() {
    int n;
    while (1) {
        printf("\nInput integer (0:Exit) => ");
        scanf("%d", &n);
        if (n == 0) {
            printf("Program Exit~!!\n");
            break;
        }

        if (checkprime(n) == n) {
            printf("%d is prime number~!!\n", n);
        } else {
            printf("%d is not prime number~!!\n", n);
        }
    }
}