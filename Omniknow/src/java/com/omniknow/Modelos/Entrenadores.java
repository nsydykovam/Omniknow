package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Entrenadores {
    public int idEntrenador;
    public int idAcceso;
    public String ClaveMaestra;

    public Entrenadores() {
    }

    public Entrenadores(int idEntrenador, int idAcceso, String ClaveMaestra) {
        this.idEntrenador = idEntrenador;
        this.idAcceso = idAcceso;
        this.ClaveMaestra = ClaveMaestra;
    }

    public int getIdEntrenador() {
        return idEntrenador;
    }

    public void setIdEntrenador(int idEntrenador) {
        this.idEntrenador = idEntrenador;
    }

    public int getIdAcceso() {
        return idAcceso;
    }

    public void setIdAcceso(int idAcceso) {
        this.idAcceso = idAcceso;
    }

    public String getClaveMaestra() {
        return ClaveMaestra;
    }

    public void setClaveMaestra(String ClaveMaestra) {
        this.ClaveMaestra = ClaveMaestra;
    }
    
    
}
