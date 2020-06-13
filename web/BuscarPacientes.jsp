<%@page import="entidad.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::PACIENTES::</title>
    </head>
    <link href="Recursos/css/estiloIndex.css" rel="stylesheet" type="text/css"/>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <body>
       
        <%
            Paciente u = (Paciente) request.getAttribute("data");
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
               <li style="margin-top: 10px">Bienvenido(a)</li>
               <li class="btn btn-outline-danger btn-sm" style="margin-left: 20px; font-size: medium"><a class="nav-link" href="IngresoRecep.jsp">Cerrar sesión</a></li>
             </ul>
           </div>
         </nav>
        
        <br>
        <div class="container">        
            <form class="form-inline" action="Controlador?metodo=buscarpaciente" method="post">
                <input type="hidden" name="metodo" value="buscarpaciente">
                <input type="hidden" name="id" >
                    
                <div align="center">
                    <h3>Pacientes Registrados</h3><br>
                    INGRESE DNI DEL PACIENTE :
                    <input type="text" name="valor"  class="form-control">
                    <input type="submit" value="BUSCAR" class="btn btn-primary">

                </div>
            </form>  
           <a href="crearCuentaPaciente.jsp" class="btn btn-success btn-lg">+</a>
            <hr>          
            <table class="table table-bordered">
                <tr>
                    <th class="text-center">DNI</th>
                    <th class="text-center">NOMBRES</th>
                    <th class="text-center">APELLIDOS</th>
                    <th class="text-center">CELULAR</th>
                    <th class="text-center">DIRECCION</th>
                    <th class="text-center">F. NACIMIENTO</th>
                    <th class="text-center">SEXO</th>
                    <th class="text-center">FOTO</th>
                    <th class="text-center" colspan="2" >OPCION</th>
                </tr>
                <tr>
                    <%
                    if(u != null)
                    {
                       out.println("<td>"+u.getNrodocumpaciente()+"</td>");
                       out.println("<td>"+u.getNompaciente()+"</td>");
                       out.println("<td>"+u.getApepaciente()+"</td>");
                       out.println("<td>"+u.getTelefpaciente()+"</td>");
                       out.println("<td>"+u.getDirecpaciente()+"</td>");
                       out.println("<td>"+u.getFnacipaciente()+"</td>");
                       out.println("<td>"+u.getSexopaciente()+"</td>");
                       out.println("<td><img width='150' height='170' src='Recursos/imagenespaciente/"+u.getFotopaciente()+"'></td>");
                       out.println("<td><a class='btn btn-warning btn-sm' href='Controlador?metodo=buscaeditperfilpaci&id="+ u.getNrodocumpaciente()+"'>Editar</a></td>");
                       out.println("<td><a class='btn btn-danger btn-sm' href='Controlador?metodo=eliminarpaciente&id="+ u.getCodpaciente()+"'>Eliminar</a></td>");
                    }
                    %>                    
                </tr>
            </table>
        </div>
    </body>
</html>

