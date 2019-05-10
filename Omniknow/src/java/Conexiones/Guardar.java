package Conexiones;

import java.sql.*;
import javax.servlet.http.HttpSession;

public class Guardar {

    public static String registrarUsuario(String nom, String ape1, String ape2, int gra, String esc, String cor, String usu, String con, String clave) throws SQLException {
        String regresar = "";
        //CONEXIÓN A LA BASE - inicio
        Base conexion = new Base();

        Connection c = null;
        Statement s = null;
        ResultSet r = null;
        ResultSet rs = null;
        ResultSet rset = null;
        CallableStatement cs = null;

        c = conexion.getConnection();
        s = c.createStatement();

        //CONEXIÓN A LA BASE - fin
        try {
            s.executeUpdate("USE OMNIKNOW;");
            rset = s.executeQuery("SELECT * FROM DATOS_PERSONALES WHERE NOMBRE ='" + nom + "' AND APELLIDO_PATERNO = '" + ape1 + "' AND APELLIDO_MATERNO = '" + ape2 + "';");
            if (rset.next()) {//Si existe alguien con el mismo nombre y apellidos...  
                regresar = "<script>alert('Ya existe alguien con ese nombre o tu solicitud de clave no ha sido contestada.');window.open('index.jsp','_self')</script>";
            } else { //Si no existe alguien con ese nombre y apellidos...
                //Ver si ya existe ese usuario
                try {
                    s.executeUpdate("USE OMNIKNOW;");
                    rs = s.executeQuery("SELECT * FROM ACCESOS WHERE USUARIO ='" + usu + "';");
                    if (!rs.next()) {//Si no existe ese usuario... 
                        //Ver si existe claveParticipante en la base de datos
                        try {
                            s.executeUpdate("USE OMNIKNOW;");
                            r = s.executeQuery("SELECT * FROM ENTRENADORES WHERE CLAVE_MAESTRA ='" + clave + "';");
                            if (r.next()) { //Si existe claveParticipante en la base de datos...

                                cs = c.prepareCall("CALL REGISTRAR(?,?,?,?,?,?,?,?);");
                                cs.setString(1, nom);
                                cs.setString(2, ape1);
                                cs.setString(3, ape2);
                                cs.setInt(4, gra);
                                cs.setString(5, esc);
                                cs.setString(6, cor);
                                cs.setString(7, usu);
                                cs.setString(8, con);
                                cs.execute();
                                

                                regresar = "<script>alert('Registro exitoso.');window.open('index.jsp','_self')</script>";
                            } else {//La clave que introdujo no existe...
                                regresar = "<script>alert('La clave es incorrecta');history.back()</script>";
                            }
                        } catch (SQLException error) {
                            System.out.print("ERROR DOS:\n" + error.toString());
                        }
                    } else {//El usuario ya existe...
                        regresar = "<script>alert('Ese usuario ya existe');history.back()</script>";
                    }
                } catch (SQLException error) {
                    System.out.print("ERROR TRES:\n" + error.toString());
                }
            }
        } catch (SQLException error) {
            System.out.print("ERROR CUATRO:\n" + error.toString());
        }
        return regresar;
    }

    public static String iniciarSesion(String usuarioInicio, String contrasenaInicio, HttpSession sesion) throws SQLException {
        String regresar = "";

        //CONEXIÓN A LA BASE - inicio
        Base conexion = new Base();

        Connection c = null;
        Statement s = null;
        Statement st = null;
        ResultSet r = null;
        ResultSet rs = null;

        c = conexion.getConnection();
	s = c.createStatement();
        s.executeUpdate("USE OMNIKNOW;");
        r = s.executeQuery("SELECT * FROM INFOS_PARTICIPANTES WHERE USUARIO = '" + usuarioInicio + "' AND CONTRASEÑA = '" + contrasenaInicio + "';");
        if (r.next()) {
            int idPart = Integer.parseInt(r.getString("ID_PARTICIPANTE"));
            String nomPart = r.getString("NOMBRE");
            String apepPart = r.getString("APELLIDO_PATERNO");
            String apemPart = r.getString("APELLIDO_MATERNO");
            int gradoPart = Integer.parseInt(r.getString("GRADO"));
            String escPart = r.getString("NOMBRE_ESCUELA");
            String corPart = r.getString("CORREO");
            String usuPart = r.getString("USUARIO");
            String conPart = r.getString("CONTRASEÑA");
            sesion.setAttribute("id", (idPart+""));
            sesion.setAttribute("nombre", nomPart);
            sesion.setAttribute("apellidoP", apepPart);
            sesion.setAttribute("apellidoM", apemPart);
            sesion.setAttribute("grado", (gradoPart+""));
            sesion.setAttribute("escuela", escPart);
            sesion.setAttribute("correo", corPart);
            sesion.setAttribute("usuario", usuPart);
            sesion.setAttribute("contra", conPart);
            regresar = "<script>window.open('index.jsp','_self')</script>";
        } //Para ver si es el entrenador
        else {
            try {
                st = c.createStatement();
                st.executeUpdate("USE OMNIKNOW;");
                rs = st.executeQuery("SELECT * FROM ACCESOS WHERE USUARIO ='" + usuarioInicio + "' AND CONTRASEÑA ='" + contrasenaInicio + "';");
                if (rs.next()) {
                    
                    sesion.setAttribute("grado", "7");
                    
                    //aún no sé si uso eso ^ NUUURIAA!!!!!
                    regresar = "<script>window.open('index.jsp','_self')</script>";
                    
                } else {
                    regresar
                            = "<script>"
                            + "alert('Usuario o contraseña incorrectos');"
                            + "window.open('index.jsp','_self')"
                            + "</script>";
                }
            } catch (SQLException error) {
                System.out.print("ERROR DOS:\n" + error.toString());
            }
        }
        return regresar;
    }

}
