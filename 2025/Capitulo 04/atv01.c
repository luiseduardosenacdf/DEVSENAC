#include <stdio.h>

int main()
{
    int num;

    printf("Digite números inteiros (digite um número negativo para parar):\n");

    while (1)
    {
        printf("Número: ");
        scanf("%d", &num);

        if (num < 0)
        {
            printf("Número negativo detectado. Encerrando o programa.\n");
            break;
        }
    }

    return 0;
}
