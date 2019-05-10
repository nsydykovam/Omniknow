<%@page import="Conexiones.Base"%>
<%@page import="Sesion.*" %>
<%@page import="java.sql.*,java.io.*" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../CSS/encabezado.css" type="text/css"/>
        <title>Tareas y soluciones</title>
        <!--Cosas para evitar trampas de regresos-->
         <%
        HttpSession sesion=request.getSession();
        HttpServletResponse resp=(HttpServletResponse)response;
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Icono de pestaña-->
        <link rel="icon" href="../Imagenes/Omniknow solo.png">
        <!--Archivo CSS-->
        <link rel="stylesheet" href="../font-awesome-4.7.0/css/font-awesome.css" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="">
        <!--Archivo JS-->
        <script src="../JS/jsTeclado.js"></script>
        <script src="../JS/cambiosBajas.js"></script>
        <script src="../JS/jsPDF.js"></script>
        
        <link rel="stylesheet" href="../CSS/mathquill.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="../JS/mathquill.js"></script>
        <script src="../JS/tareasEntrenador.js"></script>
        <script src="../JS/registroUsuario.js"></script>
        <script>
        var MQ = MathQuill.getInterface(2);
        </script>
        
    </head>
    <body onload="cActive()">
        <!--BARRITA DE NAVEGACIÓN (entrenador)-->
        <%@include file="barraSuperior.jsp" %>
        <br><br>
        <!--Aquí empiezan las cosas de la página-->
        
        <%
            //CONEXIÓN A LA BASE - inicio
            Base conexion = new Base();
            
            Connection c = null;
            Statement s = null;
            ResultSet r = null;
            
            c = conexion.getConnection();
            s = c.createStatement();
            //CONEXIÓN A LA BASE - fin
            
            int tipoC = Integer.parseInt(request.getParameter("txtBoton"));
            String nombreTarea = request.getParameter("txtNombreTarea");
            
            try
            {
                s.executeUpdate("USE OMNIKNOW;");
                r = s.executeQuery("SELECT * FROM INFOS_TAREAS WHERE NOMBRE_PROBLEMA='"+ nombreTarea +"';");
                r.next();
                
                int grado = Integer.parseInt(r.getString("GRADO_TAREA"));
                int nivel = 0;
                String nomS = r.getString("NOMBRE_SOLUCION");
                String fecha = "" + r.getString("FECHA_FINAL");
                String []respuesta = new String[5];
                String idTarea = r.getString("ID_TAREA");
                for (int i = 0; i < 5; i++) {
                        respuesta[i] = r.getString("RESPUESTA" + (i+1));
                        respuesta[i].replace('/', '\\');
                    }
                String aPDFT = r.getString("ARCHIVO_PROBLEMA");//aunque diga archivo es solo el nombre
                String aPDFS = r.getString("ARCHIVO_SOLUCION");// lo mismo aqui
                
                int pos1 = 0;
                int pos2 = 0;
                if(grado < 4)//secundaria
                {
                    pos2 = grado;
                    pos1 = 2;
                    nivel = 2;
                }
                else//primaria
                {
                    pos2 = grado-3;
                    pos1 = 1;
                    nivel = 1;
                }
            if (tipoC == 1) 
            {
                    
        %>
        
        <br>
        <h2 style="color: rgb(104,105,198);right:  10px;">Tareas y soluciones:<i>Cambiar Tarea</i></h2>
        <br><br><br>
        
        <!--Aqui empieza la rutina de cambios-->
        <div style="left: 0px; position: absolute; ">
            <form id="demo2" name="demo2" action="subirPDF.jsp" target="frameT" method="post" enctype="multipart/form-data" style="padding: 10px;" >
                <label for="fileT"><i class="fa fa-upload" style=" width: 30px; "></i>Archivo Tarea</label><input type="file" id="fileT"    name="fileT" onchange="vistaPDF(1)" accept=".pdf" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </form>
        </div>
        <div style="right:  0px; position: absolute">
            <form id="demo3" name="demo2" action="subirPDF.jsp" target="frameS" method="post" enctype="multipart/form-data" style="padding: 10px;">
                <label for="fileS" ><i class="fa fa-upload" style=" width: 30px; "></i>Archivo Solucion</label> <input type="file" id="fileS" name="solucionPDF" onchange="vistaPDF(2)" accept=".pdf" />
            </form>
        </div>
        <form name="demo1" id="demo1" action="cambiarTarea.jsp" method="get">
            <%--ARCHIVOS--%>
            <br><br>
            <br>
            <input type="text" name="txtPDFT" id="txtPDFT" value="<%out.print(aPDFT);%>" style="left: 100px; position: relative; visibility: hidden">
            <input type="text" name="txtPDFS" id="txtPDFS" value="<%out.print(aPDFS);%>" style="left: 200px; position: relative; visibility: hidden">
            <div>
                <iframe name="frameT" src="../PDF/<%out.print(aPDFT);%>" style="width: 48%;height: 500px; border: none"></iframe>
                <iframe name="frameS" src="../PDF/<%out.print(aPDFS);%>" style="width: 48%;height: 500px; border: none"></iframe>
            </div>
            <%--NOMBRES--%>
            <input type="text" id="txtTarea"    name="tareaNombre"    class="txtTyS left"  style="width: 400px; border-bottom-color: rgb(104,103,201);"  placeholder="Nombre tarea"  value="<%out.print(nombreTarea);%>"/>
            <input type="text" id="txtSolucion" name="solucionNombre" class="txtTyS right" style="width: 400px; border-bottom-color: rgb(104,103,201);" placeholder="Nombre solución" value="<%out.print(nomS);%>"/>
            <br><br>
            <%--GRADO--%>
            <!--COMBO NIVEL-->
            <select id="comboNivel" onChange="cambiarCombo(comboNivel)" style="background-color: rgb(104,103,201)"> 
                <option>Nivel</option>
                <option <%if(nivel == 1){ out.print("selected");}%> >Primaria</option>
                <option <%if(nivel == 2){ out.print("selected");}%> >Secundaria</option>
            </select>
            <!--COMBO GRADO-->
            <select id="comboGrado"  name="comboGrado" style="background-color: rgb(104,103,201) "> 
                <option>Grado</option>
            </select>
            <input type="text" name="txtPos1" id="txtPos1" value="<%out.print(pos1);%>" style="visibility: hidden;">
            <input type="text" name="txtPos2" id="txtPos2" value="<%out.print(pos2);%>" style="visibility: hidden;">
            <script>
                cambiarCombos();
            </script>
            <%--FECHA LÍMITE--%>
            <label for="dateFinal">Fecha límite: </label><input type="date" id="dateFinal" name="fechaLimite" value="<%out.print(fecha);%>" class="fecha" style="position: absolute;right: 40px;">
            <br><br><br><br>
            <%--RESPUESTAS DE LOS PROBLEMAS--%>
            <%--Luego hay que quitar los LaTeX, pero mientras lo dejaré para ver cómo funciona la cosa--%>
            Respuesta del problema 1: <span id="math-field-1" ></span>
            <input type="text" id="txtLatex1" name="latex1" readonly="true" value="<%out.print(respuesta[0]);%>" style="visibility: hidden;" /><br><br>
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
            <hr>
            Respuesta del problema 2: <span id="math-field-2"></span>
            <input type="text" id="txtLatex2" name="latex2" readonly="true" value="<%out.print(respuesta[1]);%>" style="visibility: hidden;" /><br><br>
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
            <hr>
            Respuesta del problema 3: <span id="math-field-3"></span>
            <input type="text" id="txtLatex3" name="latex3" readonly="true" value="<%out.print(respuesta[2]);%>"style="visibility: hidden;" /><br><br>
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
            <hr>
            Respuesta del problema 4: <span id="math-field-4"></span>
            <input type="text" id="txtLatex4" name="latex4" readonly="true" value="<%out.print(respuesta[3]);%>" style="visibility: hidden;" /><br><br>
            <%--Cosas de MathQuill B4--%>
            <script>
                var mathFieldSpan4 = document.getElementById('math-field-4');
                var latexText4 = document.getElementById('txtLatex4');

                var MQ = MathQuill.getInterf1ace(2); // for backcompat
                var mathField4 = MQ.MathField(mathFieldSpan4, {
                  spaceBehavesLikeTab: true, // configurable
                  handlers: {
                    edit: function() { // useful event handlers
                      latexText4.value = mathField4.latex(); // simple API
                    }
                  }
                });
            </script>
            <hr>
            Respuesta del problema 5: <span id="math-field-5"></span>
            <input type="text" id="txtLatex5" name="latex5" readonly="true" value="<%out.print(respuesta[4]);%>" style="visibility: hidden;"/><br><br>
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
            <input type="text" value="<%out.print(idTarea);%>" style="visibility: hidden" name="txtID" id="txtID">
            <BR>
            <input type="button" value="Cambiar" onClick="vaciosCambios()" style="background-color: rgb(104,103,201)"/>
            <input type="button" value="Cancelar" onClick="window.open('verEntrenador.jsp','_self');" style="background-color: rgb(104,103,201)"/>
            <%--El reemplazar cambia los \ a / porque \ es una secuencia de
            escape y no se guarda correctamente ("desaparece")--%>
        </form>
        
        
        
        <!--AQUI EMPIEZAN LAS COSAS DEL TECLADO-->
    <%@include file="teclado.jsp" %>
    <!--AQUI ACABAN LAS COSAS DEL TECLADO-->
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <script>
            respuestas();
        </script>
            
        
        <!--aqui acaba jijiji-->
        
        <%
        }
        else
        { 
            s.executeUpdate("USE OMNIKNOW;");
            s.executeUpdate("UPDATE TAREAS SET DISPONIBLE = '0' WHERE ID_TAREA = '"+ idTarea +"';");
            out.print("<script> alert('Tarea borrada'); window.open('verEntrenador.jsp','_self');</script>");
        }
    }catch(Exception e){
    out.print("ERROR DOS:\n"+e.toString());
}
        %>
    </body>
</html>
