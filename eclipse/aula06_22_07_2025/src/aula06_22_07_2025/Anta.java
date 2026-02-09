package aula06_22_07_2025;

public class Anta extends Animal implements Nadador {
	
	public Anta(String nome, int idade, double peso) {
		super(nome, idade, peso);
	}

	@Override
	public void emitirSom() {
		System.out.println("cuí cuí cuí");
	}

	@Override
	public void nadar() {
		System.out.println("Anta nadando");
	}
}
