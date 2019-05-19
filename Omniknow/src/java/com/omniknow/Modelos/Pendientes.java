package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Pendientes {
    public int idPendiente;
    public DatosPersonales datoPersonal;

    public Pendientes() {
    }

    public Pendientes(DatosPersonales datoPersonal) {
        this.datoPersonal = datoPersonal;
    }

    public Pendientes(int idPendiente, DatosPersonales datoPersonal) {
        this.idPendiente = idPendiente;
        this.datoPersonal = datoPersonal;
    }

    public int getIdPendiente() {
        return idPendiente;
    }

    public void setIdPendiente(int idPendiente) {
        this.idPendiente = idPendiente;
    }

    public DatosPersonales getDatoPersonal() {
        return datoPersonal;
    }

    public void setDatoPersonal(DatosPersonales datoPersonal) {
        this.datoPersonal = datoPersonal;
    }

    
}
