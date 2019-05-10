package Sesion;

public class Usuario {
    //iniciado es para que al regresar después de cerrar sesión no se vuelva a esa sesión
    //lo verán al inicio de cada jsp que dependa del usuario
    static public int participante_id;
    static public String nombre;
    static public String apellidoP;
    static public String apellidoM;
    static public int grado;
    static public String escuela;
    static public String correo;
    static public String usuario;
    static private String contrasena;

    
    public static int getParticipante_id() {
        return participante_id;
    }

    public static void setParticipante_id(int participante_id) {
        Usuario.participante_id = participante_id;
    }

    public static String getNombre() {
        return nombre;
    }

    public static void setNombre(String nombre) {
        Usuario.nombre = nombre;
    }

    public static String getApellidoP() {
        return apellidoP;
    }

    public static void setApellidoP(String apellidoP) {
        Usuario.apellidoP = apellidoP;
    }

    public static String getApellidoM() {
        return apellidoM;
    }

    public static void setApellidoM(String apellidoM) {
        Usuario.apellidoM = apellidoM;
    }

    public static int getGrado() {
        return grado;
    }

    public static void setGrado(int grado) {
        Usuario.grado = grado;
    }

    public static String getEscuela() {
        return escuela;
    }

    public static void setEscuela(String escuela) {
        Usuario.escuela = escuela;
    }

    public static String getCorreo() {
        return correo;
    }

    public static void setCorreo(String correo) {
        Usuario.correo = correo;
    }

    public static String getUsuario() {
        return usuario;
    }

    public static void setUsuario(String usuario) {
        Usuario.usuario = usuario;
    }

    public static String getContrasena() {
        return contrasena;
    }

    public static void setContrasena(String contrasena) {
        Usuario.contrasena = contrasena;
    }

    public static void limpiarUsuario() {
        Usuario.participante_id = 0;
        Usuario.nombre = "";
        Usuario.apellidoP = "";
        Usuario.apellidoM = "";
        Usuario.grado = 0;
        Usuario.escuela = "";
        Usuario.correo = "";
        Usuario.usuario = "";
        Usuario.setContrasena("");
    }
}
