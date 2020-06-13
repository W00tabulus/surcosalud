<%@page import="entidad.Doctor"%>
<%@page import="entidad.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <title>::PACIENTES::</title>
       <link href="Recursos/css/estiloIndex.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
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
             <ul class="nav navbar-nav navbar-right">
        
        <%
            Paciente u = (Paciente) request.getAttribute("data");
        %>
        <%
            HttpSession misession = request.getSession();
            String userdoctor = (String)misession.getAttribute("idDoc");
        %>
       <li class="btn btn-outline-danger btn-sm" style="margin-left: 20px; font-size: medium"><a class="nav-link" href="IngresoDoctor.jsp">Cerrar sesión</a></li>
             </ul>
           </div>
         </nav>
      
        <br>
        <div class="container">        
            <form class="form-inline" action="Controlador?metodo=buscarpacienteExamMedico" method="post">
                <input type="hidden" name="metodo" value="buscarpacienteExamMedico">
                <input type="hidden" name="id" > 
                <div align="right">
                    <h3>Pacientes Registrados</h3><br>
                    INGRESE DNI DEL PACIENTE :
                    <input type="text" name="valor"  class="form-control">
                    <input type="submit" value="BUSCAR" class="btn btn-primary">
                </div>
            </form>  
             <hr>         
            <form class="form_reg" action="Controlador" name="metodo" method="post" enctype="multipart/form-data">
                <input type="hidden" name="metodo" value="uploadexammedico">
                <table class="table table-bordered" ALIGN="left">
                    <thead class="thead-dark">
                    <tr>
                        <th class="text-center">DNI</th>
                        <th class="text-center">PACIENTE</th>
                        <th class="text-center">CODIGO DE DR</th>
                        <th class="text-center">F. DE EXAMEN</th>
                        <th class="text-center">COMENTARIOS</th>
                        <th class="text-center">IMAGEN DE EXAMEN MEDICO</th>
                    </tr>
                    <tr>
                        <%
                            if (u != null) {
                                out.println("<td><input class='input' type='text' name='dnip' value=" + u.getNrodocumpaciente() + "></td>");
                                out.println("<td>" + u.getNompaciente() + " " + u.getApepaciente()+ "</td>");
                                out.println("<td><input class='input' type='text' name='userdoctor' value=" + userdoctor + "></td>");
                                out.println("<td><input class='input' type='date' name='fechaexam' placeholder='&#128222; Fecha de Examen'></td>");
                                out.println("<td><textarea name='textexamen' rows='4' cols='50' placeholder='Escribe los comentarios medicos...'></textarea></td>");
                                out.println("<td><input class='input' type='file' name='fotoexam'></td>");
                            }
                        %>                    
                    </tr>
                </table>
                <div class="btn_form">
                    <input class="btn btn-success" type="submit" value="GUARDAR">
                    <input class="btn btn-danger" type="reset" value="LIMPIAR">
                </div>
            </form> 
        </div>
    </body>
</html>
