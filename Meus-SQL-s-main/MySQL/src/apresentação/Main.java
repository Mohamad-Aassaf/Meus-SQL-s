package src.apresentação;
import java.sql.Date;
import java.util.Scanner;

import src.model.funcoesPartido;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        funcoesPartido partido = new funcoesPartido();

        String nome, cargo, cpf, email, telefone, endereco;
        String dataStr;

        try {

            /*
            ==============================================
            Testes de aplicação dentro do terminal
            ----------------------------------------------

            System.out.println("Fala o nome do vagabundo ai");
            nome = sc.nextLine();
            System.out.println("O cargo do corrupto?");
            cargo = sc.nextLine();
            System.out.println("Qual o CPF fazendo favor?");
            cpf = sc.nextLine();
            System.out.println("Qual o email pra nois mandar spam?");
            email = sc.nextLine();
            System.out.println("O telefone pra mandar ligação da Vivo?");
            telefone = sc.nextLine();
            System.out.println("Qual o endreço pra mandar a PF quando a casa cair?");
            endereco = sc.nextLine();
            System.out.println("Qual a data que esse loco entrou no partido? (YYYY-MM-DD)");
            dataStr = sc.nextLine();

            Date data_filiacao = Date.valueOf(dataStr); */

            /* partido.adicionarMembro(
                nome,
                cargo,
                cpf,
                email,
                telefone,
                endereco,
                data_filiacao
            );
            ----------------------------------------------
            ==============================================
            */

            partido.adicionarMembro (
                "Roda Viado",
                "Prefeito",
                "123.456.789-02",
                "RodaViado@gmail.com",
                "91234-1234",
                "Paraná",
                Date.valueOf("2024-09-20")
            );

            // TO DO: removerMembro, AlterarInformações de membro, verba do partido, candidatos, assesores.
            // Tudo essas paradas doidas q vou ter que me matar fazendo tem q ter UI socorro
            // Tem que fazer isso no Partido.java
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        sc.close();
    }
}
