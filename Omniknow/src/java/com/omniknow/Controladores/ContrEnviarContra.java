/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omniknow.Controladores;

import Sesion.mail;
import com.omniknow.Conexion.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Perez Rosales
 */
@WebServlet(name = "ContrEnviarContra", urlPatterns = {"/ContrEnviarContra"})
public class ContrEnviarContra extends HttpServlet {

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
            out.println("<title>Servlet ContrEnviarContra</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContrEnviarContra at " + request.getContextPath() + "</h1>");
            /*Datos del correo*/
            String usuario = request.getParameter("txtUsuario");
            out.print("Usuario: "+ usuario);
            String asunto = "Recuperación de contraseña OMDF";
            String cuerpo = "Tu contraseña es:      ";
            out.println("<br>" + asunto + "<br>" + cuerpo);
            /*Envio del correo*/
            Conexion con = new Conexion();
            PreparedStatement ps = null;
            ResultSet rs = null;
            String CONSULTA_INFOS_PARTICIPANTES = "SELECT USUARIO, CONTRASEÑA, CORREO FROM INFOS_PARTICIPANTES WHERE USUARIO = ?";
            try {
                ps = con.getConexion().prepareStatement(CONSULTA_INFOS_PARTICIPANTES);
                ps.setString(1, usuario);
                rs = ps.executeQuery();
                if(rs.next()){
                    String contrasena = rs.getString("CONTRASEÑA");
                    String correo = rs.getString("CORREO");
                    cuerpo = cuerpo + contrasena;
                    mail.enviar(correo, asunto, cuerpo);
                    out.println("<br>" + cuerpo + "<br>");
                    out.println("<script>alert('Te será enviada una clave.');window.open('/Omniknow/JSP/index.jsp','_self'); </script>");
                }else{
                    out.print("<script>alert('No existe ese usuario.');window.open('/Omniknow/JSP/index.jsp','_self'); </script>");
                }
            } catch (Exception e) {
                System.out.println("Error al enviar el correo: " + e.toString());
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
