<%@page import="entidad.ExamMedicos"%>
<%@page import="entidad.Doctor"%>
<%@page import="entidad.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Recursos/css/estiloIndex.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <title>Ver exámenes médicos</title>
        <%
           Paciente p = (Paciente) session.getAttribute("idPro");
       %>
        <nav class="navbar navbar-expand navbar-light btn-lg disabled" style="background: white">
           <div class="container-fluid">
               <div class="navbar-header">
                   <img src="img/LogoSS.jpg" style="width: 130px; height: auto"/>
               </div>
               <ul class="nav navbar-nav mr-auto mt-2 mt-lg-0">
                   <li class="nav-item"><a class="nav-link" href="MenuPaciente.jsp">Inicio</a></li>
                   <li class="nav-item"><a class="nav-link" href="Controlador?metodo=buscarperfilpaciente&id=<%= p.getNrodocumpaciente()%>">Perfil</a></li>
                   <li class="nav-item"><a class="nav-link" href="#">Citas médicas</a></li>
                   <li class="nav-item"><a class="nav-link" href="">Reprogramar citas</a></li>
                   <li class="nav-item"><a class="nav-link" href="Controlador?metodo=downloadexammedico&id=<%= p.getNrodocumpaciente()%>">Exámenes Medicos</a></li>
                   <li class="nav-item"><a class="nav-link" href="#">Recetas médicas</a></li>
                  
               </ul>
               <ul class="nav navbar-nav navbar-right">
                   <li style="margin-top: 10px">Bienvenido(a) <%= p.getNompaciente()%> <%= p.getApepaciente()%></li>
                   <li class="btn btn-outline-danger btn-sm" style="margin-left: 20px; font-size: medium"><a class="nav-link" href="IngresoPaciente.jsp">Cerrar sesión</a></li>
               </ul>
           </div>
       </nav>
    </head>
    
    <body>
       
        <br>
        <div class="container">        
            <form class="form-inline" action="Controlador?metodo=downloadexammedico" method="post">
                <input type="hidden" name="metodo" value="downloadexammedico">
                <input type="hidden" name="id" >

                <div align="center">
                    <h3>Examenes Medicos Realizados</h3><br>
                    INGRESE LA FECHA DEL EXAMEN MEDICO :
                    <input type="date" name="valor"  class="form-control">
                    <input type="submit" value="BUSCAR" class="btn btn-primary">
                </div>
            </form>  
            <a href="Controlador?metodo=listaexammedico" class="btn btn-success btn-lg">VER LISTA COMPLETA</a>
            <hr>
            <table class="table table-bordered">
                <thead class="thead-dark">
                <tr>
                    <th class="text-center">DOCTOR</th>
                    <th class="text-center">F. DE EXAMEN</th>
                    <th class="text-center">COMENTARIOS</th>
                    <th class="text-center">IMAGEN DE EXAMEN MEDICO</th>
                    <th class="text-center" colspan="2" >OPCIONES</th>
                </tr>
               
                    <%
                        List<ExamMedicos> data = (List<ExamMedicos>) request.getAttribute("data");
                        Doctor d = null;
                        if (data != null) {
                            for (ExamMedicos x : data) {
                                d = x.getDoctor();
                            out.println("<tr>");
                            out.println("<td>" + d.getApedoctor() + "</td>");
                            out.println("<td>" + x.getFechaexam() + "</td>");
                            out.println("<td>" + x.getDescexam() + "</textarea></td>");
                            out.println("<td><img width='150' height='170' src='Recursos/examenesmedicos/" + x.getFotoexam() + "'></td>");
                            out.println("<td><a class='btn btn-warning btn-sm' href='Recursos/examenesmedicos/"+ x.getFotoexam()+"' download='Examen Medico'>Descargar</a></td>");
                            out.println("<td><a class='btn btn-danger btn-sm' href='Controlador?metodo=eliminarexammedico&id=" + x.getCodexamen() + "'>Eliminar</a></td>");
                            out.println("</tr>");
                            }
                        }
                    %>                   
               
            </table>
            
        </div>
    </body>
</html>