package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class RespuestasFaqs {
    public int idRespuesta;
    public int idFaq;
    public String Respuesta;
    public int idEntrenador;

    public RespuestasFaqs() {
    }

    public RespuestasFaqs(int idRespuesta, int idFaq, String Respuesta, int idEntrenador) {
        this.idRespuesta = idRespuesta;
        this.idFaq = idFaq;
        this.Respuesta = Respuesta;
        this.idEntrenador = idEntrenador;
    }

    public int getIdRespuesta() {
        return idRespuesta;
    }

    public void setIdRespuesta(int idRespuesta) {
        this.idRespuesta = idRespuesta;
    }

    public int getIdFaq() {
        return idFaq;
    }

    public void setIdFaq(int idFaq) {
        this.idFaq = idFaq;
    }

    public String getRespuesta() {
        return Respuesta;
    }

    public void setRespuesta(String Respuesta) {
        this.Respuesta = Respuesta;
    }

    public int getIdEntrenador() {
        return idEntrenador;
    }

    public void setIdEntrenador(int idEntrenador) {
        this.idEntrenador = idEntrenador;
    }
    
    
}
