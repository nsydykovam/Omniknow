/* global txtCorreoPart */

function mayus(txt) {
    txt.value = txt.value.toUpperCase();
}

function minus(txt) {
    txt.value = txt.value.toLowerCase();
}

function alfabeto() {
    var palabras = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ abcdefghijklmnñopqrstuvwxyz";
    var x = event.keyCode;
    var char = String.fromCharCode(x);
    if (palabras.indexOf(char) === -1) 
        event.returnValue = false;
}

function correo() {
    var texto = txtCorreoPart.value;
    var x = event.keyCode;
    var char = String.fromCharCode(x);
    if (char === '<' || char === '>') {
            event.returnValue = false;
    }
    else {
        if (char === '@') 
            if (texto.indexOf(char) !== -1)
                event.returnValue = false;
    }
}

function numero() {
    var palabras = "1234567890";
    var x = event.keyCode;
    var char = String.fromCharCode(x);
    if (palabras.indexOf(char) === -1) 
        event.returnValue = false;    
}

function alfabetoEscuela() {
    var palabras = "-.0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZ abcdefghijklmnñopqrstuvwxyz";
    var x = event.keyCode;
    var char = String.fromCharCode(x);
    if (palabras.indexOf(char) === -1) 
        event.returnValue = false;
}

function control(evt) {
    evt = evt||window.event; // IE support
    var cc = evt.keyCode;
    var ctrlDown = evt.ctrlKey||evt.metaKey; // Mac support

    if (ctrlDown && evt.altKey) return true;

    // Check for ctrl+c, v and x
    if (ctrlDown && cc == 67) return false;else    // c
    if (ctrlDown && cc == 86) return false;else   // v
    if (ctrlDown && cc == 88) return false;else  // x
    if (ctrlDown && cc == 88) return false;else //Enter
    // Otherwise allow
    return true;
}