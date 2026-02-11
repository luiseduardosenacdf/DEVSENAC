#include <stdio.h>

int main() {
    int idade, maiorIdade = 0, contador = 0, qtdMulheres = 0;
    char sexo;
    float salario, somaSalarios = 0;
    int salarioAbaixo500 = 0;

    printf("=== Pesquisa de Moradores ===\n");

    while (1) {
        printf("\nDigite a idade (0 para encerrar): ");
        scanf("%d", &idade);

        if (idade == 0)
            break;

        // Atualiza maior idade
        if (idade > maiorIdade) {
            maiorIdade = idade;
        }

        printf("Digite o sexo (m/f): ");
        scanf(" %c", &sexo);  // espaço antes do %c para limpar buffer

        if (sexo == 'f' || sexo == 'F') {
            qtdMulheres++;
        }

        printf("Digite o salário: R$ ");
        scanf("%f", &salario);

        if (salario < 500) {
            salarioAbaixo500 = 1;
        }

        somaSalarios += salario;
        contador++;
    }

    if (contador > 0) {
        float mediaSalarial = somaSalarios / contador;

        printf("\n=== Resultados da Pesquisa ===\n");
        printf("a. Maior idade: %d anos\n", maiorIdade);
        printf("b. Média salarial: R$ %.2f\n", mediaSalarial);
        printf("c. Quantidade de mulheres: %d\n", qtdMulheres);
        printf("d. Existe salário abaixo de R$ 500,00? %s\n", salarioAbaixo500 ? "Sim" : "Não");
    } else {
        printf("\nNenhum dado foi informado.\n");
    }

    return 0;
}
