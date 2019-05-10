<%--
NOTA IMPORTANTE: Primero lean la nota importante de tareasEntrenador.jsp. WOOOW PRIMERA VEZ QUE LA LEERE
Aquí, yo creo que sí es preferible que no se vean los textos del código LaTeX, hmmmmmmmmm
porque no todos lo saben usar, pero lo dejo a su elección :), hmmmm hay que ponerlo, como se ponoe??
creo que entre todos nos cargamos esta parte, la estoy viendo hasta ahora 15/04/18, aunque ya la estoy editando,
Por favor, pongan alguna nota de que es mejor que si hay algo multiplicando una
fracción, lo pongan arriba de la fracción, por ejemplo:
a*(b/c) MAL (a multiplica a la fracción b/c)
(ab)/c BIEN (c divide al producto ab)
Esto con el fin de evitar decir que algo está mal cuando está bien pero expresado
de diferente manera.
--%>
<%@page import="Conexiones.Base"%>
<%@page import="Sesion.*" %>
<%@page import="java.sql.*,java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Enviar respuestas</title>
        <!--Cosas para evitar trampas de regresos-->
	<%
	    HttpSession sesion = request.getSession();
	    HttpServletResponse resp = (HttpServletResponse) response;
	    if (sesion.isNew()) {
		resp.sendRedirect("index.jsp");
	    } else {
	%>

        <%--Cosas de MathQuill A--%>
        <link rel="stylesheet" href="../CSS/mathquill.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="../JS/mathquill.js"></script>
        <script>
	    var MQ = MathQuill.getInterface(2);
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../JS/jsTeclado.js"></script>
        <script src="../JS/enviarRespuestas.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="barraSuperior.jsp" %>
            <div id="main">
                <div id="particles-js" style=" background-color: rgba(255,255,255,0); position: fixed; width: 100%; height: 100%"></div>
                <%		    
		    Base conexion = new Base();

		    Connection c = null;
		    Statement s = null;
		    ResultSet r = null;

		    c = conexion.getConnection();
		    s = c.createStatement();

		    try {
			Tarea.id = Integer.parseInt(request.getParameter("txtid"));
		    } catch (NumberFormatException e) {
			out.print("ERROR CERO:\n" + e.toString());
		    }

		    //Sacar la información de la tarea
		    try {
			s.executeUpdate("USE OMNIKNOW;");
			r = s.executeQuery("SELECT * FROM INFOS_TAREAS WHERE ID_TAREA = " + Tarea.id);
			r.next();
			Tarea.problemas = r.getString("NOMBRE_PROBLEMA");
//                Tarea.inicio = r.getString("fechaInicio_tarea");
			Tarea.limite = r.getString("FECHA_FINAL");
		    } catch (SQLException error) {
			out.print("ERROR DOS:\n" + error.toString());
		    }
//            A ver si ya hizo esa tarea
		    try {
			s.executeUpdate("USE OMNIKNOW;");
			r = s.executeQuery("SELECT * FROM RESPUESTAS WHERE ID_PARTICIPANTE ='" + sesion.getAttribute("id") + "' AND ID_TAREA ='" + Tarea.id + "';");
			if (!r.next()) {//Imprimir la página para que el participante ponga las respuestas
		%>                
                <section>
                    <form action="enviarRespuesta.jsp" method="post">

                        <article class="post">
                            <%--RESPUESTAS DE LOS PROBLEMAS--%>
                            <%--Luego hay que quitar los LaTeX, pero mientras lo dejaré para ver cómo funciona la cosa--%>
                            Respuesta del problema 1: <span id="math-field-1" onclick="cambiarMathField(1);"></span>
                            <input type="text" id="txtLatex1" name="latex1" readonly="true" style="visibility: hidden;"/><br><br>
                            <%--Cosas de MathQuill B1--%>
                            <script>
				var mathFieldSpan1 = document.getElementById('math-field-1');
				var latexText1 = document.getElementById('txtLatex1');

				var MQ = MathQuill.getInterface(2); // for backcompat
				var mathField1 = MQ.MathField(mathFieldSpan1, {
				    spaceBehavesLikeTab: true, // configurable
				    handlers: {
					edit: function () { // useful event handlers
					    latexText1.value = mathField1.latex(); // simple API
					}
				    }
				});
                            </script>
                            Respuesta del problema 2: <span id="math-field-2" onclick="cambiarMathField(2);"></span>
                            <input type="text" id="txtLatex2" name="latex2" readonly="true" style="visibility: hidden;"/><br><br>
                            <%--Cosas de MathQuill B2--%>
                            <script>
				var mathFieldSpan2 = document.getElementById('math-field-2');
				var latexText2 = document.getElementById('txtLatex2');

				var MQ = MathQuill.getInterface(2); // for backcompat
				var mathField2 = MQ.MathField(mathFieldSpan2, {
				    spaceBehavesLikeTab: true, // configurable
				    handlers: {
					edit: function () { // useful event handlers
					    latexText2.value = mathField2.latex(); // simple API
					}
				    }
				});
                            </script>
			    <!--                            <section>
							    <article class="post">
			    <%@include file="teclado.jsp" %>
			</article>
		    </section>-->
                            Respuesta del problema 3: <span id="math-field-3" onclick="cambiarMathField(3);"></span>
                            <input type="text" id="txtLatex3" name="latex3" readonly="true" style="visibility: hidden;"/><br><br>
                            <%--Cosas de MathQuill B3--%>
                            <script>
				var mathFieldSpan3 = document.getElementById('math-field-3');
				var latexText3 = document.getElementById('txtLatex3');

				var MQ = MathQuill.getInterface(2); // for backcompat
				var mathField3 = MQ.MathField(mathFieldSpan3, {
				    spaceBehavesLikeTab: true, // configurable
				    handlers: {
					edit: function () { // useful event handlers
					    latexText3.value = mathField3.latex(); // simple API
					}
				    }
				});
                            </script>
			    <!--                            <section>
							    <article class="post">
			    <%@include file="teclado.jsp" %>
			</article>
		    </section>-->
                            Respuesta del problema 4: <span id="math-field-4" onclick="cambiarMathField(4);"></span>
                            <input type="text" id="txtLatex4" name="latex4" readonly="true" style="visibility: hidden;"/><br><br>
                            <%--Cosas de MathQuill B4--%>
                            <script>
				var mathFieldSpan4 = document.getElementById('math-field-4');
				var latexText4 = document.getElementById('txtLatex4');

				var MQ = MathQuill.getInterface(2); // for backcompat
				var mathField4 = MQ.MathField(mathFieldSpan4, {
				    spaceBehavesLikeTab: true, // configurable
				    handlers: {
					edit: function () { // useful event handlers
					    latexText4.value = mathField4.latex(); // simple API
					}
				    }
				});
                            </script>
			    <!--                            <section>
							    <article class="post">
			    <%@include file="teclado.jsp" %>
			</article>
		    </section>-->
                            Respuesta del problema 5: <span id="math-field-5" onclick="cambiarMathField(5);"></span>
                            <input type="text" id="txtLatex5" name="latex5" style="visibility: hidden;"/><br><br>
                            <%--Cosas de MathQuill B5--%>
                            <script>
				var mathFieldSpan5 = document.getElementById('math-field-5');
				var latexText5 = document.getElementById('txtLatex5');

				var MQ = MathQuill.getInterface(2); // for backcompat
				var mathField5 = MQ.MathField(mathFieldSpan5, {
				    spaceBehavesLikeTab: true, // configurable
				    handlers: {
					edit: function () { // useful event handlers
					    latexText5.value = mathField5.latex(); // simple API
					}
				    }
				});
                            </script>
                            <input type="submit" value="Enviar" onClick="vaciosRespuestas(), reemplazar()">
                            <%@include file="teclado.jsp" %>
                        </article>
                    </form>

                </section>
		<%
			} else {
			    out.println("<script>alert('Ya hiciste esta tarea.')</script>");
			    out.println("<script>window.open('seleccionarTarea.jsp','_self')</script>");
			}
		    } catch (SQLException error) {
			out.print("ERROR TRES:\n" + error.toString());
		    }
		%>
                <div class="row">
                    <div class="col-6 col-12-small"><br></div>
                    <div class="col-6 col-12-small"><br></div>
                    <div class="col-6 col-12-small"><br></div>
                    <div class="col-6 col-12-small"><br></div>
                    <div class="col-6 col-12-small"><br></div>
                    <div class="col-6 col-12-small"><br></div>
                    <div class="col-6 col-12-small"><br></div>
                    <div class="col-6 col-12-small"><br></div>
                    <div class="col-6 col-12-small"><br></div>
                    <div class="col-6 col-12-small"><br></div>
                    <div class="col-6 col-12-small"><br></div>
                    <div class="col-6 col-12-small"><br></div>
                </div>

            </div>

            <section id="sidebar">
                <section id="intro">
                    <header>
                        <h2>Enviar respuestas</h2>
                        Tarea: <%=Tarea.problemas%> <br>
                                    <!--Fecha de inicio:&nbsp;&nbsp; <% /*=Tarea.inicio*/%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                        Fecha límite: <%=Tarea.limite%>

                        <p><br>
                        <h4>INSTRUCCIONES:</h4>
			Para escribir tus respuestas, procura que el resultado esté simplificado al máximo, de lo contrario sera incorrecta.<br>
			Procura escribir todos los resultados en una misma expresión, es decir si tienes a * (b/c), mejor escribe (ab/c), de no ser así, tu respuesta será incorrecta.<br>
			Si en tu teclado puedes escribir los simbolos π,ø,√..., mejor utiliza el teclado virtual, si no, puede ser que tu respuesta sea incorrecta.<br>
			Puedes escribir los números directamente desde tu teclado, los demás simbolos no.<br>
                        </p>
                    </header>
                </section>   
            </section>
        </div>
        <%@include file="links.jsp"%>
	<%}%>
    </body>
</html>
