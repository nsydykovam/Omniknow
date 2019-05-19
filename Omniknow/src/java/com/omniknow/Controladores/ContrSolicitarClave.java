/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omniknow.Controladores;

import com.omniknow.Conexion.Conexion;
import com.omniknow.Dao.PendientesImpl;
import com.omniknow.Modelos.DatosPersonales;
import com.omniknow.Modelos.Pendientes;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Perez Rosales
 */
@WebServlet(name = "ContrSolicitarClave", urlPatterns = {"/ContrSolicitarClave"})
public class ContrSolicitarClave extends HttpServlet {

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
            out.println("<title>Servlet ContrSolicitarClave</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContrSolicitarClave at " + request.getContextPath() + "</h1>");
            /*Obtenemos los datos ingresados por el usuario*/
            DatosPersonales dp = new DatosPersonales(request.getParameter("txtN"), request.getParameter("txtL1"), request.getParameter("txtL2"), request.getParameter("txtM"), 0);
            Pendientes pendiente = new Pendientes(dp);
            boolean lleno;
            if(dp.getNombre().length() == 0 || dp.getApellidoPaterno().length() == 0 || dp.getApellidoMaterno().length() == 0 || dp.getCorreo().length() == 0)
                lleno = false;
            else
                lleno = true;
            /*Guardar datos en PENDIENTES*/
            try {
                if(lleno){
                    PendientesImpl penImpl = new PendientesImpl();
                penImpl.Create(pendiente);
                out.println("<script>alert('Te será enviado un correo cuando los entrenadores acepten tu solicitud');window.open('/Omniknow/JSP/index.jsp','_self'); </script>");
                }else{
                    out.println("<script>alert('Llene todo el formulario para poder enviarle la clave');window.open('/Omniknow/JSP/index.jsp','_self'); </script>");
                }
            } catch (Exception e) {
                System.out.println("Error al agregar en PENDIENTES: " + e.toString());
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
