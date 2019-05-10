<%-- 
    Document   : operador
    Created on : 20/03/2019, 07:14:59 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/breakpoints.min.js"></script>
    <script src="../assets/js/util.js"></script>
    <script src="../assets/js/main.js"></script>
    <link rel="stylesheet" href="../assets/css/main.css" />
    <script>

	function buscar()
	{
	    var mail2 = document.getElementById("mail").value;
	    $('#divChat').load("buscar.jsp?mail=" + mail2);//actualizas el div
	}
    </script>
    <body>
        <div id="wrapper">
            <%@include file="barraSuperior.jsp"%>
            <div id="main">
                <article class="post">
                    <form method="post" action="crearReporteE.jsp" id="form" name="form">
			<input type="email" id="mail" name="mail" required="" placeholder="Correo del usuario"><br>
			<input type="button" id="btnBuscar" name="btnBuscar" value="Buscar" onclick="buscar()"><br><br>
			<div id="divChat" name="divChat" >
			    <input type="text" id="nombre" name="nombre" readonly="readonly" required="" placeholder="Nombre del usuario (Se llena automaticamente)"><br>
			</div>
			<textarea id="problema" name="problema" required="" placeholder="Descripción del problema" rows="7"></textarea><br>
			<input type="submit" value="Guardar">
		    </form>
                </article>

            </div>
        </div>
        <%@include file="links.jsp" %>
    </body>
</html>
