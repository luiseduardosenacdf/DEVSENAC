import java.io.IOException;
import java.util.Scanner;

public class Principal {
    public static void main(String[] args) {
        Scanner leitura = new Scanner(System.in);
        ConsultaCep consultaCep = new ConsultaCep();

        System.out.println("Digite um número de CEP para consultar");
        var cep = leitura.nextLine();

        consultaCep = new ConsultaCep();

        try {
            Endereco novoEndereco = consultaCep.buscaEndereco(cep);
            System.out.println(novoEndereco);
            GeradorDeArquivo gerador = new GeradorDeArquivo();
            gerador.salvaJson(novoEndereco);

            /*Endereco novoEndereco = consultaCep.buscaEndereco("04050-060");
            System.out.println(novoEndereco);

            Endereco novoEndereco1 = consultaCep.buscaEndereco("71978100");
            System.out.println(novoEndereco1);*/

        } catch (RuntimeException | IOException e) {
            System.out.println(e.getMessage());
            System.out.println("Finalizando a aplicação");
        }
    }
}
