import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Date;

public class PartidoUI {

    private JFrame frame;
    private JTextField nomeField;
    private JTextField cargoField;
    private JTextField cpfField;
    private JTextField emailField;
    private JTextField telefoneField;
    private JTextField enderecoField;
    private JTextField dataFiliacaoField;
    private JButton salvarButton;

    public PartidoUI() {
        frame = new JFrame("Cadastro de Membro do Partido");
        frame.setSize(400, 400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(new GridLayout(8, 2, 10, 10));

        // Campos de entrada
        frame.add(new JLabel("Nome:"));
        nomeField = new JTextField();
        frame.add(nomeField);

        frame.add(new JLabel("Cargo:"));
        cargoField = new JTextField();
        frame.add(cargoField);

        frame.add(new JLabel("CPF:"));
        cpfField = new JTextField();
        frame.add(cpfField);

        frame.add(new JLabel("Email:"));
        emailField = new JTextField();
        frame.add(emailField);

        frame.add(new JLabel("Telefone:"));
        telefoneField = new JTextField();
        frame.add(telefoneField);

        frame.add(new JLabel("Endereço:"));
        enderecoField = new JTextField();
        frame.add(enderecoField);

        frame.add(new JLabel("Data de Filiação (YYYY-MM-DD):"));
        dataFiliacaoField = new JTextField();
        frame.add(dataFiliacaoField);


        salvarButton = new JButton("Salvar");
        frame.add(salvarButton);


        salvarButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                salvarMembro();
            }
        });

        // Exibir a janela
        frame.setVisible(true);
    }


    private void salvarMembro() {
        try {
            Partido partido = new Partido();
            String nome = nomeField.getText();
            String cargo = cargoField.getText();
            String cpf = cpfField.getText();
            String email = emailField.getText();
            String telefone = telefoneField.getText();
            String endereco = enderecoField.getText();
            Date dataFiliacao = Date.valueOf(dataFiliacaoField.getText());

            partido.adicionarMembro(nome, cargo, cpf, email, telefone, endereco, dataFiliacao);

            JOptionPane.showMessageDialog(frame, "Membro adicionado com sucesso!");
            limparCampos();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(frame, "Erro ao adicionar membro: " + ex.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void limparCampos() {
        nomeField.setText("");
        cargoField.setText("");
        cpfField.setText("");
        emailField.setText("");
        telefoneField.setText("");
        enderecoField.setText("");
        dataFiliacaoField.setText("");
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new PartidoUI();
            }
        });
    }
}
