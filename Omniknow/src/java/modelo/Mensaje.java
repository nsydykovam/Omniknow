/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Date;

/**
 *
 * @author jorgeantoniojuarezleyva
 */
public class Mensaje 
{
    private int     idMensaje;
    private String  contenido;
    private Date    fecha;
    private int idEmisor;
    private int idReceptor;
    private int idConversacion;

    public Mensaje(int idMensaje, String contenido, Date fecha, int idEmisor, int idReceptor, int idConversacion) {
        this.idMensaje = idMensaje;
        this.contenido = contenido;
        this.fecha = fecha;
        this.idEmisor = idEmisor;
        this.idReceptor = idReceptor;
        this.idConversacion = idConversacion;
    }

    public int getIdMensaje() {
        return idMensaje;
    }

    public void setIdMensaje(int idMensaje) {
        this.idMensaje = idMensaje;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
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

    public int getIdConversacion() {
        return idConversacion;
    }

    public void setIdConversacion(int idConversacion) {
        this.idConversacion = idConversacion;
    }

    @Override
    public String toString() {
        return "Mensaje{" + "idMensaje=" + idMensaje + ", contenido=" + contenido + ", fecha=" + fecha + ", idEmisor=" + idEmisor + ", idReceptor=" + idReceptor + ", idConversacion=" + idConversacion + '}';
    }

}