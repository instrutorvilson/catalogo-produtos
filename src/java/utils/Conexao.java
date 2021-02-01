
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    
    public static Connection getConexao() throws Exception{
        Connection con = null;
        String url = "jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String password = "123";
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException | ClassNotFoundException ex) {
            throw new Exception("Erro ao conectar ao database " + ex.getMessage());
        }
        return con;                
    }
}
