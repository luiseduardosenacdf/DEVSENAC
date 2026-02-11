package aula08_24_07_2025;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class LeitorArquivo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			File arquivo = new File("log.txt");
			Scanner leitor = new Scanner(arquivo);
			
			while(leitor.hasNextLine()) {
				String linha = leitor.nextLine();
				System.out.println(linha);
			}
			
			leitor.close();
			} catch(FileNotFoundException err) {
			err.printStackTrace();
			System.out.println("Erro, arquivo não encontrado!");
		}
	}

}
