#include <stdio.h>

int main() {
    int numero;

    printf("Digite um número inteiro de 1 a 4: ");
    scanf("%d", &numero);

    switch (numero) {
        case 1:
            printf("Você escolheu o número UM!\n");
            break;
        case 2:
            printf("Você escolheu o número DOIS!\n");
            break;
        case 3:
            printf("Você escolheu o número TRÊS!\n");
            break;
        case 4:
            printf("Você escolheu o número QUATRO!\n");
            break;
        default:
            printf("Número inválido! Por favor, digite um número de 1 a 4.\n");
    }

    return 0;
}
