package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Accesos {
    public int idAcceso;
    public String Usuario;
    public String Contrasena;

    public Accesos(String Usuario, String Contrasena) {
        this.Usuario = Usuario;
        this.Contrasena = Contrasena;
    }

    
    
    public Accesos(int idAcceso, String Usuario, String Contrasena) {
        this.idAcceso = idAcceso;
        this.Usuario = Usuario;
        this.Contrasena = Contrasena;
    }

    public Accesos() {
    }

    public int getIdAcceso() {
        return idAcceso;
    }

    public void setIdAcceso(int idAcceso) {
        this.idAcceso = idAcceso;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getContrasena() {
        return Contrasena;
    }

    public void setContrasena(String Contrasena) {
        this.Contrasena = Contrasena;
    }
    
    
}
