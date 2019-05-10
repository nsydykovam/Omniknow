<%--
NOTA IMPORTANTE: Aquí tienen que hacer invisibles los input[text], pero no 
les cambien nada, éstos contienen la información que se subirá a la base de datos
Borren esta nota cuando los hayan ocultado. Es más, si lo prefieren, pueden
dejarlo a un lado, tal vez sea más cómodo para el entrenador, que sabe usar
LaTeX y se sienta más seguro., los quitamos, y no quitare tu nota,bueno si pero cuando la leas.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Sesion.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tareas y soluciones</title>
        <!--Cosas para evitar trampas de regresos-->
         <%
            HttpSession sesion=request.getSession();
            HttpServletResponse resp=(HttpServletResponse)response;
            if(sesion.isNew()){
                resp.sendRedirect("index.jsp");
            }else{
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
        
        <script>
            function despliegaCombo()
            {
                txtGrado.value = comboGrado.value;
                
            }
            function despliegaFecha()
            {
                txtFecha.value = dateFinal.value;
                
            }
	    function ponerNombreT()
	    {
		
		
	    }
        </script>
    </head>
    <body onload="cActive()">
        <div id="wrapper">
            <%@include file="barraSuperior.jsp" %>
            <div id="main">
                <!--=========================SUBIR TAREA=========================-->
                <!--=========================SUBIR TAREA=========================-->
                <!--=========================SUBIR TAREA=========================-->
                <article class="post">
                    <header>
                        <div class="title">
                            <h2><a>Archivo tarea</a></h2>
                            <p>Sube el archivo pdf correspondiente a la tarea</p>
                        </div>
                        <div class="meta">
                            <div class="col-6 col-12-xsmall" >
                                <form id="demo2" name="demo2" action="subirPDF.jsp" target="frameT" method="post" enctype="multipart/form-data" style="padding: 10px;" >
                                    <label for="fileT" class="button icon fa-upload">Subir</label>
				    <input type="file" id="fileT"  style="display: none"  name="fileT" onchange="vistaPDF(1)" accept=".pdf" />
                                </form>
                            </div>
                        </div>
                    </header>
                    <iframe name="frameT" src="../PDF/VistaPrevia.html" style="width: 100%; height: 400px;"></iframe>
                </article>
                <!--=========================SUBIR SOLUCION=========================-->
                <!--=========================SUBIR SOLUCION=========================-->
                <!--=========================SUBIR SOLUCION=========================-->
                <article class="post">
                    <header>
                        <div class="title">
                            <h2><a>Archivo solución</a></h2>
                            <p>Sube el archivo pdf correspondiente a la solución</p>
                        </div>
                        <div class="meta">
                            <div class="col-6 col-12-xsmall">
                                <form id="demo3" name="demo2" action="subirPDF.jsp" target="frameS" method="post" enctype="multipart/form-data" style="padding: 10px;">
                                    <label for="fileS" class="button icon fa-upload" >Subir</label> 
				    <input type="file" id="fileS" style="display: none" name="solucionPDF" onchange="vistaPDF(2)" accept=".pdf" />
                                </form>
                            </div>
                        </div>
                    </header>
                    <iframe name="frameS" src="../PDF/VistaPrevia.html" style="width: 100%; height: 400px;"></iframe>
                </article>
                <!--====================FORMULARIO=========================-->
                <!--====================FORMULARIO=========================-->
                <!--====================FORMULARIO=========================-->
                <article class="post">
                    <form id="demo1" action="subirTarea.jsp" method="get" style="padding: 10px;">
                        Respuesta del problema 1: <span id="math-field-1" onclick="cambiarMathField(1);"></span>
                        <input type="text" id="txtLatex1" name="latex1" readonly style="visibility: hidden" />
                        <%--Cosas de MathQuill B1--%>
                        <script>
                            var mathFieldSpan1 = document.getElementById('math-field-1');
                            var latexText1 = document.getElementById('txtLatex1');

                            var MQ = MathQuill.getInterface(2); // for backcompat
                            var mathField1 = MQ.MathField(mathFieldSpan1, {
                              spaceBehavesLikeTab: true, // configurable
                              handlers: {
                                edit: function() { // useful event handlers
                                  latexText1.value = mathField1.latex(); // simple API
                                }
                              }
                            });
                        </script>
                        <br><br>
                        <hr>
			
			
                        Respuesta del problema 2: <span id="math-field-2" onclick="cambiarMathField(2);"></span>
                        <input type="text" id="txtLatex2" name="latex2" readonly style="visibility: hidden;"/>
                        <%--Cosas de MathQuill B2--%>
                        <script>
                            var mathFieldSpan2 = document.getElementById('math-field-2');
                            var latexText2 = document.getElementById('txtLatex2');

                            var MQ = MathQuill.getInterface(2); // for backcompat
                            var mathField2 = MQ.MathField(mathFieldSpan2, {
                              spaceBehavesLikeTab: true, // configurable
                              handlers: {
                                edit: function() { // useful event handlers
                                  latexText2.value = mathField2.latex(); // simple API
                                }
                              }
                            });
                        </script>
                        <br><br>
                        <hr>
			
			
                        Respuesta del problema 3: <span id="math-field-3" onclick="cambiarMathField(3);"></span>
                        <input type="text" id="txtLatex3" name="latex3" readonly style="visibility: hidden"/>
                        <%--Cosas de MathQuill B3--%>
                        <script>
                            var mathFieldSpan3 = document.getElementById('math-field-3');
                            var latexText3 = document.getElementById('txtLatex3');

                            var MQ = MathQuill.getInterface(2); // for backcompat
                            var mathField3 = MQ.MathField(mathFieldSpan3, {
                              spaceBehavesLikeTab: true, // configurable
                              handlers: {
                                edit: function() { // useful event handlers
                                  latexText3.value = mathField3.latex(); // simple API
                                }
                              }
                            });
                        </script>
                        <br><br>
                        <hr>
			
			
                        Respuesta del problema 4: <span id="math-field-4" onclick="cambiarMathField(4);"></span>
                        <input type="text" id="txtLatex4" name="latex4" readonly style="visibility: hidden"/>
                        <%--Cosas de MathQuill B4--%>
                        <script>
                            var mathFieldSpan4 = document.getElementById('math-field-4');
                            var latexText4 = document.getElementById('txtLatex4');

                            var MQ = MathQuill.getInterface(2); // for backcompat
                            var mathField4 = MQ.MathField(mathFieldSpan4, {
                              spaceBehavesLikeTab: true, // configurable
                              handlers: {
                                edit: function() { // useful event handlers
                                  latexText4.value = mathField4.latex(); // simple API
                                }
                              }
                            });
                        </script>
                        <br><br>
                        <hr>
			
			
                        Respuesta del problema 5: <span id="math-field-5" onclick="cambiarMathField(5);"></span>
                        <input type="text" id="txtLatex5" name="latex5" readonly style="visibility: hidden;"/>
                        <%--Cosas de MathQuill B5--%>
                        <script>
                            var mathFieldSpan5 = document.getElementById('math-field-5');
                            var latexText5 = document.getElementById('txtLatex5');

                            var MQ = MathQuill.getInterface(2); // for backcompat
                            var mathField5 = MQ.MathField(mathFieldSpan5, {
                              spaceBehavesLikeTab: true, // configurable
                              handlers: {
                                edit: function() { // useful event handlers
                                  latexText5.value = mathField5.latex(); // simple API
                                }
                              }
                            });
                        </script>
                        <hr>
			
			
                        <br><br>
                        
			
			<!--===========================OTROS DATOS DEL FORMULARIO===========================-->
			<!--===========================OTROS DATOS DEL FORMULARIO===========================-->
			<!--===========================OTROS DATOS DEL FORMULARIO===========================-->
			
			<input type="text" name="txtGrado" id="txtGrado" style="display:none;">
			<input type="text" name="txtFecha" id="txtFecha" style="display:none;width:100%">
			
			<input type="text" id="txtTarea"    name="tareaNombre"    class="txtTyS left"   placeholder="Nombre tarea" />
			<input type="text" name="txtPDFT" id="txtPDFT" style="left: 100px; position: relative; display:none;">
			
			<input type="text" id="txtSolucion" name="solucionNombre" class="txtTyS right"  placeholder="Nombre solución" />
			<input type="text" name="txtPDFS" id="txtPDFS" style="left: 200px; position: relative; display:none;">
                        <%--El reemplazar cambia los \ a / porque \ es una secuencia de
                        escape y no se guarda correctamente ("desaparece")--%>
			<input type="button" value="Guardar tarea" onClick="vaciosRespuestas()"  />
                    </form>
                </article>
                    
                <%@include file="teclado.jsp" %>
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
                <article>
                    <header>
                        <h3><a >Nota:</a></h3>
                        <p align="justify">Evita que los nombres de los archivos incluyan letras acentuadas, no causará ningún problema pero la forma en que se guardarán no será agradable a la vista o legible.</p>
                    </header>
                </article>
                <section id="intro">
                    <header>
                        <h2>Subir tarea</h2>
                        <p>Aqui puedes subir las tareas, con sus soluciones, para los participantes</p>
                    </header>
                </section>
                
                <section>
                    <div class="mini-posts">
                        <article class="mini-post">
                            <div class="row">
                                <header>
                                    <h3><a >Selecciona el grado al que va dirigida la tarea</a></h3>
                                </header>
                                <div class="col-1"></div>
                                <div class="col-10">
                                    <select id="comboNivel" onChange="cambiarCombo(comboNivel)" > 
                                        <option>Nivel</option>
                                        <option>Primaria</option>
                                        <option>Secundaria</option>
                                    </select>
                                </div>
                                <div class="col-1"></div><div class="col-1"></div>
                                <div class="col-10">
                                    <select id="comboGrado"  name="gradoParticipante" onchange="despliegaCombo()" > 
                                        <option>Grado</option>
                                    </select>
				    
                                </div>
                                <div class="col-1"></div>
                                <div class="col-12"><br></div>
                            </div>
                        </article>
                        <article class="mini-post">
                            <div class="row">
                                <header>
                                    <h3><a >Selecciona la fecha límite para entregar</a></h3>
                                </header>
                                <div class="col-1"></div>
                                <div class="col-10">
                                    <input type="date" id="dateFinal" name="fechaLimite" onchange="despliegaFecha()" class="fecha" style="width: 100%">
                                </div>
                                <div class="col-1"></div>
                                <div class="col-12"><br></div>
                            </div>
                        </article>
                    </div>
                </section>
            </section>
        </div>
    <%}%>
    <%@include file="links.jsp"%>
    </body>
</html>