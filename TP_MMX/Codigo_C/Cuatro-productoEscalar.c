#include <stdio.h>

extern long long productoEscalar(long long *escalar, long long *vector);

int main() {
    long long vector[] = {1, 2, 3};
    long long  escalar[]= {2, 2, 2};

    long long resultado = productoEscalar(escalar, vector);

    printf("Resultado del producto escalar: %dll\n", resultado);

    return 0;
}