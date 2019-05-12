package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Respuestas {
    public int idRespuesta;
    public int idParticipante;
    public int idTarea;
    public int idCatalogoRespuesta;

    public Respuestas() {
    }

    public Respuestas(int idRespuesta, int idParticipante, int idTarea, int idCatalogoRespuesta) {
        this.idRespuesta = idRespuesta;
        this.idParticipante = idParticipante;
        this.idTarea = idTarea;
        this.idCatalogoRespuesta = idCatalogoRespuesta;
    }

    public int getIdRespuesta() {
        return idRespuesta;
    }

    public void setIdRespuesta(int idRespuesta) {
        this.idRespuesta = idRespuesta;
    }

    public int getIdParticipante() {
        return idParticipante;
    }

    public void setIdParticipante(int idParticipante) {
        this.idParticipante = idParticipante;
    }

    public int getIdTarea() {
        return idTarea;
    }

    public void setIdTarea(int idTarea) {
        this.idTarea = idTarea;
    }

    public int getIdCatalogoRespuesta() {
        return idCatalogoRespuesta;
    }

    public void setIdCatalogoRespuesta(int idCatalogoRespuesta) {
        this.idCatalogoRespuesta = idCatalogoRespuesta;
    }
    
    
}
