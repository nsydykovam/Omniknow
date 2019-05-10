<%-- 
    Document   : buscar
    Created on : 27/03/2019, 07:47:44 AM
    Author     : Alumno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="Conexiones.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
String correo = request.getParameter("mail");
Connection con = null;
Statement sta = null;
ResultSet res = null;
CallableStatement cs = null;
Base db = new Base();
con = db.getConnection();
sta = con.createStatement();
String nombre= "";
try
{
    res = sta.executeQuery("select id_participante as id, concat(nombre,' ', apellido_paterno, ' ', apellido_materno) as nombre from participantes inner join datos_personales on participantes.id_dato_personal = datos_personales.id_dato_personal where correo = '" + correo +"';");
    if(res.next())
    {
        nombre = res.getString("nombre");
        %>

        <div id="divChat">
            <input type="text" id="nombre" name="nombre" readonly="readonly"  placeholder="Nombre del usuario (Se llena automaticamente)" value="<%=nombre%>"><br>
        </div>
<%
    }
    else
    {
    %>
    <script>alert('no existe el usuario');</script>
<div id="divChat">
    <input type="text" id="nombre" name="nombre" readonly="true" required="" placeholder="Nombre del usuario (Se llena automaticamente)" ><br>
</div>
<%
    }
            
}catch(Exception e)
{

}

%>

