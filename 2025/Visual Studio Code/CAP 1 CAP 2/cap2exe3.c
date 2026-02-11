#include <stdio.h>
#include <math.h>  // Para usar a função sqrt()

int main() {
    float a, b, c;
    float delta, raiz1, raiz2;

    printf("Digite o coeficiente a: ");
    scanf("%f", &a);

    printf("Digite o coeficiente b: ");
    scanf("%f", &b);

    printf("Digite o coeficiente c: ");
    scanf("%f", &c);

    delta = b*b - 4*a*c;

    if (delta < 0) {
        printf("A equação não possui raízes reais.\n");
        return 1;
    }

    raiz1 = (-b + sqrt(delta)) / (2 * a);
    raiz2 = (-b - sqrt(delta)) / (2 * a);

    printf("As raízes da equação são: %.2f e %.2f\n", raiz1, raiz2);

    return 0;
}
