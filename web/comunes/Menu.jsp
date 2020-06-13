<%-- 
    Document   : Menu
    Created on : 15/09/2018, 01:33:43 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Recursos/css/estilos.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="modal fade" id="manual">
            <div class="modal-dialog">
                <div class="modal-content">
                    <%-- header de la ventana--%>
                    <div class="modal-header">
                        <center><h4 class="modal-title"> Aquí podras encontrar el enlace </h4></center>                
                    </div>
                    <%-- Contenido de la ventana--%>
                    <div class="modal-body">
                        <p align="center" font-family="verdana">https://drive.google.com/file/d/1zS9cUBgN3mfYPKdB9-rYfOrfysYHqqem/view?usp=sharing</p>    </div>
                </div>
            </div>             
        </div>
    <center>
        <table>
            <tr> <td>&nbsp</td></tr>
            <tr align="center"> <td><a href="#manual" class="btn btn-info btn-lg" data-toggle="modal">Manual de Usuario</a></td>
                <td>&nbsp</td>
            </tr>
        </table>
    </center>
    <br>
    <nav id="navg">
        <ul id="menu" >
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="quienessomos.jsp">Conócenos</a></li>
            <li><a href="servicios.jsp">Cursos</a></li>
            <li><a href="listaprof.jsp">Lista de Profesores</a></li>
            <li><a href="registrop.jsp">Registro</a></li>
            <li><a href="login.jsp">Iniciar Sesión</a></li>
        </ul>   
    </nav>
    <br/>
</body>
</html>
