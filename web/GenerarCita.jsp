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
          <div class="container" align="center">   
             <form class="form-control" style="width: 350px; height: 560px">               
                <h4>GENERAR CITA</h4><br>
                <div align="left" >DNI DEL PACIENTE</div>
                <input type="text" name="txtdni" class="form-control"><br>
                <div align="left" >AREA </div>
                <input type="text" name="txtarea" class="form-control"><br>
                <div align="left" >TURNO </div>
                <input type="text" name="txtturno" class="form-control"><br>
                <div align="left" >FECHA </div>
                <input type="text" name="txtfecha" class="form-control">
                <input type="hidden" name="txtidmedic" class="form-control"><br>
                <div align="left" >NOMBRE MEDICO </div>
                <input type="text" name="txtnommedico" class="form-control"><br>
                <div align="left" >HORARIO </div>
                <input type="text" name="txthorario" class="form-control"><br>
                <input type="submit" value="RESERVAR CITA" class="btn btn-primary">
              </form>     
            </div>
        <br><br>
    </body>
</html>
