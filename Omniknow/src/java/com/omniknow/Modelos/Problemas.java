package com.omniknow.Modelos;

import java.io.InputStream;

/**
 *
 * @author Perez Rosales
 */
public class Problemas {
    public int idProblema;
    public String NombreSolucion;
    public String ArchivoSolucion;
/*    
    public InputStream ArchivoSubida;
    public byte[] ArchivoBajada;
*/   

    public Problemas(int idProblema, String NombreSolucion, String ArchivoSolucion) {
        this.idProblema = idProblema;
        this.NombreSolucion = NombreSolucion;
        this.ArchivoSolucion = ArchivoSolucion;
    }

    public int getIdProblema() {
        return idProblema;
    }

    public void setIdProblema(int idProblema) {
        this.idProblema = idProblema;
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
