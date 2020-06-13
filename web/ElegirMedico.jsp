<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::ELEGIR MEDICO::</title>
    </head>
    <% 
        Date date = new Date();
        DateFormat fecha = new SimpleDateFormat("dd/MM/yyyy");
    %>
    <link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/styles.css" rel="stylesheet" type="text/css"/>
    <body>
         <nav class="navbar navar-default" role="navigation">
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target="#menu01" type="button">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar">Menú Navigation</span>
                </button>
                <a href="#" class="navbar-brand">CLINICA.COM</a>
            </div>
            <div class="collapse navbar-collapse" id="menu01">
                <ul class="nav navbar-nav">
                    <li><a href="MenuRecepcionista.jsp">Inicio</a></li>
                    <li><a href="Citas.jsp">Citas</a></li>
                    <li><a href="Pacientes.jsp">Pacientes</a></li>
                    <li><a href="ConsultarHistorial.jsp">Historial Paciente</a></li>
                    <li><a href="#">Cerrar Sesion</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">               
               <form class="form-inline">       
                <div align="center">
                <h4>Elegir Medico</h4><br>  
                FECHA : <input type="text" name="fecha" value="<%= fecha.format(date) %>" class="form-control"><br><br>
                <select class="form-control">
                    <option>SELECCIONE</option>
                    <option>MAÑANA</option>
                    <option>TARDE</option>
                    <option>NOCHE</option>
                </select>
                    -
                <select class="form-control">
                    <option>SELECCIONE</option>
                    <option>NEUROLOGIA</option>
                    <option>PSICOLOGIA</option>
                    <option>TRAUMATOLOGIA</option>
                </select>
                <input type="submit" value="BUSCAR" class="btn btn-primary">
                </div>
                </form> 
            <hr>          
        <table class="table table-bordered">
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">NOMBRE DEL MEDICO</th>
                <th class="text-center">APELLIDO PATERNO</th>
                <th class="text-center">APELLIDO MATERNO</th>
                <th class="text-center" colspan="2" >OPCION</th>
            </tr>
            <tr>
                <td class="text-center">M001</td>
                <td class="text-center">JUAN LENIN</td>
                <td class="text-center">REYNOSO</td>
                <td class="text-center">NAVARRO</td>
                <td class="text-center">
                 <a  href="ElegirPaciente.jsp" class="btn btn-warning btn-link">SELECCIONAR</a></td>          
            </tr>
        </table>
        </div>     
    </body>
</html>