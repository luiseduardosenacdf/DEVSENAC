#include <stdio.h>

#define PI 3.1415

int main() {
    int opcao;
    float area;

    printf("Escolha a figura para calcular a área:\n");
    printf("1 - Círculo\n");
    printf("2 - Retângulo\n");
    printf("Digite sua opção: ");
    scanf("%d", &opcao);

    if (opcao == 1) {
        float raio;
        printf("Digite o raio do círculo: ");
        scanf("%f", &raio);
        area = PI * raio * raio;
        printf("A área do círculo é: %.2f\n", area);
    } else if (opcao == 2) {
        float base, altura;
        printf("Digite a base do retângulo: ");
        scanf("%f", &base);
        printf("Digite a altura do retângulo: ");
        scanf("%f", &altura);
        area = base * altura;
        printf("A área do retângulo é: %.2f\n", area);
    } else {
        printf("Opção inválida!\n");
    }

    return 0;
}
