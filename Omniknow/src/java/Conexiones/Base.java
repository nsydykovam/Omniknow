package Conexiones;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Base {
    String url = "jdbc:mysql://localhost/Omniknow?autoReconnect=true&useSSL=false";
    String usr = "root";
    String pass = "n0m3l0";
    Connection conexion = null;
    
    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Error por clase inexistente");
        }
        
        try {
            this.conexion = DriverManager.getConnection(url,usr,pass);
        } catch (SQLException e) {
            System.out.print("Error en la conexión: "+e.getMessage());
	    int x = 0;
        }
        
        return this.conexion;
    }
    
    public void cerrar() throws SQLException {
        this.conexion.close();
    }
}
