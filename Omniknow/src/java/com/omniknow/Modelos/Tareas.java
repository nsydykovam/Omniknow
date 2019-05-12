package com.omniknow.Modelos;

import java.sql.Date;

/**
 *
 * @author Perez Rosales
 */
public class Tareas {
    public int idTarea;
    public int GradoTarea;
    public int idProblema;
    public int idSolucion;
    public int idCatalogoRespuesta;
    public Date FechaFinal;
    public int Disponible;

    public Tareas() {
    }

    public Tareas(int idTarea, int GradoTarea, int idProblema, int idSolucion, int idCatalogoRespuesta, Date FechaFinal, int Disponible) {
        this.idTarea = idTarea;
        this.GradoTarea = GradoTarea;
        this.idProblema = idProblema;
        this.idSolucion = idSolucion;
        this.idCatalogoRespuesta = idCatalogoRespuesta;
        this.FechaFinal = FechaFinal;
        this.Disponible = Disponible;
    }

    public int getIdTarea() {
        return idTarea;
    }

    public void setIdTarea(int idTarea) {
        this.idTarea = idTarea;
    }

    public int getGradoTarea() {
        return GradoTarea;
    }

    public void setGradoTarea(int GradoTarea) {
        this.GradoTarea = GradoTarea;
    }

    public int getIdProblema() {
        return idProblema;
    }

    public void setIdProblema(int idProblema) {
        this.idProblema = idProblema;
    }

    public int getIdSolucion() {
        return idSolucion;
    }

    public void setIdSolucion(int idSolucion) {
        this.idSolucion = idSolucion;
    }

    public int getIdCatalogoRespuesta() {
        return idCatalogoRespuesta;
    }

    public void setIdCatalogoRespuesta(int idCatalogoRespuesta) {
        this.idCatalogoRespuesta = idCatalogoRespuesta;
    }

    public Date getFechaFinal() {
        return FechaFinal;
    }

    public void setFechaFinal(Date FechaFinal) {
        this.FechaFinal = FechaFinal;
    }

    public int getDisponible() {
        return Disponible;
    }

    public void setDisponible(int Disponible) {
        this.Disponible = Disponible;
    }
    
    
}
