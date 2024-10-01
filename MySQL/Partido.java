import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Partido {
    public void adicionarMembro(String nome, String cargo, String cpf, String email, String telefone, String endereco, Date data_filiacao) throws SQLException {
        String sql = "INSERT INTO membro (nome, cargo, cpf, email, telefone, endereco, data_filiacao) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

                
                stmt.setString(1, nome);
                stmt.setString(2, cargo);
                stmt.setString(3, cpf);
                stmt.setString(4, email);
                stmt.setString(5, telefone);
                stmt.setString(6, endereco);
                stmt.setDate(7, data_filiacao);

                int numeRegistros = stmt.executeUpdate();
                System.out.printf("%d registro(s) foi/foram adicionado(s)\n", numeRegistros);
            }
    }
}
