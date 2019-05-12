package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Pendientes {
    public int idPendiente;
    public int idDatoPersonal;

    public Pendientes() {
    }

    public Pendientes(int idPendiente, int idDatoPersonal) {
        this.idPendiente = idPendiente;
        this.idDatoPersonal = idDatoPersonal;
    }

    public int getIdPendiente() {
        return idPendiente;
    }

    public void setIdPendiente(int idPendiente) {
        this.idPendiente = idPendiente;
    }

    public int getIdDatoPersonal() {
        return idDatoPersonal;
    }

    public void setIdDatoPersonal(int idDatoPersonal) {
        this.idDatoPersonal = idDatoPersonal;
    }
    
    
}
