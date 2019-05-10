<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Sesion.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Graficas</title>
        <link rel="stylesheet" href="../CSS/encabezado.css" type="text/css"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Icono de pestaña-->
        <link rel="icon" href="../Imagenes/Omniknow solo.png">
        <!--Archivo CSS-->
        <link rel="stylesheet" href="../CSS/encabezado.css" type="text/css"/>
        <link href="../CSS/cssGraficas.css" type="text/css"  rel="stylesheet">
        <!--Archivo JS-->
        <script src="../JS/inicioSesion.js"></script>
        <script src="../JS/registroUsuario.js"></script>
        <script>
            function cambiarFrame(combo)
            {
                txtG.value = combo.options[combo.selectedIndex].text;
                console.log(txtG.value);
                var t = document.getElementById("form");
                
                t.submit();
            }
            
        </script>
    </head>
    <body >
        <div id="wrapper">
            <%@include file="barraSuperior.jsp" %>
            <div id="main">
                <div id="particles-js" style=" background-color: rgba(255,255,255,0); position: fixed; width: 100%; height: 100%"></div>
                <article class="post">
                    <div class="div_Combo_Estadisticas">
                        <center>
                            <p>Selecciona el grado para ver la tareas y elegir que gráfica ver</p>

                            <select id="comboNivel" onChange="cambiarCombo(comboNivel)"> 
                                <option>Nivel</option>
                                <option>Primaria</option>
                                <option>Secundaria</option>
                            </select>
                            <!--COMBO GRADO-->
                            <select id="comboGrado"  name="gradoParticipante" onchange="cambiarFrame(comboGrado)"> 
                                <option>Grado</option>
                            </select>
                            <input type="submit" class="button" onclick="cambiarFrame(comboGrado)" value="Ok">
                        </center>
                    </div>
                </article>
                <article class="post">
                    <iframe width="100%" height="800px" style="border: none; overflow: hidden; padding: 0px;" name="frameCombo" scrolling="no"></iframe>
                    <form name="form" id="form" action="estadisticasE_frame.jsp" target="frameCombo" >
                        <input type="text" name="txtG" id="txtG" style="visibility: hidden">
                    </form>
                </article>
            </div>
            <section id="sidebar">
                <section id="intro">
                    <header>
                        <h2>Estadísticas</h2>
                        <p>
                            Selecciona el grupo y despues la tarea de la que quieres ver la informacion
                        </p>
                    </header>
                </section>
            </section>
            
        </div>
        
<!-- ================================ -->
        
        <!--<iframe width="700px" height="600px;" style="border: none;" name="frameCombo"></iframe>-->
        
            <%@include file="links.jsp" %>%>
    </body>
</html>