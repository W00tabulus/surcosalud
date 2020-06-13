<!DOCTYPE html>
<%@page import="entidad.ExamMedicos"%>
<%@page import="entidad.Paciente"%>
<%@page import="entidad.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>CRUD BD Alumno</title>
    <%
           Paciente p = (Paciente) session.getAttribute("idPro");
       %>
    <link rel="stylesheet" type="text/css" href="css/mi_css.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="Recursos/css/estiloIndex.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    </head>
    <body>
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
                   <li style="margin-top: 10px">Bienvenido(a) </li>
                   <li class="btn btn-outline-danger btn-sm" style="margin-left: 20px; font-size: medium"><a class="nav-link" href="IngresoPaciente.jsp">Cerrar sesión</a></li>
               </ul>
           </div>
       </nav>
        <h3 align="center">Listado de Examenes Medicos</h3>       
        <br>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th class="text-center">NOMBRE DOCTOR</th>
                    <th class="text-center">DESCRIPCION</th>
                    <th class="text-center">FECHA</th>
                    <th class="text-center">IMAGEN DE EXAMEN MEDICO</th>
                    <th class="text-center" colspan="2" >OPCIONES</th>                   
                </tr>
            <%
                List<ExamMedicos> data = (List<ExamMedicos>) request.getAttribute("data");
                Doctor d = null;
                if (data != null) {
                    for (ExamMedicos x : data) {
                        d = x.getDoctor();
            %>
            <tr> 
                <td><%= d.getApedoctor()%> </td>
                <td><%= x.getDescexam()%></td>
                <td><%= x.getFechaexam()%></td>
                <td><img width="150" height="170" src="Recursos/examenesmedicos/<%= x.getFotoexam()%>" alt=""/></td>
                <td>
                    <a href="Recursos/examenesmedicos/<%= x.getFotoexam()%>" download="Examen Medico"><img alt="Descargar" src="img/download.gif"></a>		
                </td>
                <td>
                    <a href="Controlador?metodo=eliminarexammedico&id=<%= x.getCodexamen()%>">
                        <img alt="Eliminar" src="img/Delete.gif">
                    </a>		
                </td>			  		
            </tr>
            <%
                    }
                }
            %>
        </table>
    </body>
</html>