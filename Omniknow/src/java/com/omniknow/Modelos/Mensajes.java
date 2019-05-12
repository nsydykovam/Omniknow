package com.omniknow.Modelos;

import java.sql.Date;

/**
 *
 * @author Perez Rosales
 */
public class Mensajes {
    public int idMensaje;
    public int idEmisor;
    public int idReceptor;
    public int idChat;
    public String Contenido;
    public Date Fecha;

    public Mensajes() {
    }

    public Mensajes(int idMensaje, int idEmisor, int idReceptor, int idChat, String Contenido, Date Fecha) {
        this.idMensaje = idMensaje;
        this.idEmisor = idEmisor;
        this.idReceptor = idReceptor;
        this.idChat = idChat;
        this.Contenido = Contenido;
        this.Fecha = Fecha;
    }

    public int getIdMensaje() {
        return idMensaje;
    }

    public void setIdMensaje(int idMensaje) {
        this.idMensaje = idMensaje;
    }

    public int getIdEmisor() {
        return idEmisor;
    }

    public void setIdEmisor(int idEmisor) {
        this.idEmisor = idEmisor;
    }

    public int getIdReceptor() {
        return idReceptor;
    }

    public void setIdReceptor(int idReceptor) {
        this.idReceptor = idReceptor;
    }

    public int getIdChat() {
        return idChat;
    }

    public void setIdChat(int idChat) {
        this.idChat = idChat;
    }

    public String getContenido() {
        return Contenido;
    }

    public void setContenido(String Contenido) {
        this.Contenido = Contenido;
    }

    public Date getFecha() {
        return Fecha;
    }

    public void setFecha(Date Fecha) {
        this.Fecha = Fecha;
    }
    
    
}
