package aula03exercicio_16_07_2025;

public class Livro {
	//Atributos
	private String titulo;
	private String autor;
	private int anoPublicacao;
	
	//Método Construtor
	public Livro(String titulo, String autor, int anoPublicacao) {
		this.titulo = titulo;
		this.autor = autor;
		this.anoPublicacao = anoPublicacao;
	}
	
	//Métodos Get e Set
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getTitulo() {
		return titulo;
	}
	
	public void setAutor(String autor) {
		this.autor = autor;
	}
	
	public String getAutor() {
		return autor;
	}
	
	public void setAnoPublicacao(int anoPublicacao) {
		this.anoPublicacao = anoPublicacao;
	}
	
	public int getAnoPublica() {
		return anoPublicacao;
	}
}


