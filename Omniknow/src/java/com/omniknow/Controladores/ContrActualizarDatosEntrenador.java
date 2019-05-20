/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omniknow.Controladores;

import com.omniknow.Conexion.Conexion;
import com.omniknow.Dao.EntrenadoresImpl;
import com.omniknow.Modelos.Accesos;
import com.omniknow.Modelos.Entrenadores;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Perez Rosales
 */
@WebServlet(name = "ContrActualizarDatosEntrenador", urlPatterns = {"/ContrActualizarDatosEntrenador"})
public class ContrActualizarDatosEntrenador extends HttpServlet {

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
            out.println("<title>Servlet ContrActualizarDatosEntrenador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContrActualizarDatosEntrenador at " + request.getContextPath() + "</h1>");
            /*Extraemos los datos*/
            Entrenadores entrenador = new Entrenadores(new Accesos(request.getParameter("txtUsuario"), request.getParameter("txtPassNew1")),
            request.getParameter("txtClaveMaestra"));
            try {
                EntrenadoresImpl entImpl = new EntrenadoresImpl();
                if(entImpl.Update(entrenador)){
                  out.println("<script>alert('Datos Cambiados'); window.open('/Omniknow/JSP/opcionesSesion.jsp','_self');</script>");  
                }else{
                    out.println("<script>alert('Error al cambiar los datos, verifique su conexión'); window.open('/Omniknow/JSP/opcionesSesion.jsp','_self');</script>");
                }
            } catch (Exception e) {
                System.out.println("Error al actualizar entrenador: " + e.toString());
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
