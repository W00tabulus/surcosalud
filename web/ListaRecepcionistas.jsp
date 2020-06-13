<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::RECEPCIONISTAS::</title>
    </head>
    <link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <body>
        <nav class="navbar navar-default" role="navigation">
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target="#menu01" type="button">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar">Toggle Navation</span>
                </button>
                <a href="#" class="navbar-brand">CLINICA.COM</a>
            </div>
            <div class="collapse navbar-collapse" id="menu01">
                <ul class="nav navbar-nav">
                    <li><a href="MenuAdministrador.jsp">Inicio</a></li>
                    <li><a href="#">Colaboradores</a></li>
                    <li><a href="ListaAreas.jsp">Areas</a></li>
                    <li><a href="#">Turnos</a></li>
                    <li><a href="ListaCargos.jsp">Cargos</a></li>
                    <li><a href="#">Cerrar Sesion</a></li>
                </ul>
            </div>
        </nav>
        <br>
        <br>
        <div class="container">        
                <form class="form-inline">       
                <div align="center">
                <select class="form-control">
                    <option>SELECCIONE</option>
                    <option>ASCENDENTE</option>
                    <option>DESCENDENTE</option>
                </select>
                </div>
                </form>
             <a class="btn btn-success btn-lg">+</a>  
            <hr>          
        <table class="table table-bordered">
            <tr>
                <th class="text-center">DNI</th>
                <th class="text-center">NOMBRES</th>
                <th class="text-center">APELLIDO PATERNO</th>
                <th class="text-center">APELLIDO MATERNO</th>
                <th class="text-center" colspan="2" >OPCIONES</th>
            </tr>
            <tr>
                <td class="text-center">08071497</td>
                <td class="text-center">JOSELYN ANDREA</td>
                <td class="text-center">FLORES</td>
                <td class="text-center">MARQUEZ</td>
                <td class="text-center">
                    <a class="btn btn-warning btn-sm">Editar</a></td>
                 <td class="text-center">
                    <a class="btn btn-danger btn-sm">Eliminar</a></td>               
            </tr>
        </table>
        </div>
        
    </body>
 </html>