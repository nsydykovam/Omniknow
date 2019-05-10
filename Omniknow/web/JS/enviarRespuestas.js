/* global txtLatex1, txtLatex2, txtLatex4, txtLatex3, txtLatex5, comboNivel, comboGrado, txtTarea, txtSolucion, dateFinal */
/*JAJAJA, NURIA TRONCA deberias de comentar tus codigos casi borro esto pensando qeu era de los entrenadores y no de los participantes*/
function vaciosRespuestas() {
    if(txtLatex1.value==="") {
        alert("Faltó la respuesta al problema 1");
        event.returnValue = false;
    }
    else
    if(txtLatex2.value==="") {
        alert("Faltó la respuesta al problema 2");
        event.returnValue = false;
    }
    else
    if(txtLatex3.value==="") {
        alert("Faltó la respuesta al problema 3");
        event.returnValue = false;
    }
    else
    if(txtLatex4.value==="") {
        alert("Faltó la respuesta al problema 4");
        event.returnValue = false;
    }
    else
    if(txtLatex5.value==="") {
        alert("Faltó la respuesta al problema 5");
        event.returnValue = false;
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