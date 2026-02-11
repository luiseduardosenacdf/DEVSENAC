package aula01_14_07_2025;

public class main {
    public static void main(String[] args) {
        System.out.println("Números ímpares de 1 a 100:");

        for (int i = 1; i <= 100; i++) {
            if (i % 2 != 0) {
                System.out.println(i);
            }
        }
    }
}
