package aula04_17_07_2025;

public class main {

	public static void main(String[] args) {
		Cachorro dog = new Cachorro("Caramelo", 15, 78.0);
		
		System.out.println(dog.getNome());
		dog.emitirSom();
		
		Animal animal1 = new Animal("Sei lá", 50, 50.0);
		animal1.emitirSom();

	}

}
