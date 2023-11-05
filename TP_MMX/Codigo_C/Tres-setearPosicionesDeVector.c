#include <stdio.h>

extern void InicializarVectorEnCero(char *vectorA, int dimension);

int main() {
    int dimension = 8;
    char vectorA[] = {1, 2, 3, 4, 5, 6, 7, 8};

    InicializarVectorEnCero(vectorA, dimension);

    printf("Resultado después de inicializar el vector en ASM: ");
    for (int i = 0; i < dimension; i++) {
        printf("%d ", vectorA[i]);
    }
    printf("\n");

    return 0;
}