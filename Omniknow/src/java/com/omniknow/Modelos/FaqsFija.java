package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class FaqsFija {
    public int idFaqF;
    public int idFaq;
    public String Respuestas;

    public FaqsFija() {
    }

    public FaqsFija(int idFaqF, int idFaq, String Respuestas) {
        this.idFaqF = idFaqF;
        this.idFaq = idFaq;
        this.Respuestas = Respuestas;
    }

    public int getIdFaqF() {
        return idFaqF;
    }

    public void setIdFaqF(int idFaqF) {
        this.idFaqF = idFaqF;
    }

    public int getIdFaq() {
        return idFaq;
    }

    public void setIdFaq(int idFaq) {
        this.idFaq = idFaq;
    }

    public String getRespuestas() {
        return Respuestas;
    }

    public void setRespuestas(String Respuestas) {
        this.Respuestas = Respuestas;
    }
    
    
}
