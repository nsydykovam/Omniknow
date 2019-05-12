package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Reportes {
    public int idReporte;
    public String Correo;
    public String Nombre;
    public String Problema;
    public String Solucion;
    public int idInge;
    public String Estado;

    public Reportes() {
    }

    public Reportes(int idReporte, String Correo, String Nombre, String Problema, String Solucion, int idInge, String Estado) {
        this.idReporte = idReporte;
        this.Correo = Correo;
        this.Nombre = Nombre;
        this.Problema = Problema;
        this.Solucion = Solucion;
        this.idInge = idInge;
        this.Estado = Estado;
    }

    public int getIdReporte() {
        return idReporte;
    }

    public void setIdReporte(int idReporte) {
        this.idReporte = idReporte;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getProblema() {
        return Problema;
    }

    public void setProblema(String Problema) {
        this.Problema = Problema;
    }

    public String getSolucion() {
        return Solucion;
    }

    public void setSolucion(String Solucion) {
        this.Solucion = Solucion;
    }

    public int getIdInge() {
        return idInge;
    }

    public void setIdInge(int idInge) {
        this.idInge = idInge;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    
    
}
