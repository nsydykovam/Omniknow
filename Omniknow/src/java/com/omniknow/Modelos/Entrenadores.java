package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Entrenadores {
    public int idEntrenador;
    public Accesos acceso;
    public String ClaveMaestra;

    public Entrenadores() {
    }

    public Entrenadores(Accesos acceso, String ClaveMaestra) {
        this.acceso = acceso;
        this.ClaveMaestra = ClaveMaestra;
    }

    public Entrenadores(int idEntrenador, Accesos acceso, String ClaveMaestra) {
        this.idEntrenador = idEntrenador;
        this.acceso = acceso;
        this.ClaveMaestra = ClaveMaestra;
    }

    public int getIdEntrenador() {
        return idEntrenador;
    }

    public void setIdEntrenador(int idEntrenador) {
        this.idEntrenador = idEntrenador;
    }

    public Accesos getAcceso() {
        return acceso;
    }

    public void setAcceso(Accesos acceso) {
        this.acceso = acceso;
    }

    public String getClaveMaestra() {
        return ClaveMaestra;
    }

    public void setClaveMaestra(String ClaveMaestra) {
        this.ClaveMaestra = ClaveMaestra;
    }
    
    
    
    
}
