package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Puntajes {
    public int idPuntaje;
    public int idRespuesta;
    public int idCatalogoRevisada;

    public Puntajes() {
    }

    public Puntajes(int idPuntaje, int idRespuesta, int idCatalogoRevisada) {
        this.idPuntaje = idPuntaje;
        this.idRespuesta = idRespuesta;
        this.idCatalogoRevisada = idCatalogoRevisada;
    }

    public int getIdPuntaje() {
        return idPuntaje;
    }

    public void setIdPuntaje(int idPuntaje) {
        this.idPuntaje = idPuntaje;
    }

    public int getIdRespuesta() {
        return idRespuesta;
    }

    public void setIdRespuesta(int idRespuesta) {
        this.idRespuesta = idRespuesta;
    }

    public int getIdCatalogoRevisada() {
        return idCatalogoRevisada;
    }

    public void setIdCatalogoRevisada(int idCatalogoRevisada) {
        this.idCatalogoRevisada = idCatalogoRevisada;
    }
    
    
}
