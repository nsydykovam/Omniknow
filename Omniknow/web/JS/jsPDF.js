/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


            /* global txtPDFT, fileT, URL, txtPDFS, fileS */

function vistaPDF(num)
            {
                if (num === 1) 
                {
                    var file = document.getElementById("fileT").files[0];
                    var urll = URL.createObjectURL(file);
                    window.open(urll,'frameT');
                    txtPDFT.value = fileT.value.substring(12);;
                }
                else
                {
                    var file = document.getElementById("fileS").files[0];
                    var urll = URL.createObjectURL(file);
                    window.open(urll,'frameS');
                    txtPDFS.value = fileS.value.substring(12);;
                }
                
            }
