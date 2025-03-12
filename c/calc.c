#include <stdio.h>
#include "libmy.h"

void main() {
    int x, y;
    printf("Input two numbers: ");
    scanf("%d %d", &x, &y);
    printf("%d + %d = %d\n", x, y, plus(x,y));
    printf("%d - %d = %d\n", x, y, minus(x,y));
    
}


// gcc -c plus.c minus.c 
// ar r libmy.a plus.o minus.o
// ar rs libmy.a
// mv libmy.a lib
// gcc -o calc calc.c -I ./lib -L ./lib -lmy