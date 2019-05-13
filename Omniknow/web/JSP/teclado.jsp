<%-- 
    Document   : teclado
    Created on : 7/05/2018, 10:38:25 AM
    Author     : Alumno
--%>
<style>
    .color1{
	
    }
    .color2{
	
	
    }
    .color3{
	
	
    }
</style>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="tecladoBase" class="row" style="display: none; position: fixed;bottom: 0px; z-index: 1; background-color: rgb(250,250,250);">
    <div class="row" style="">
        <div class="col-12 row">
            <div class="col-2 col-4-small" >
                <a style="width:100%; border-color: white;" class="button color1" onClick='input("x")'>x</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color2" onClick='input("y")'>y</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color1" onClick='input("<")'><</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color2" onClick='input("\\ge")'>≤</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color1" onClick='input("(")'>(</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color2" onClick='input(")")'>)</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color1" onClick='input("[")'>[</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color2" onClick='input("]")'>]</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color1" onClick='input("{")'>{</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color2" onClick='input("}")'>}</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color1" onClick='input("\\sqrt")'>√</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color2" onClick='input("^")'>^a</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color1" onClick='input("\\pi")'>π</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color2" onClick='input("\\Sigma")'>∑</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color1" onClick='input("+")'>+</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color2" onClick='input("-")'>-</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color1" onClick='input("\\times")'>x</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color2" onClick='input("/")'>÷</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color1" onClick='input("=")'>=</a> 
            </div>
            <div class="col-2 col-4-small">
                <a style="width:100%" class="button color2" onClick='input(".")'>.</a>
            </div>
        </div>
        <div class="col-12" >
            <br>
        </div>
        <div class="col-4" >
            <a style="width: 100%" class="button color3" onClick="cambiarTeclado(3)">Ocultar</a>
        </div>
        <div class="col-4" >
            <a style="width: 100%" class="button color3" onClick='cambiarTeclado(2)'>øß∂</a>
        </div>
        <div class="col-4" >
            <a style="width: 100%" class="button color3" onClick='cambiarTeclado(5)'>123</a>
        </div>
    </div>
</div>
<div id="tecladoGriego" class="row" style="display: none; position: fixed;bottom: 0px; z-index: 1;background-color: rgb(250,250,250); font-family: none">
    <div class="row" style="">
        <div class="col-12 row">
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("\\alpha")'>α</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("\\beta")'>β</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("\\gamma")'>γ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("\\delta")'>δ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("\\epsilon")'>ε</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("\\zeta")'>ζ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("\\eta")'>η</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("\\theta")'>θ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("\\iota")'>ι</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("\\kappa")'>κ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("\\lambda")'>λ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("\\mu")'>μ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("\\nu")'>ν</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("\\xi")'>ξ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("\\pi")'>π</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("\\rho")'>ρ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("\\Sigma")'>σ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("\\tau")'>τ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("\\upsilon")'>υ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("\\varphi")'>φ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("\\chi")'>χ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("\\psi")'>ψ</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("\\omega")'>Ω</a>
            </div>
            <div class="col-12" >
                <br>
            </div>
            <div class="col-4" >
                <a style="width: 100%" class="button color3" onClick="cambiarTeclado(3);">Ocultar</a>
            </div>
            <div class="col-4" >
                <a style="width: 100%" class="button color3" onClick='cambiarTeclado(1)'>{x}</a>
            </div>
            <div class="col-4" >
                <a style="width: 100%" class="button color3" onClick='cambiarTeclado(5)'>123</a>
            </div>
        </div>   
    </div>
</div>
<div id="tecladoNumerico" class="row" style="display: none; position: fixed;bottom: 0px; z-index: 1;background-color: rgb(250,250,250); font-family: none">
    <div class="row" style="">
        <div class="col-12 row">
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("0")'>0</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("1")'>1</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("2")'>2</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("3")'>3</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("4")'>4</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("5")'>5</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("6")'>6</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("7")'>7</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("8")'>8</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("9")'>9</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("a")'>a</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("b")'>b</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("c")'>c</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("d")'>d</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color1" onClick='input("e")'>e</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("f")'>f</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("g")'>g</a>
            </div>
            <div class="col-2 col-4-small">
                <a style="width: 100%" class="button color2" onClick='input("h")'>h</a>
            </div>
            <div class="col-12" >
                <br>
            </div>
            <div class="col-4" >
                <a style="width: 100%" class="button color3" onClick="cambiarTeclado(3);">Ocultar</a>
            </div>
            <div class="col-4" >
                <a style="width: 100%" class="button color3" onClick='cambiarTeclado(1)'>{x}</a>
            </div>
            <div class="col-4" >
                <a style="width: 100%" class="button color3" onClick='cambiarTeclado(2)'>øß∂</a>
            </div>
        </div>   
    </div>
</div>
<div id="ponTeclado" style="display: block; position: fixed;bottom: 0px;right: 0px; z-index: 1;background-color: rgb(72,152,72); color: white">
    <a class="small"  onClick="cambiarTeclado(4);"><h1 style="color: white">Mostrar Teclado</h1></a>
</div>