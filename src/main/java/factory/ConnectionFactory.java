package factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    private static final String DRIVER_CLASS = "com.mysql.cj.jdbc.Driver"; // Driver JDBC do MySQL

    public static Connection getConnection() {
        try {
            Class.forName(DRIVER_CLASS); // Carregar o driver explicitamente
            return DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/gerenciamento_projetos", "root", "senha");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Erro ao carregar o driver JDBC: " + e.getMessage(), e);
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao obter a conexão com o banco de dados: " + e.getMessage(), e);
        }
    }
}
