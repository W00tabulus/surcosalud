<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::GENERAR CITA::</title>
    </head>
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
        <br>
         <br>
        <div class="container">        
                <form class="form-inline">     
                <div align="center">
                <h4>Generar Cita</h4><br>
                INGRESE DNI DEL PACIENTE :
                <input type="text" name="txtdni" class="form-control">
                <input type="submit" value="BUSCAR" class="btn btn-primary">
                </div>
                </form>  
            <hr>          
        <table class="table table-bordered">
            <tr>
                <th class="text-center">DNI</th>
                <th class="text-center">NOMBRES</th>
                <th class="text-center">APELLIDO PATERNO</th>
                <th class="text-center">APELLIDO MATERNO</th>
                <th class="text-center" colspan="2" >OPCION</th>
            </tr>
            <tr>
                <td class="text-center">08071497</td>
                <td class="text-center">JOSELYN ANDREA</td>
                <td class="text-center">FLORES</td>
                <td class="text-center">MARQUEZ</td>
                <td class="text-center">
                <a  href="GenerarCita.jsp" class="btn btn-warning btn-link">SELECCIONAR</a></td>        
            </tr>
        </table>
        </div>
    </body>
</html>
