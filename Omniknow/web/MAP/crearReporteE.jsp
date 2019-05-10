<%-- 
    Document   : crearReporte
    Created on : 27/03/2019, 07:34:47 AM
    Author     : Alumno
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Conexiones.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    String correo = request.getParameter("mail");
    String nombre = request.getParameter("nombre");
    String problema = request.getParameter("problema");
    
    Base conexion = new Base();
    Connection con = null;
    Statement sta = null;
    CallableStatement cs = null;

    con = conexion.getConnection();
    sta = con.createStatement();
    
    sta.execute("INSERT INTO REPORTES VALUES (null,'"+correo+"','"+nombre+"','"+problema+"','',0,'ABIERTO');");


%>
<script>alert('guardado');window.open('operador.jsp','_Self');</script>