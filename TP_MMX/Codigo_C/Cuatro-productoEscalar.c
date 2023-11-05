#include <stdio.h>

extern int productoEscalar(char *vector, int n);

int main() {
    char vector[] = {1, 2, 3};
    int n = 2;

    int resultado = productoEscalar(vector, n);

    printf("Resultado del producto escalar: %d\n", resultado);

    return 0;
}