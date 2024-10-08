package src.model;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import src.persistencia.DatabaseConnection;

public class funcoesPartido {

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

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    public void removerMembro(String cpf) throws SQLException {
        String sql = "DELETE FROM membro WHERE cpf = (?)"; // CPF pois cada pessoa tem um CPF único

        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setString(1, cpf);

                int numeRegistros = stmt.executeUpdate();
                System.out.printf("%d registro(s) foi/foram removidos(s)\n", numeRegistros);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
            // TO DO: removerMembro, AlterarInformações de membro, verba do partido, candidatos, assesores.
            // Tudo essas paradas doidas q vou ter que me matar fazendo tem q ter UI socorro
    }
