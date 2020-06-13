<%-- 
    Document   : crearCuenta
    Created on : Oct 8, 2018, 2:31:39 AM
    Author     : gusta
--%>
<%@page import="entidad.Recepcionista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Registrar doctor</title>
        <script> 
                  function comprobarClave(){ 
   	contrasena = document.metodo.contrasena.value 
   	contrasena2 = document.metodo.contrasena2.value 

   	if (contrasena == contrasena2) 
      	alert("Tu cuenta ha sido registrada")
   	else 
      	alert("Las contraseñas no coinciden, volver a escribirlas")
                   } 
        </script>
        <nav class="navbar navbar-expand navbar-light btn-lg disabled" style="background: white">
           <div class="container-fluid collapse navbar-collapse">
             <div class="navbar-header">
               <img src="img/LogoSS.jpg" style="width: 130px; height: auto"/>
             </div>
             <ul class="nav navbar-nav mr-auto mt-2 mt-lg-0">
               <li class="nav-item active"><a class="nav-link" href="MenuRecepcionista.jsp">Inicio</a></li>
               <li class="nav-item"><a class="nav-link" href="">Perfil</a></li>
               <li class="nav-item"><a class="nav-link" href="#">Citas médicas</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown">Pacientes</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="crearCuentaPaciente.jsp">Registrar paciente</a>
                        <a class="dropdown-item" href="BuscarPacientes.jsp">Búsqueda de paciente</a>
                    </div>
                </li>
                
                <li class="nav-item dropdown">
                    <button class="nav-link dropdown-toggle btn btn-info" data-toggle="dropdown">Doctores</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" disabled="">Registrar doctor</a>
                        <a class="dropdown-item" href="BuscarDoctores.jsp">Busqueda de doctor</a>
                    </div>
                </li>
               <li class="nav-item"><a class="nav-link" href="#">Reprogramar citas</a></li>
             </ul>
             <ul class="nav navbar-nav navbar-right">
               <li class="btn btn-outline-danger btn-sm" style="margin-left: 20px; font-size: medium"><a class="nav-link" href="IngresoRecep.jsp">Cerrar sesión</a></li>
             </ul>
           </div>
         </nav>
    </head>
    
    <body>
        <div class="container-fluid">
            <div class="row"  style="background-color: #D4EFDF">
                <div class="col-sm-6">
                    <img src="img/Persona - section.jpg" style="height: 92%; width: auto"/>
                </div>
                <div class="col-sm-5">
                    <h1 style="margin-top: 20px; margin-left: 110px">Registrar doctor</h1>
                    <form style="margin-top: 20px" action="Controlador" name="metodo" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="metodo" value="registradoctor">
                        <div>
                        <div class="form-group">
                            <input class="input form-control" type="text" name="userdoctor" placeholder="&#127891; Codigo de Doctor" required>
                        </div>
                        <div class="form-group">
                            <input class="input form-control" type="password" name="contrasena" placeholder="&#x1F512; password" required>
                        </div>
                        <div class="form-group">
                            <input class="input form-control" type="password" name="contrasena2" placeholder="&#x1F512; Confirmar Password" required>
                        </div>
                        <div class="form-group">
                            <input class="input form-control" type="text" name="nombred" placeholder="&#128100; Nombre" required autofocus>
                        </div>
                        <div class="form-group">
                            <input class="input form-control" type="text" name="apellidod" placeholder="&#128100; Apellido" required>
                        </div>
                        <div class="form-group">
                            <input class="input form-control" type="text" name="telefonod" placeholder="&#128100; Celular" required>
                        </div>
                        </div>
                        <div class="form-group">
                            <select class="input form-control" name="sexod" required >
                                <option selected>Elige tu sexo</option>
                                <option>Masculino</option>
                                <option>Femenino</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input class="input form-control" style="background-color: #D4EFDF" type="file" name="fotod" value="fotod" required>
                        </div>
                        <div class="btn_form">
                            <input class="btn_registrar btn btn-success" style="margin-right: 20px" type="submit" value="REGISTRAR" onClick="comprobarClave()">
                            <input class="btn_reset btn btn-light" type="reset" value="LIMPIAR">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
