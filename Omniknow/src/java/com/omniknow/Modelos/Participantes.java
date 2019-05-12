package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Participantes {
    public int idParticipante;
    public int idDatoPersonal;
    public int idAcceso;
    public int idEscuela;

    public Participantes() {
    }

    public Participantes(int idParticipante, int idDatoPersonal, int idAcceso, int idEscuela) {
        this.idParticipante = idParticipante;
        this.idDatoPersonal = idDatoPersonal;
        this.idAcceso = idAcceso;
        this.idEscuela = idEscuela;
    }

    public int getIdParticipant() {
        return idParticipante;
    }

    public void setIdParticipant(int idParticipante) {
        this.idParticipante = idParticipante;
    }

    public int getIdDatoPersonal() {
        return idDatoPersonal;
    }

    public void setIdDatoPersonal(int idDatoPersonal) {
        this.idDatoPersonal = idDatoPersonal;
    }

    public int getIdAcceso() {
        return idAcceso;
    }

    public void setIdAcceso(int idAcceso) {
        this.idAcceso = idAcceso;
    }

    public int getIdEscuela() {
        return idEscuela;
    }

    public void setIdEscuela(int idEscuela) {
        this.idEscuela = idEscuela;
    }
    
    
}
