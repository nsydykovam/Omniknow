<%@page import="Sesion.Barra"%>
<%-- 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesionBarra = request.getSession();
    int cual = Barra.cual;

    int gradoBarra = 0, tipo = 0;
    try {
        gradoBarra = Integer.parseInt("" + sesionBarra.getAttribute("grado"));
    } catch (NumberFormatException e) {
    }
    if (!(gradoBarra == 0)) {
        if (gradoBarra == 7) {
            tipo = 1;
        } else {
            tipo = 2;
        }
    } else {
        tipo = 0;
    }


%>
<link rel="stylesheet" href="../assets/css/main.css" />
<%    if (tipo == 0) {
%>
<header id="header">
    <h1><a href="index.jsp">Omniknow</a></h1>
</header>
<%
} else if (tipo == 2) {
%>
<header id="header" >
    <h1><a href="index.jsp">Omniknow</a></h1>
    <nav class="links">
        <ul>
            <li><a href="miSesion.jsp">Mi sesión</a></li>
            <li><a href="tareas.jsp">Tareas y soluciones</a></li>
            <li><a href="seleccionarTarea.jsp">Enviar respuestas</a></li>
            <li><a href="estadisticasP.jsp">Estadisticas</a></li>
            <li><a href="chat.jsp">Chat</a></li>
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
            <li>
                <a href="tareas.jsp">
                    <h3>Tareas y soluciones</h3>
                </a>
            </li>
            <li>
                <a href="seleccionarTarea.jsp">
                    <h3>Enviar respuestas</h3>
                </a>
            </li>
            <li>
                <a href="estadisticasP.jsp">
                    <h3>Estadísticas</h3>
                </a>
            </li>
            <li>
                <a href="chat.jsp">
                    <h3>Chat</h3>
                </a>
            </li>
        </ul>
    </section>
</section>

<%
} else if (tipo == 1) {
%>
<header id="header">
    <h1><a href="index.jsp">Omniknow</a></h1>
    <nav class="links">
        <ul>
            <li><a href="opcionesSesion.jsp">Mi sesión</a></li>
            <li><a href="aceptarParticipantes.jsp">Aceptar Participantes</a></li>
            <li><a href="subirEntrenador.jsp">Subir Tarea</a></li>
            <li><a href="verEntrenador.jsp">Ver tareas</a></li>
            <li><a href="estadisticasE_combo.jsp">Estadisticas</a></li>
            <li><a href="masPreguntasE.jsp">Preguntas</a></li>
            <li><a href="chat.jsp">Chat</a></li>
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
            <li>
                <a href="opcionesSesion.jsp">
                    <h3>Mi sesion</h3>
                </a>
            </li>
            <li>
                <a href="aceptarParticipantes.jsp">
                    <h3>Aceptar participantes</h3>
                </a>
            </li>
            <li>
                <a href="subirEntrenador.jsp">
                    <h3>Subir tarea</h3>
                </a>
            </li>
            <li>
                <a href="verEntrenador.jsp">
                    <h3>Ver tareas</h3>
                </a>
            </li>
            <li>
                <a href="estadisticasE_combo.jsp">
                    <h3>Estadisticas</h3>
                </a>
            </li>
            <li>
                <a href="masPreguntasE.jsp">
                    <h3>Preguntas</h3>
                </a>
            </li>
            <li>
                <a href="chat.jsp">
                    <h3>Chat</h3>
                </a>
            </li>
        </ul>
    </section>
</section>
<%
    }
%>
