#include <stdio.h>

extern void SumarVectores(char *vectorA, char *vectorB, char *vectorResult, int dimension);

int main() {
    int dimension = 8;  // Tamaño de los vectores
    char vectorA[] = {1, 2, 3, 4, 5, 8, 9, 1};
    char vectorB[] = {5, 6, 7, 8, 4, 7, 5, 2};
    char vectorResult[4];

    SumarVectores(vectorA, vectorB, vectorResult, dimension);

    printf("Resultado de la suma: ");
    for (int i = 0; i < dimension; i++) {
        printf("%d ", vectorResult[i]);
    }
    printf("\n");

    return 0;
}