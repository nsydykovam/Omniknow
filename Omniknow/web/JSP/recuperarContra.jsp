<!DOCTYPE html>
<html>
    <head>
        <title>Inicio de sesi�n</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Icono de pesta�a-->
        <link rel="icon" href="../Imagenes/Omniknow solo.png">
        <!--Archivo CSS-->
        <link rel="stylesheet" type="text/css" href="">
        <link rel="stylesheet" href="../CSS/encabezado.css" type="text/css"/>
        <script>
            function vvv()
            {
                var vf = false;
                if(txtUsuario.value === "")
                {
                    alert("Completa tu usuario");
                    txtUsuario.focus();
                }
                else
                    vf = true;
                return  vf;
            }
        </script>
        <!--Archivo JS-->
        <script src="../JS/inicioSesion.js"></script>     
    </head>
    <body onload="cActive()">
        <!--PSEUDO BARRA DE NAVEGACI�N, jaja pseudo.. se escucha gracioso -->
        <%@include file="barraSuperior.jsp" %>
        <br><br>
        
        <!--Aqu� empiezan las cosas de la p�gina-->
        <h2>Inicio de sesi�n</h2>
        <!--FORM DEL USUARIO Y CONTRASE�A-->
        <BR><BR>
        <div class="iSesion cuadro-contenedor">
        <form action="enviarContra.jsp" method="post">
            Usuario:    <input type="text"     id="txtUsuario"    name="txtUsuario"    maxlength="30" autocomplete="off"/> <br>
            <!--BOT�N PARA INGRESAR-->
            <br><br>
            <center>
                <a href="../HTML/inicioSesion.html" target="_self">Iniciar sesi�n</a>
                <input type="submit" class="boton" value="Recuperar" onClick="return vvv()">
            </center>
        </form>
        </div>
        <BR><BR>
    </body>
</html>
