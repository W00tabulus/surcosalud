<%@page import="entidad.Recepcionista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link href="Recursos/css/estiloIndex.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Bienvenido(a)</title>
   </head>
   
    <body>
        <%
               Recepcionista p = (Recepcionista) request.getAttribute("logeado");
           %>
        <nav class="navbar navbar-expand navbar-light btn-lg disabled" style="background: white">
           <div class="container-fluid collapse navbar-collapse">
             <div class="navbar-header">
               <img src="img/LogoSS.jpg" style="width: 130px; height: auto"/>
             </div>
             <ul class="nav navbar-nav mr-auto mt-2 mt-lg-0">
               <li class="nav-item active"><button class="nav-link btn btn-info" disabled="">Inicio</button></li>
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
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown">Doctores</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="crearCuentaDoctor.jsp">Registrar doctor</a>
                        <a class="dropdown-item" href="BuscarDoctores.jsp">Busqueda de doctor</a>
                    </div>
                </li>
               <li class="nav-item"><a class="nav-link" href="#">Reprogramar citas</a></li>
             </ul>
             <ul class="nav navbar-nav navbar-right">
               <li style="margin-top: 10px">Bienvenido(a)<%= p.getNomrecep()%> <%= p.getAperecep()%> </li>
               <li class="btn btn-outline-danger btn-sm" style="margin-left: 20px; font-size: medium"><a class="nav-link" href="IngresoRecep.jsp">Cerrar sesión</a></li>
             </ul>
           </div>
         </nav>
    </body>
</html>
