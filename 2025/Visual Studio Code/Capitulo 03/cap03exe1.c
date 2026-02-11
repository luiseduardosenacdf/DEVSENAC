#include <stdio.h>

int main() {
    int numero;

    // Solicita o número ao usuário
    printf("Digite um número inteiro: ");
    scanf("%d", &numero);

    // Verifica se é positivo, negativo ou nulo
    if (numero > 0) {
        printf("O número digitado é positivo.\n");
    } else if (numero < 0) {
        printf("O número digitado é negativo.\n");
    } else {
        printf("O número digitado é nulo (zero).\n");
    }

    return 0;
}
