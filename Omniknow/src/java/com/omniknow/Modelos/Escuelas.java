package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Escuelas {
    public int idEscuela;
    public String NombreEscuela;

    public Escuelas() {
    }

    public Escuelas(int idEscuela, String NombreEscuela) {
        this.idEscuela = idEscuela;
        this.NombreEscuela = NombreEscuela;
    }

    public int getIdEscuela() {
        return idEscuela;
    }

    public void setIdEscuela(int idEscuela) {
        this.idEscuela = idEscuela;
    }

    public String getNombreEscuela() {
        return NombreEscuela;
    }

    public void setNombreEscuela(String NombreEscuela) {
        this.NombreEscuela = NombreEscuela;
    }
    
    
}
