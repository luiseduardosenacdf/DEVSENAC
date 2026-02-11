package app;

import java.util.Scanner;

public class MenuApp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		
		UsuarioService usuarioService = new UsuarioService();
		
		int opcao;
		
		do {
			System.out.println("===== MENU =====");
			System.out.println("1. Cadastrar usuário");
			System.out.println("2. Listar usuários");
			System.out.println("3. Sair");
			System.out.println("Escolha uma opção: ");
			opcao = scanner.nextInt();
			
			scanner.nextLine();
			
			switch (opcao) {
			
			case 1:
					System.out.println("Digite o nome do usuário: ");
					String nome = scanner.nextLine();
					usuarioService.cadastrarUsuario(nome); // corrigido: método estava com nome errado
					break;
			case 2:
					usuarioService.listarUsuarios();
					break;
			case 3:
					System.out.println("Encerrando o programa...");
					break;
			default:
					System.out.println("Opção inválida! Tente novamente.");
			}
			
			System.out.println();
		} while (opcao != 3);
		
		scanner.close();
	}
}
