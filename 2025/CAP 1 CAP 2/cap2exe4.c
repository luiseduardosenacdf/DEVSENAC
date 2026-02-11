#include <stdio.h>

int main() {
    int a = 1;
    int b = 3;
    int aux;

    printf("Antes da troca: a = %d, b = %d\n", a, b);

    aux = a;  // guarda o valor de a
    a = b;    // a recebe o valor de b
    b = aux;  // b recebe o valor guardado em aux (que era a)

    printf("Depois da troca: a = %d, b = %d\n", a, b);

    return 0;
}
