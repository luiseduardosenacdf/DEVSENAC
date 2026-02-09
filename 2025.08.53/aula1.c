#include <stdio.h>

int main() {
    
    // Variáveis
    int idade = 20;
    float valorDoPgto = 12.42f;
    double velParticula = 2.9817029837;
    char tipoHabMotor = 'A';

    // Instruções
    printf("Informe a idade: ");
    scanf("%d", &idade);

    printf("Informe o valor do pagamento: ");
    scanf("%d", &valorDoPgto);

    printf("Informe a velocidade da particula: ");
    scanf("%d", &velParticula);

    printf("Informe o tipo de habilitação: ");
    scanf("%d", &tipoHabMotor);

    // Exibindo os dados informados
    printf("Id: %d, Pgto: %.2f, Vel: %.10lf, Hab: %c\n", idade, valorDoPgto, velParticula, tipoHabMotor);


    return 0;
}
