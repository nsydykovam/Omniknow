package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class DatosPersonales {
    public int idDatoPersonal;
        public String Nombre;
        public String ApellidoPaterno;
        public String ApellidoMaterno;
        public String Correo;
        public int Grado;

    public DatosPersonales() {
    }

    public DatosPersonales(String Nombre, String ApellidoPaterno, String ApellidoMaterno, String Correo, int Grado) {
        this.Nombre = Nombre;
        this.ApellidoPaterno = ApellidoPaterno;
        this.ApellidoMaterno = ApellidoMaterno;
        this.Correo = Correo;
        this.Grado = Grado;
    }
    

    public DatosPersonales(int idDatoPersonal, String Nombre, String ApellidoPaterno, String ApellidoMaterno, String Correo, int Grado) {
        this.idDatoPersonal = idDatoPersonal;
        this.Nombre = Nombre;
        this.ApellidoPaterno = ApellidoPaterno;
        this.ApellidoMaterno = ApellidoMaterno;
        this.Correo = Correo;
        this.Grado = Grado;
    }

    public int getIdDatoPersonal() {
        return idDatoPersonal;
    }

    public void setIdDatoPersonal(int idDatoPersonal) {
        this.idDatoPersonal = idDatoPersonal;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidoPaterno() {
        return ApellidoPaterno;
    }

    public void setApellidoPaterno(String ApellidoPaterno) {
        this.ApellidoPaterno = ApellidoPaterno;
    }

    public String getApellidoMaterno() {
        return ApellidoMaterno;
    }

    public void setApellidoMaterno(String ApellidoMaterno) {
        this.ApellidoMaterno = ApellidoMaterno;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public int getGrado() {
        return Grado;
    }

    public void setGrado(int Grado) {
        this.Grado = Grado;
    }
        
        
}
