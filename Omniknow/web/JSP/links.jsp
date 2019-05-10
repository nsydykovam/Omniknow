<%-- 
    Document   : links
    Created on : 2/02/2019, 01:17:33 PM
    Author     : Jorge Juárez Tejeda
--%>


<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/browser.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>
<script src="../JS/tareasEntrenador.js"></script>
<script src="../JS/registroUsuario.js"></script>
<script src="../JS/jsPDF.js"></script>
<script src="../JS/cambiosBajas.js"></script>
<script src="../JS/seleccionTarea.js"></script>
<script>
            function poner(algo)
            {
                var x = document.getElementById(algo);
                if (x.style.display === 'none') {
                    x.style.display = 'block';
                } else {
                    x.style.display = 'none';
                }

            }
            function solicitClav()
            {
                var x = document.getElementById("solicitClav");
                if (x.style.display === 'none') {
                    x.style.display = 'block';
                } else {
                    x.style.display = 'none';
                }

            }
            function cambiarCombos()
            {
                var pos2 = txtPos2.value;
                var combo1 = document.getElementById("comboNivel");
                var combo2 = document.getElementById("comboGrado");
                cambiarC(combo1);
                combo2.selectedIndex = pos2;

            }
            function cambiarC(combo1)
            {
                var combo2 = document.getElementById("comboGrado");
                var pos = combo1.selectedIndex;
                for (var i = 0, max = 30; i < max; i++)
                {
                    combo2.options[1] = null;
                }
                for (var i = 0, max = 3; i < max; i++)
                {
                    if (pos === 2)
                        combo2.options[i + 1] = new Option(i + 1);
                    else
                        combo2.options[i + 1] = new Option(i + 4);
                }
            }
</script>

<!--COSA LOCA DEL FONDO--> 
<!-- scripts -->
        <script src="../JS/particles.js"></script>
