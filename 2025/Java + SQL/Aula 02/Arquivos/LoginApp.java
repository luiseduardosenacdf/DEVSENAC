package br.com.loginapp;

import java.util.Scanner;

public class LoginApp {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		System.out.println("Usuário: ");
		String nomeUsuario = sc.nextLine();
		
		System.out.println("Senha: ");
		String senhaUsuario = sc.nextLine();
		
		Usuario usuario = new Usuario(nomeUsuario, senhaUsuario);
		
		if(usuarioDAO.autenticar(usuario)) {
			System.out.println("Login realizado com sucesso!");
		} else {
			System.out.println("Usúario ou senha inválidos");
		}
		
		sc.close();		
	}

}
