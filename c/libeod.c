#include <stdio.h>
#include "libcheckeod.h"

void main() {
    int n;
    while (1) {
        printf("Input number (0:Exit) : ");
        scanf("%d", &n);
        if (n == 0) {
            printf("Program Exit~!!\n\n");
            break;
        }

        if (checkeod(n) == 1)
            printf("%d is odd number~!!\n\n", n);
        else
            printf("%d is even number~!!\n\n", n);
    }
}

// gcc -c checkeod.c
// ar r libcheckeod.a checkeod.o
// ar rs libcheckeod.a
// mv libcheckeod.a lib
// gcc -o libeod libeod.c -I ./lib -L ./lib -lcheckeod