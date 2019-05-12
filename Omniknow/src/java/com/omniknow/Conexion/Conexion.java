package com.omniknow.Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Perez Rosales
 */
public class Conexion {
    private final String BD = "OMNIKNOW";
    private final String usr = "root";
    private final String url = "jdbc:mysql://localhost/"+BD;
    private final String pass = "n0m3l0";
    private final String driver = "com.mysql.jdbc.Driver";
    private Connection conexion = null;

    public Conexion() {
        try{
            Class.forName(driver);
            this.conexion = DriverManager.getConnection(url, usr, pass);
        }catch(ClassNotFoundException e){
            System.out.println("Error por clase inexistente");
        } catch (SQLException ex) {
            System.out.println("Error al obtener la conexion " + ex.toString());
        }
    }

    public Connection getConexion() {
        return conexion;
    }

    public void cerrar(){
        try {
            this.conexion.close();
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexion");
        }
    }
    
}