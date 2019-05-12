package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Faqs {
    public int idFaq;
    public String Pregunta;
    public int Contestada;

    public Faqs() {
    }

    public Faqs(int idFaq, String Pregunta, int Contestada) {
        this.idFaq = idFaq;
        this.Pregunta = Pregunta;
        this.Contestada = Contestada;
    }

    public int getIdFaq() {
        return idFaq;
    }

    public void setIdFaq(int idFaq) {
        this.idFaq = idFaq;
    }

    public String getPregunta() {
        return Pregunta;
    }

    public void setPregunta(String Pregunta) {
        this.Pregunta = Pregunta;
    }

    public int getContestada() {
        return Contestada;
    }

    public void setContestada(int Contestada) {
        this.Contestada = Contestada;
    }
    
    
}
