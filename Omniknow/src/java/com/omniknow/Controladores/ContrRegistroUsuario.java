/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omniknow.Controladores;

import com.omniknow.Conexion.Conexion;
import com.omniknow.Dao.ParticipantesImpl;
import com.omniknow.Modelos.Accesos;
import com.omniknow.Modelos.DatosPersonales;
import com.omniknow.Modelos.Escuelas;
import com.omniknow.Modelos.Participantes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Perez Rosales
 */
@WebServlet(name = "ContrRegistroUsuario", urlPatterns = {"/ContrRegistroUsuario"})
public class ContrRegistroUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<titleRegistro de usuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContrRegistroUsuario at " + request.getContextPath() + "</h1>");
            out.println("<h2>Hola</h2>");
            /*Extraemos los datos ingresados por el usuario*/
                /*DatosPersonales*/
            DatosPersonales datoPersonal = new DatosPersonales(request.getParameter("nombreParticipante"),
                    request.getParameter("apellidoPParticipante"), request.getParameter("apellidoMParticipante"),
                    request.getParameter("correoParticipante"), Integer.parseInt(request.getParameter("gradoParticipante")));
                /*Escuelas*/
            Escuelas escuela = new Escuelas();
                escuela.setNombreEscuela(request.getParameter("escuelaParticipante"));
                /*Accesos*/
            Accesos acceso = new Accesos(request.getParameter("usuarioParticipante"), request.getParameter("contrasenaParticipante"));
                /*Clave de acceso*/
            String clave = request.getParameter("claveParticipante");
                /*Participante*/
            Participantes participante = new Participantes(0, datoPersonal, acceso, escuela);
            /*Revisamos si existe el usuario ingresado*/
            Conexion con = new Conexion();
            PreparedStatement sentencia = null;
            ResultSet rs = null;
            String CONSULTA_DATOS_PERSONALES = "SELECT * FROM DATOS_PERSONALES WHERE NOMBRE = ? AND APELLIDO_PATERNO = ? AND APELLIDO_MATERNO = ?";
            String CONSULTA_ACCESOS = "SELECT * FROM ACCESOS WHERE USUARIO = ?";
            String CONSULTA_ENTRENADORES = "SELECT * FROM ENTRENADORES WHERE CLAVE_MAESTRA = ? ";
            try {
                sentencia = con.getConexion().prepareStatement(CONSULTA_DATOS_PERSONALES);
                sentencia.setString(1, datoPersonal.getNombre());
                sentencia.setString(2, datoPersonal.getApellidoPaterno());
                sentencia.setString(3, datoPersonal.getApellidoMaterno());
                rs = sentencia.executeQuery();
                if (rs.next()) {//Si existe un participante con el mismo nombre y apellidos
                    out.println("<script>alert('Ya existe alguien con ese nombre o tu solicitud de clave no ha sido contestada.');window.open('index.jsp','_self')</script>");
                }else{// Si no existe alguien con ese nombre y apellidos...
                    //Revisamos si existe un mismo usuario
                    //Primero cerramos rs y sentencia para volver a usuarlo
                    if (rs != null) if(sentencia != null){rs.close();sentencia.close();}
                    sentencia = con.getConexion().prepareStatement(CONSULTA_ACCESOS);
                    sentencia.setString(1, participante.getA().getUsuario());
                    rs = sentencia.executeQuery();
                    //Ahora vemos si no existe ese usuario...
                    if(!rs.next()){
                        if (rs != null) if(sentencia != null){rs.close();sentencia.close();}
                        sentencia = con.getConexion().prepareStatement(CONSULTA_ENTRENADORES);
                        sentencia.setString(1, clave);
                        rs = sentencia.executeQuery();
                        if (rs.next()) {//Si existe la clave. Registramos al PARTICIPANTE.
                            ParticipantesImpl implParticipante = new ParticipantesImpl();
                            implParticipante.Create(participante);
                        }else{//Si no existe la clave
                            out.println("<script>alert('La clave es incorrecta');history.back()</script>");
                        }
                    }else{//En caso de existir ese usuario
                        out.println("<script>alert('Ese usuario ya existe');history.back()</script>");
                    }
                }
            } catch (Exception e) {
                System.out.println("Error al registrar participante: " + e.toString());
            }finally{
                try {if(rs != null){rs.close();}if(sentencia != null)sentencia.close();if(con != null) con.cerrar();} catch (Exception e) {}
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
