#include <stdio.h>

int main() {
    float valorCompra, valorFinal;
    int tipoProduto;

    printf("Digite o valor da compra: R$ ");
    scanf("%f", &valorCompra);

    printf("Digite o tipo do produto (0 para tipo com 10%% de taxa, outro valor para 20%%): ");
    scanf("%d", &tipoProduto);

    if (tipoProduto == 0) {
        valorFinal = valorCompra + (valorCompra * 0.10);
    } else {
        valorFinal = valorCompra + (valorCompra * 0.20);
    }

    printf("O valor total a ser pago é: R$ %.2f\n", valorFinal);

    return 0;
}
