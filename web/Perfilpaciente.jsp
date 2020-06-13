<%-- 
    Document   : Perfilpaciente
    Created on : 27-may-2020, 1:26:53
    Author     : RENZO LOBATO
--%>

<%@page import="entidad.Paciente"%>
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
           Paciente p = (Paciente) request.getAttribute("data");
       %>
       <nav class="navbar navbar-expand navbar-light btn-lg disabled" style="background: white">
           <div class="container-fluid">
               <div class="navbar-header">
                   <img src="img/LogoSS.jpg" style="width: 130px; height: auto"/>
               </div>
               <ul class="nav navbar-nav mr-auto mt-2 mt-lg-0">
                   <li class="nav-item"><a class="nav-link" href="MenuPaciente.jsp">Inicio</a></li>
                   <li class="nav-item active"><button class="nav-link btn btn-info" href="Controlador?metodo=buscarperfilpaciente&id=<%= p.getNrodocumpaciente()%>">Perfil</a></li>
                   <li class="nav-item"><a class="nav-link" href="#">Citas médicas</a></li>
                   <li class="nav-item"><a class="nav-link" href="">Reprogramar citas</a></li>
                   <li class="nav-item"><a class="nav-link" href="Controlador?metodo=downloadexammedico&id=<%= p.getNrodocumpaciente()%>">Examenes Medicos</a></li>
                   <li class="nav-item"><a class="nav-link" href="#">Recetas médicas</a></li>
               </ul>
               <ul class="nav navbar-nav navbar-right">
                   <li style="margin-top: 10px">Bienvenido(a) <%= p.getNompaciente()%> <%= p.getApepaciente()%></li>
                   <li class="btn btn-outline-danger btn-sm" style="margin-left: 20px; font-size: medium"><a class="nav-link" href="IngresoPaciente.jsp">Cerrar sesión</a></li>
               </ul>
           </div>
       </nav>
               
       <div class="container-fluid" style="margin-left: 30px; align-content: space-between">
           <form  method="post">
               <div class="profile-img">
                   <img style="margin-left: 15px" width="250" height="205" class="rounded float-center" src="Recursos/imagenespaciente/<%= p.getFotopaciente()%>" alt=""/> <br><br><br>
               </div>
               <div class="form-group">
                   <label>Nombres</label>
                   <input style="margin-left: 19px" type="text" disabled="disabled" name="nombre_apellido" value="<%= p.getNompaciente()%>">
               </div>
               
               <div class="form-group">
                   <label>Apellidos</label>
                   <input style="margin-left: 19px" type="text" disabled="disabled" name="nombre_apellido" value="<%= p.getApepaciente()%>">
               </div>
               
               <div class="form-group">
                   <label>Telefono</label>
                   <input style="margin-left: 23px" type="text" disabled="disabled" name="telefono" value="<%= p.getTelefpaciente()%>">
               </div>

               <div class="form-group">
                   <label>Dirección</label>
                   <input style="margin-left: 19px" type="email"  disabled="disabled" name="direccion" value="<%= p.getDirecpaciente()%>" >
               </div>
               
               <div class="form-group">
                   <label>Nacimiento</label>
                   <input style="margin-left: 5px" type="text"  disabled="disabled" name="nacimiento" value="<%= p.getFnacipaciente()%>">
               </div>

               <div>
                   <label>Sexo</label>
                   <input style="margin-left: 53px" type="text" disabled="disabled" name="sexo" value="<%= p.getSexopaciente()%>">
               </div>
           </form>        
        </div> 
   </body>
</html>