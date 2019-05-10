/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


            /* global latexText1, mathField1, mathField2, latexText2, latexText3, mathField3, latexText4, mathField4, latexText5, mathField5 */

function respuestas()
            {
                // el /\\/gi es para cambiar lo que esta dentro de /  / y el gi es para cambiar todo 
                var m1 = latexText1.value.replace(/\//gi,'\\');
                mathField1.latex(m1);
                var m2 = latexText2.value.replace(/\//gi,"\\");;
                mathField2.latex(m2);
                var m3 = latexText3.value.replace(/\//gi,"\\");;
                mathField3.latex(m3);
                var m4 = latexText4.value.replace(/\//gi,"\\");;
                mathField4.latex(m4);
                var m5 = latexText5.value.replace(/\//gi,"\\");;
                mathField5.latex(m5);
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
            combo2.options[i+1] = new Option(i+1);
        else
            combo2.options[i+1] = new Option(i+4);
    }
}