package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Participantes {
    public int idParticipante;
    public DatosPersonales DP;
    public Accesos A;
    public Escuelas E;

    public Participantes() {
    }

    public Participantes(int idParticipante, DatosPersonales DP, Accesos A, Escuelas E) {
        this.idParticipante = idParticipante;
        this.DP = DP;
        this.A = A;
        this.E = E;
    }

    public int getIdParticipante() {
        return idParticipante;
    }

    public void setIdParticipante(int idParticipante) {
        this.idParticipante = idParticipante;
    }

    public DatosPersonales getDP() {
        return DP;
    }

    public void setDP(DatosPersonales DP) {
        this.DP = DP;
    }

    public Accesos getA() {
        return A;
    }

    public void setA(Accesos A) {
        this.A = A;
    }

    public Escuelas getE() {
        return E;
    }

    public void setE(Escuelas E) {
        this.E = E;
    }
    
    
}
