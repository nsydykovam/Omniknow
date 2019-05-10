/* global txtLatex1, txtLatex2, txtLatex4, txtLatex3, txtLatex5, comboNivel, comboGrado, txtTarea, txtSolucion, dateFinal, fileT, fileS */

function poner(algo)
    {
	var x = document.getElementById(algo);
	x.style.display = 'block';
    }
    function quitar(algo)
    {
	var x = document.getElementById(algo);
	x.style.display = 'none';
    }

function vaciosRespuestas() {
    var vf = false;
    if(fileT.value==="") {
        alert("Faltó el archivo de los problemas");
        fileT.focus();
    }
    else
    if(fileS.value==="") {
        alert("Faltó el archivo de las soluciones");
        fileS.focus();
    }
    else
    if(txtTarea.value==="") {
        alert("Faltó el nombre de la tarea");
        txtTarea.focus();
    }
    else
    if(txtSolucion.value==="") {
        alert("Faltó el nombre de la solución");
        txtSolucion.focus();
    }
    else
    if (comboNivel.selectedIndex === 0) {
        alert("Selecciona el nivel");
        comboNivel.focus();
    }
    else
    if (comboGrado.selectedIndex === 0) {
        alert("Selecciona el grado");
        comboGrado.focus();
    }
    else
    if(dateFinal.value==="") {
        alert("Faltó la fecha límite");
        dateFinal.focus();
    }
    else 
    {
        var hoy = new Date();
        var fecha = new Date(dateFinal.value);
        if(fecha<hoy) {
            alert("No puedes poner hoy o una fecha del pasado");//esto no funciona muy bien nuria...
            dateFinal.focus();
        }
        else
        if(txtLatex1.value==="") {
            alert("Faltó la respuesta al problema 1");
        }
        else
        if(txtLatex2.value==="") {
            alert("Faltó la respuesta al problema 2");
        }
        else
        if(txtLatex3.value==="") {
            alert("Faltó la respuesta al problema 3");
        }
        else
        if(txtLatex4.value==="") {
            alert("Faltó la respuesta al problema 4");
        }
        else
        if(txtLatex5.value==="") {
            alert("Faltó la respuesta al problema 5");
        }
        else
        {
            vf = true;
        }
    }
    if (vf === true) {
	var x;
        reemplazar();
        var ft = document.getElementById("demo1");
        var fs1 = document.getElementById("demo2");
        var fs2 = document.getElementById("demo3");
        fs1.submit();
	for (var i = 0, max = 10000; i < max; i++) {
	    x++;
	}
        fs2.submit();
	for (var i = 0, max = 10000; i < max; i++) {
	    x++;
	}
        ft.submit();
        
    }
}

function reemplazar() {
    var p = txtLatex1.value;
    txtLatex1.value = p.replace(/\\/g,"/");
    p = txtLatex2.value;
    txtLatex2.value = p.replace(/\\/g,"/");
    p = txtLatex3.value;
    txtLatex3.value = p.replace(/\\/g,"/");
    p = txtLatex4.value;
    txtLatex4.value = p.replace(/\\/g,"/");
    p = txtLatex5.value;
    txtLatex5.value = p.replace(/\\/g,"/");
}

function vaciosCambios() {
    var vf = false;
    if(txtTarea.value==="") {
        alert("Faltó el nombre de la tarea");
        txtTarea.focus();
    }
    else
    if(txtSolucion.value==="") {
        alert("Faltó el nombre de la solución");
        txtSolucion.focus();
    }
    else
    if (comboNivel.selectedIndex === 0) {
        alert("Selecciona el nivel");
        comboNivel.focus();
    }
    else
    if (comboGrado.selectedIndex === 0) {
        alert("Selecciona el grado");
        comboGrado.focus();
    }
    else
    if(dateFinal.value==="") {
        alert("Faltó la fecha límite");
        dateFinal.focus();
    }
    else 
    {
        var hoy = new Date();
        var fecha = new Date(dateFinal.value);
        if(fecha<hoy) {
            alert("No puedes poner hoy o una fecha del pasado");//esto no funciona muy bien nuria... ¿Seguro? -Nuria
            dateFinal.focus();
        }
        else
        if(txtLatex1.value==="") {
            alert("Faltó la respuesta al problema 1");
        }
        else
        if(txtLatex2.value==="") {
            alert("Faltó la respuesta al problema 2");
        }
        else
        if(txtLatex3.value==="") {
            alert("Faltó la respuesta al problema 3");
        }
        else
        if(txtLatex4.value==="") {
            alert("Faltó la respuesta al problema 4");
        }
        else
        if(txtLatex5.value==="") {
            alert("Faltó la respuesta al problema 5");
        }
        else
        {
            vf = true;
        }
    }
    if (vf === true) {
        reemplazar();
        var ft = document.getElementById("demo1");
        var fs1 = document.getElementById("demo2");
        var fs2 = document.getElementById("demo3");
        fs1.submit();
        fs2.submit();
        ft.submit();
        
    }
}