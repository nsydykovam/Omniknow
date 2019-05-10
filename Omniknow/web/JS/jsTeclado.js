/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

            var cuadrito;
            
            function input(str) 
            {
                if (cuadrito == 1) 
                {
                    mathField1.cmd(str);
                    mathField1.focus();
                }
                else
                if (cuadrito == 2) 
                {
                    mathField2.cmd(str);
                    mathField2.focus();
                }
                else
                if (cuadrito == 3) 
                {
                    mathField3.cmd(str);
                    mathField3.focus();
                }
                else
                if (cuadrito == 4) 
                {
                    mathField4.cmd(str);
                    mathField4.focus();
                }
                else
                if (cuadrito == 5) 
                {
                    mathField5.cmd(str);
                    mathField5.focus();
                }
            }
            
            function cambiarMathField(num)
            {
                cuadrito = num;
            }
            
            function cambiarTeclado(num)
            {
                if(num === 1)//si es 1, viene del 2 y cambia al 1
                {
                    document.getElementById("tecladoBase").style.display = 'block'; 
                    document.getElementById("tecladoGriego").style.display = 'none';
                }
                else
                if (num === 2) //si es 2, viene del uno y cambia al 2
                {
                   document.getElementById("tecladoBase").style.display = 'none'; 
                   document.getElementById("tecladoGriego").style.display = 'block'; 
                }
                else
                if(num === 3)
                {
                   document.getElementById("tecladoBase").style.display = 'none'; 
                   document.getElementById("tecladoGriego").style.display = 'none'; 
                   document.getElementById("ponTeclado").style.display = 'block'; 
                   
                }
                else
                if(num === 4)
                {
                   document.getElementById("tecladoBase").style.display = 'block'; 
                   document.getElementById("tecladoGriego").style.display = 'none'; 
                   document.getElementById("ponTeclado").style.display = 'none'; 
                   
                }
            }
