<%-- 
    Document   : Perfilpaciente
    Created on : 27-may-2020, 1:26:53
    Author     : RENZO LOBATO
--%>

<%@page import="entidad.Doctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
       <title>Bienvenido(a)</title>
   </head>    
   
   <body style="background-image: url('img/PerfilPaciente_fondo.jpg'); background-size: cover">
       <%
           Doctor p = (Doctor) request.getAttribute("data");
       %>
       <nav class="navbar navbar-expand navbar-light btn-lg disabled" style="background: white">
           <div class="container-fluid">
             <div class="navbar-header">
               <img src="img/LogoSS.jpg" style="width: 130px; height: auto"/>
             </div>
             <ul class="nav navbar-nav mr-auto mt-2 mt-lg-0">
               <li class="nav-item active"><button class="nav-link btn btn-info" disabled="">Inicio</button></li>
               <li class="nav-item"><a class="nav-link" href="">Perfil</a></li>
               <li class="nav-item"><a class="nav-link" href="#">Pacientes citados</a></li>
               <li class="nav-item"><a class="nav-link" href="ExamenesMedicos.jsp">Resultados de Exámenes Medicos</a></li>
             </ul>
             <li style="margin-top: 10px">Bienvenido(a) <%= p.getNomdoctor()%> <%= p.getApedoctor()%></li>
               <li class="btn btn-outline-danger btn-sm" style="margin-left: 20px; font-size: medium"><a class="nav-link" href="IngresoDoctor.jsp">Cerrar sesión</a></li>
             </ul>
           </div>
       </nav>
               
       <div class="container-fluid" style="margin-left: 30px; align-content: space-between">
           <form  method="post">
               <div class="profile-img">
                   <img style="margin-left: 15px" width="250" height="205" class="rounded float-center" src="Recursos/imagenesdoctor/<%= p.getFotodoctor()%>" alt=""/> <br><br><br>
               </div>
               <div class="form-group">
                   <label>Nombres</label>
                   <input style="margin-left: 19px" type="text" disabled="disabled" name="nombre_apellido" value="<%= p.getNomdoctor()%>">
               </div>
               
               <div class="form-group">
                   <label>Apellidos</label>
                   <input style="margin-left: 19px" type="text" disabled="disabled" name="nombre_apellido" value="<%= p.getApedoctor()%>">
               </div>
               
               <div class="form-group">
                   <label>Telefono</label>
                   <input style="margin-left: 23px" type="text" disabled="disabled" name="telefono" value="<%= p.getTelefdoctor()%>">
               </div>
               <div>
                   <label>Sexo</label>
                   <input style="margin-left: 53px" type="text" disabled="disabled" name="sexo" value="<%= p.getSexodoctor()%>">
               </div>
           </form>        
        </div> 
   </body>
</html>