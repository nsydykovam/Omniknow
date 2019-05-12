package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Soluciones {
    public int idSolucion;
    public String NombreSolucion;
    public String ArchivoSolucion;

    public Soluciones() {
    }

    public Soluciones(int idSolucion, String NombreSolucion, String ArchivoSolucion) {
        this.idSolucion = idSolucion;
        this.NombreSolucion = NombreSolucion;
        this.ArchivoSolucion = ArchivoSolucion;
    }

    public int getIdSolucion() {
        return idSolucion;
    }

    public void setIdSolucion(int idSolucion) {
        this.idSolucion = idSolucion;
    }

    public String getNombreSolucion() {
        return NombreSolucion;
    }

    public void setNombreSolucion(String NombreSolucion) {
        this.NombreSolucion = NombreSolucion;
    }

    public String getArchivoSolucion() {
        return ArchivoSolucion;
    }

    public void setArchivoSolucion(String ArchivoSolucion) {
        this.ArchivoSolucion = ArchivoSolucion;
    }
    
    
}
