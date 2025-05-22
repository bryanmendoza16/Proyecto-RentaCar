
package modelo;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
        
    private static Connection con;
    
    public static Connection getConnection() {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/alquilervehiculosdb","root","");
        
        }catch (Exception e){
        }
       return con;
    }
    
}
