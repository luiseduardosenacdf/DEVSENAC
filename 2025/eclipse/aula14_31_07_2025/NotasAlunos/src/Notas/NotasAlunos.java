import java.util.Scanner;

package Notas;

public class NotasAlunos {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Quantos Alunos^");
		int totalAlunos = scanner.nextInt();
		
		double[] notas = new double[totalAlunos];
		double soma = 0;
		double maior = Double.MIN_VALUE;
		double menor = Double.MAX_VALUE;
	}

}
