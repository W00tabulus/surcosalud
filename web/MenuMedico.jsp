
<%@page import="entidad.Doctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link href="Recursos/css/estiloIndex.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
       <title>Bienvenido(a)</title>
   </head>    

   <body>
       <nav class="navbar navbar-expand navbar-light btn-lg disabled" style="background: white">
           <div class="container-fluid">
             <div class="navbar-header">
               <img src="img/LogoSS.jpg" style="width: 130px; height: auto"/>
             </div>
             <ul class="nav navbar-nav mr-auto mt-2 mt-lg-0">
               <li class="nav-item active"><button class="nav-link btn btn-info" disabled="">Inicio</button></li>
               <li class="nav-item"><a class="nav-link" href="#">Perfil</a></li>
               <li class="nav-item"><a class="nav-link" href="#">Pacientes citados</a></li>
               <li class="nav-item"><a class="nav-link" href="ExamenesMedicos.jsp">Resultados de Exámenes Medicos</a></li>
             </ul>
             <ul class="nav navbar-nav navbar-right">
           <%
               Doctor p = (Doctor) request.getAttribute("logeado");
           %>
               <li style="margin-top: 10px">Bienvenido(a) <%= p.getNomdoctor()%> <%= p.getApedoctor()%></li>
               <li class="btn btn-outline-danger btn-sm" style="margin-left: 20px; font-size: medium"><a class="nav-link" href="IngresoDoctor.jsp">Cerrar sesión</a></li>
             </ul>
           </div>
         </nav>
   </body>
</html>
