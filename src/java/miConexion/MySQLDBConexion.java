package miConexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MySQLDBConexion {
    
    public static Connection getConnection() throws SQLException{
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MySQLDBConexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/surcosalud","root","");
        return conn;
    }
    
}
