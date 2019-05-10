<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession ses = request.getSession();
    int tipo = 0;
    if(!(ses.getAttribute("tipo") == null))
    {
        tipo = Integer.parseInt(ses.getAttribute("tipo").toString());
    }
%>
<link rel="stylesheet" href="../assets/css/main.css" />
<%    if (tipo == 0) {
%>
<header id="header">
    <h1><a href="index.jsp">Omniknow</a></h1>
</header>
<%
} else if (tipo == 1) {
%>
<header id="header" >
    <h1><a href="index.jsp">Omniknow</a></h1>
    <nav class="links">
        <ul>
            <li><a href="operador.jsp">Crear reporte</a></li>
            <li><a href="verReportes.jsp">Ver reportes</a></li>
            <!--<li><a href="enviarRespuesta.jsp">Enviar respuestas</a></li>-->
        </ul>
    </nav>
    <nav class="main">
        <ul>
            <li class="menu">
                <a class="fa-bars" href="#menu">Menu</a>
            </li>
        </ul>
    </nav>
</header>

<!-- Menu -->
<section id="menu">
    <section>
        <ul class="links">
            <li>
                <a href="cerrarSesion.jsp"><h3>Cerrar Sesion</h3></a>
            </li>
        </ul>
    </section>
</section>

<%
} else if (tipo == 2) {
%>
<header id="header">
    <h1><a href="index.jsp">Omniknow</a></h1>
    <nav class="links">
        <ul>
            <li><a href="verRepInge.jsp">Nuevos reportes</a></li>
            <li><a href="verRepIngeResueltos.jsp">Reportes resueltos</a></li>
            <!--<li><a href="verSolInge.jsp">Reportes resueltos</a></li>-->
        </ul>
    </nav>
    <nav class="main">
        <ul>
            <li class="menu">
                <a class="fa-bars" href="#menu">Menu</a>
            </li>
        </ul>
    </nav>
</header>

<!-- Menu -->
<section id="menu">
    <section>
        <ul class="links">
            <li>
                <a href="cerrarSesion.jsp"><h3>Cerrar Sesion</h3></a>
            </li>
        </ul>
    </section>
</section>
<%
    } else if(tipo == 3)
    {
    
        %>
<header id="header">
    <h1><a href="index.jsp">Omniknow</a></h1>
    <nav class="links">
        <ul>
            <li><a href="verGerente.jsp">Asignar ingeniero</a></li>
            <li><a href="responderGerente.jsp">Responder reporte</a></li>
            <!--<li><a href="verRepResGerente.jsp">Reportes Resueltos</a></li>-->
        </ul>
    </nav>
    <nav class="main">
        <ul>
            <li class="menu">
                <a class="fa-bars" href="#menu">Menu</a>
            </li>
        </ul>
    </nav>
</header>

<!-- Menu -->
<section id="menu">
    <section>
        <ul class="links">
            <li>
                <a href="cerrarSesion.jsp"><h3>Cerrar Sesion</h3></a>
            </li>
        </ul>
    </section>
</section>
<%
    }else if( tipo == 4) { // Gerente de mantenimiento %>
<header id="header">
    <h1><a href="index.jsp">Omniknow</a></h1>
    <nav class="links">
        <ul>
            <li><a href="listaReporteMantenimiento.jsp">Ver todos los reportes</a></li>
            <li><a href="responderGerente.jsp">Responder reporte</a></li>
            <li><a href="responderGerente.jsp">Reportes solucionados</a></li>
            <li><a href="responderGerente.jsp">Pago de reportes</a></li>
            <!--<li><a href="verRepResGerente.jsp">Reportes Resueltos</a></li>-->
        </ul>
    </nav>
    <nav class="main">
        <ul>
            <li class="menu">
                <a class="fa-bars" href="#menu">Menu</a>
            </li>
        </ul>
    </nav>
</header>

<!-- Menu -->
<section id="menu">
    <section>
        <ul class="links">
            <li>
                <a href="cerrarSesion.jsp"><h3>Cerrar Sesion</h3></a>
            </li>
        </ul>
    </section>
</section>

<%
    }
                                                else
{
    %>
<header id="header">
    <h1><a href="index.jsp">Omniknow</a></h1>
</header>

<!-- Menu -->
<section id="menu">
    <section>
        <ul class="links">
            <li>
                <a href="cerrarSesion.jsp"><h3>Cerrar Sesion</h3></a>
            </li>
        </ul>
    </section>
</section>

<%}%>