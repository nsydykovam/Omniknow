<%--ESTA PÁGINA DURA UN SEGUNDO--%>

<%@page import="Conexiones.Base"%>
<%@page import="Sesion.Usuario"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiando datos</title>
        <%
            HttpSession sesion=request.getSession();
            HttpServletResponse resp=(HttpServletResponse)response;
            if(sesion.isNew()){
                resp.sendRedirect("index.jsp");
            }
         %>
    </head>
    <body>
        <%
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
            
            Boolean siii = false;
            String nameV = "";
            String lastPV = "";
            String lastMV = "";
            String usV="";
            
            //Ver si ya existe alguien con ese nombre
            try{
                s.executeUpdate("USE OMNIKNOW;");
                rset = s.executeQuery("SELECT * FROM INFOS_PARTICIPANTES WHERE NOMBRE ='"+request.getParameter("nombreParticipante")+"' AND APELLIDO_PATERNO = '"+request.getParameter("apellidoPParticipante")+"' AND APELLIDO_MATERNO = '"+request.getParameter("apellidoMParticipante")+"';");
                Boolean a = rset.next();
                
                if(a==true) {//Si existe alguien con ese nombre nuevo por poner, conseguir su nombre
                    nameV = rset.getString("NOMBRE");
                    lastPV = rset.getString("APELLIDO_PATERNO");
                    lastMV = rset.getString("APELLIDO_MATERNO");
                }
                
                //Si no existe alguien con ese nombre o si existe es el nombre del usuario actual
                if(a == false  || (nameV.equals(sesion.getAttribute("nombre").toString()) && lastPV.equals(sesion.getAttribute("apellidoP").toString())&& lastMV.equals(sesion.getAttribute("apellidoM").toString()))) { 
                    try {
                        s.executeUpdate("USE OMNIKNOW;");
                        //Ver si el usuario nuevo a poner ya existe
                        rs = s.executeQuery("SELECT * FROM INFOS_PARTICIPANTES WHERE USUARIO ='"+request.getParameter("usuarioParticipante")+"';");
                        Boolean b = rs.next();
                        //Si el usuario ya existe, conseguirlo, no sé porqué lo saca de la base en vez del request, pero bueno
                        if(b==true) {
                            usV = rs.getString("USUARIO");
                        }
                        
                        //Si no existe alguien con ese usuario o si existe es el del usuario actual
                        if(b == false || usV.equals( sesion.getAttribute("usuario").toString())) {
                            siii = true;
                        }
                        else {//El usuario ya existe y no es el del usuario actual
                            out.println("<script>alert('Ese usuario ya existe.')</script>");
                            out.println("<script>history.back()</script>");
                        }
                    }
                    catch(SQLException error) {
                            out.print("ERROR DOS:\n"+error.toString());
                    }
                }
                else { //El nombre ya existe y no es el del usuario actual
                    out.println("<script>alert('Ya existe alguien con ese nombre.')</script>");
                    out.println("<script>history.back()</script>");
                }
                //Si no intenta poner información repetida de otro usuario
                if (siii == true) 
                {
                    try {
                    String nom = request.getParameter("nombreParticipante");
                    String ape1 = request.getParameter("apellidoPParticipante");
                    String ape2 = request.getParameter("apellidoMParticipante");
                    int gra = Integer.parseInt(request.getParameter("gradoParticipante"));
                    String esc = request.getParameter("escuelaParticipante");
                    String cor = request.getParameter("correoParticipante");
                    String usu = request.getParameter("usuarioParticipante");
                    String con = request.getParameter("contrasenaParticipante");
//                    s.executeUpdate("UPDATE INFOS_PARTICIPANTES SET NOMBRE='"+nom+"', APELLIDO_PATERNO='"+ape1+"', APELLIDO_MATERNO='"+ape2+"',GRADO="+gra+", NOMBRE_ESCUELA='"+esc+"',CORREO='"+cor+"',USUARIO='"+usu+"',CONTRASEÑA='"+con+"' where ID_PARTICIPANTE='"+Usuario.getParticipante_id()+"';");

                    s.executeUpdate("USE OMNIKNOW;");
                    cs = c.prepareCall("CALL CAMBIAR_PARTICIPANTE(?,?,?,?,?,?,?,?,?);");
                    cs.setString(1,nom);
                    cs.setString(2,ape1);
                    cs.setString(3,ape2);
                    cs.setInt(4,gra);
                    cs.setString(5,esc);
                    cs.setString(6,cor);
                    cs.setString(7,usu);
                    cs.setString(8,con);
//                    cs.setInt(9,Usuario.getParticipante_id());
                    cs.setInt(9,Integer.parseInt(sesion.getAttribute("id").toString()));
                    cs.execute();
                
                    out.println("<script>alert('Datos cambiados.')</script>");
//                    int idPart = Integer.parseInt(r.getString("ID_PARTICIPANTE"));
                    sesion.setAttribute("nombre", nom);
                    sesion.setAttribute("apellidoP", ape1);
                    sesion.setAttribute("apellidoM", ape2);
                    sesion.setAttribute("grado", (gra+""));
                    sesion.setAttribute("escuela", esc);
                    sesion.setAttribute("correo", cor);
                    sesion.setAttribute("usuario", usu);
                    sesion.setAttribute("contra", con);
                    out.println("<script>window.open('miSesion.jsp','_self')</script>");
                    }
                    catch(Exception e) {
                        out.print("<script>alert('error')</script>");
                    }
                }
            }
            catch(SQLException error) {
                    out.print("ERROR TRES:\n"+error.toString());
            }
        %>
    </body>
</html>
