/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omniknow.Controladores;

import com.omniknow.Conexion.Conexion;
import com.omniknow.Dao.EntrenadoresImpl;
import com.omniknow.Modelos.Accesos;
import com.omniknow.Modelos.DatosPersonales;
import com.omniknow.Modelos.Entrenadores;
import com.omniknow.Modelos.Escuelas;
import com.omniknow.Modelos.Participantes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Perez Rosales
 */
@WebServlet(name = "ContrIniciarSesion", urlPatterns = {"/ContrIniciarSesion"})
public class ContrIniciarSesion extends HttpServlet {

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
            out.println("<title>Servlet ContrIniciarSesion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContrIniciarSesion at " + request.getContextPath() + "</h1>");
            /*HttpSession*/
            HttpSession sesion = request.getSession();
            /*Extraemos los datos ingresados por el usuario*/
            Accesos acceso1 = new Accesos(request.getParameter("usuarioInicio"), request.getParameter("contrasenaInicio"));
            /*De la vista INFOS_PARTICIPANTES, extraigo la informacion para saber si en un PARTICIPANTE */
            Conexion con = new Conexion();
            PreparedStatement sentencia = null;
            ResultSet rs = null;
            /*STRING'S CONSULTAS*/
            String CONSULTA_INFOS_PARTICIPANTES = "SELECT * FROM INFOS_PARTICIPANTES WHERE USUARIO = ? AND CONTRASEÑA = ?";
            String CONSULTA_ACCESOS = "SELECT * FROM ACCESOS WHERE USUARIO = ? AND CONTRASEÑA = ?";
            try {
                sentencia = con.getConexion().prepareStatement(CONSULTA_INFOS_PARTICIPANTES);
                sentencia.setString(1, acceso1.getUsuario());
                sentencia.setString(2, acceso1.getContrasena());
                rs = sentencia.executeQuery();
                if(rs.next()){//Si encuentra al usuario y su  contraseña
                    Escuelas escuela = new Escuelas(rs.getInt("ID_ESCUELA"), rs.getString("NOMBRE_ESCUELA"));
                    Accesos acceso2 = new Accesos(rs.getInt("ID_ACCESO"), rs.getString("USUARIO"), rs.getString("CONTRASEÑA"));
                    DatosPersonales datoPersonal = new DatosPersonales(rs.getInt("ID_DATO_PERSONAL"), rs.getString("NOMBRE"), rs.getString("APELLIDO_PATERNO"), rs.getString("APELLIDO_MATERNO"), rs.getString("CORREO"), rs.getInt("GRADO"));
                    Participantes participante = new Participantes(rs.getInt("ID_PARTICIPANTE"), datoPersonal, acceso2, escuela);
                    /*Agregar los datos del PARTICIPANTE al HttpSession*/
                    sesion.setAttribute("id", participante.getIdParticipante()+"");
                    sesion.setAttribute("nombre", participante.getDP().getNombre());
                    sesion.setAttribute("apellidoP", participante.getDP().getApellidoPaterno());
                    sesion.setAttribute("apellidoM", participante.getDP().getApellidoMaterno());
                    sesion.setAttribute("grado", participante.getDP().getGrado()+"");
                    sesion.setAttribute("escuela", participante.getE().getNombreEscuela());
                    sesion.setAttribute("correo", participante.getDP().getCorreo());
                    sesion.setAttribute("usuario", participante.getA().getUsuario());
                    sesion.setAttribute("contra", participante.getA().getContrasena());
                    /*Podemos agregar los datos como un objeto asi que...*/
                    sesion.setAttribute("Participante", participante);
                    //Al finalizar volvemos al index
                    out.println("<script>window.open('/Omniknow/JSP/index.jsp','_self')</script>");
                }else{//Si no lo encuentra, buscar en ACCESOS para ver si es un ENTRENADOR
                    //Primero hay que cerrar ResultSet y PrepareStatement. Para volverlo a usar
                    if(rs != null){rs.close();if(sentencia != null){sentencia.close();}}
                    //Listo...
                    sentencia = con.getConexion().prepareStatement(CONSULTA_ACCESOS);
                    sentencia.setString(1, acceso1.getUsuario());
                    sentencia.setString(2, acceso1.getContrasena());
                    rs = sentencia.executeQuery();
                    if(rs.next()){
                        Accesos acceso3 = new Accesos(rs.getInt("ID_ACCESO"), rs.getString("USUARIO"), rs.getString("CONTRASEÑA"));
                        sesion.setAttribute("grado", "7");
                        /*En caso de ser un entrendor podemos agregar los datos del entrenador*/
                        EntrenadoresImpl entImpl = new EntrenadoresImpl();
                        Entrenadores entre = entImpl.Read(1);
                        sesion.setAttribute("Entrenador", entre);
                        /**/
                        out.println("<script>window.open('/Omniknow/JSP/index.jsp','_self')</script>");
                    }else{
                        out.println("<script> alert('Usuario o contraseña incorrectos');window.open('index.jsp','_self')</script>");
                    }
                }
            } catch (Exception e) {
                System.out.println("Error al ingresar al sistema: " + e.toString());
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
