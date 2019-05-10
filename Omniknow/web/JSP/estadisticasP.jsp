<%@page import="Conexiones.Base"%>
<%@page import="Sesion.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gráficas</title>
        <meta charset="UTF-8">
        <!--========================================================-->
        <!--Icono de pestaña-->
        <!--Archivo CSS-->
        <link rel="stylesheet" href="../CSS/cssGraficas.css" type="text/css">
    </head>
    <body >
        <div id="wrapper">
            <%@include file="barraSuperior.jsp" %>
            <div id="main">
                <div id="particles-js" style=" background-color: rgba(255,255,255,0); position: fixed; width: 100%; height: 100%"></div>
                <article class="post" style="height: 100%;">
                    <%            //CONEXIÓN A LA BASE - inicio
                    Base conexion = new Base();

                    Connection c = null;
                    Statement s = null;
                    ResultSet r = null;

                    c = conexion.getConnection();
                    s = c.createStatement();
                    //CONEXIÓN A LA BASE - fin

                    HttpSession sesion = request.getSession();

                    int idParticipante = Integer.parseInt(sesion.getAttribute("id").toString());

                    try {
                        s.executeUpdate("USE OMNIKNOW;");
                        r = s.executeQuery("SELECT * FROM INFOS_GRAFICAS WHERE ID_PARTICIPANTE = " + idParticipante + ";");
                        r.next();
                    } catch (SQLException error) {
                        out.print("ERROR TRES:\n" + error.toString());
                    }
                %>
                    <div id="contenedor">
                        <canvas id="canvas" width="890"  height="480">No soporta canvas</canvas>
                        <legend for="canvas"></legend>
                    </div>
                    <script>
                    function dibujarlinea(contexto, inicioX, inicioY, finX, finY, color) {
                        contexto.save();
                        contexto.strokeStyle = color;
                        contexto.beginPath();
                        contexto.moveTo(inicioX, inicioY);
                        contexto.lineTo(finX, finY);
                        contexto.stroke();
                        contexto.restore();
                    }

                    function dibujarBarra(contexto, X, Y, ancho, alto, color) {
                        contexto.save();
                        contexto.fillStyle = color;
                        contexto.fillRect(X, Y, ancho, alto);
                        contexto.restore();
                    }

                    var hacer_grafica = function (opciones) {
                        this.opciones = opciones;
                        this.canvas = opciones.canvas;
                        this.ctx = this.canvas.getContext("2d");
                        this.colors = opciones.colors;

                        this.dibujar = function () {
                            //valor maximo de los datos
                            var maxValor = 5;
                            //        for (var categ in this.opciones.data){
                            //            maxValor = Math.max(maxValor,this.opciones.data[categ]);
                            //        }
                            var AlturaCanvas = this.canvas.height - this.opciones.padding * 2;
                            var AnchuraCanvas = this.canvas.width - this.opciones.padding * 2;

                            //Dibujar lineas de cuadricula
                            var ValorCuadricula = 0;
                            while (ValorCuadricula <= maxValor) {
                                //nuestros valores de cuadrícula se incrementan en valor desde el fondo hacia arriba.
                                //por eso usamos (1 - ValorCuadricula/maxValor)
                                var gridY = AlturaCanvas * (1 - ValorCuadricula / maxValor) + this.opciones.padding;
                                dibujarlinea(
                                        this.ctx,
                                        0,
                                        gridY,
                                        this.canvas.width,
                                        gridY,
                                        this.opciones.gridColor
                                        );

                                //writing grid markers
                                this.ctx.save();
                                this.ctx.fillStyle = this.opciones.gridColor;
                                this.ctx.font = "bold 10px Arial";
                                this.ctx.fillText(ValorCuadricula, 10, gridY - 2);
                                this.ctx.restore();
                                //opciones.gridScale establece el paso usado para las lineas
                                ValorCuadricula += this.opciones.gridScale;
                            }

                            //dibujar barras
                            var barIndex = 0;
                            var numberOfBars = Object.keys(this.opciones.data).length;
                            var barSize = barSize = (AnchuraCanvas) / numberOfBars;
                            if (barSize > 50)
                                barSize = 50;

                            for (categ in this.opciones.data) {
                                var val = this.opciones.data[categ];
                                var barHeight = Math.round(AlturaCanvas * val / maxValor);
                                dibujarBarra(
                                        this.ctx,
                                        this.opciones.padding + barIndex * barSize,
                                        this.canvas.height - barHeight - this.opciones.padding,
                                        barSize,
                                        barHeight,
                                        this.colors[barIndex % this.colors.length]
                                        );

                                barIndex++;
                            }

                            //dibujar nombres
                            this.ctx.save();
                            this.ctx.textBaseline = "bottom";
                            this.ctx.textAlign = "center";
                            this.ctx.fillStyle = "#000000";
                            this.ctx.font = "bold 14px Arial";
                            this.ctx.fillText(this.opciones.seriesName, this.canvas.width / 2, this.canvas.height);
                            this.ctx.restore();

                            //diujar leyenda
                            barIndex = 0;
                            var legend = document.querySelector("legend[for='canvas']");
                            var ul = document.createElement("ul");
                            legend.append(ul);
                            for (categ in this.opciones.data) {
                                var li = document.createElement("li");
                                li.style.listStyle = "none";
                                li.style.borderLeft = "20px solid " + this.colors[barIndex % this.colors.length];
                                li.style.padding = "5px";
                                li.textContent = categ;
                                ul.append(li);
                                barIndex++;
                            }

                        };
                    };

                    function  hacer_colores(num) {
                        var colores = new Array(num);
                        var rojo;
                        var verde;
                        var azul;
                        for (i = 0; i < num; i++) {
                            rojo = Math.floor(Math.random() * 255);
                            verde = Math.floor(Math.random() * 255);
                            azul = Math.floor(Math.random() * 255);
                            colores[i] = "rgb(" + rojo + "," + verde + "," + azul + ")";
                        }
                        return colores;
                    }
                    //datos
                    var Micanvas = document.getElementById("canvas");
                    //dimensiones w: 640 h:480
                    var ctx = Micanvas.getContext("2d");


                    <%
                   ArrayList tareas = new ArrayList();
                   ArrayList calificaciones = new ArrayList();
                   int numTareas = 0;
                   try {
                       s.executeUpdate("USE OMNIKNOW;");
                       r = s.executeQuery("SELECT * FROM INFOS_GRAFICAS WHERE ID_PARTICIPANTE =" + idParticipante + ";");
                       while (r.next()) {
                           tareas.add(r.getString("NOMBRE_PROBLEMA"));
                           calificaciones.add(Integer.parseInt(r.getString("TOTAL")));
                           numTareas++;
                       }
                   } catch (SQLException e) {
                       out.print("ERROR DOS:\n" + e.toString());
                   }

                   out.print("var tareas = {");
                   for (int i = 0; i < tareas.size(); i++) {
                       if (i == tareas.size() - 1) {
                           out.print("'" + tareas.get(i) + "' : " + calificaciones.get(i) + "");
                       } else {
                           out.print("'" + tareas.get(i) + "' : " + calificaciones.get(i) + ",");
                       }
                   }
                   out.print("};");

                   out.print("var color = hacer_colores(" + numTareas + ");");

                    %>

                    //termina
                    var myhacer_grafica = new hacer_grafica({
                        canvas: Micanvas,
                        seriesName: "tareas",
                        padding: 20,
                        gridScale: 1,
                        gridColor: "0,0,0",
                        data: tareas,
                        colors: color
                    });
                    myhacer_grafica.dibujar();
                </script>
                </article>
            </div>
            <section id="sidebar">
                <section id="intro">
                    <header>
                        <h2>Mis estadísticas</h2>
                        <p>
                            Aqui puedes analizar tu progreso.
                        </p>
                    </header>
                </section>
            </section>
        </div>
    </body>
</html>
