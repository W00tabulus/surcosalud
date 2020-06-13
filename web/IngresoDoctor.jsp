<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Recursos/css/estiloIndex.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <title>Inicio de sesión - Doctores</title>
    </head>
   
    <body>
        <center>
            <div class="btn-group" role="group" aria-label="Basic example" style="margin-top: 20px">
                <a href="IngresoPaciente.jsp" class="btn btn-outline-info">Paciente</a>
                <button class="btn btn-info" disabled="">Doctor</button>
                <a href="IngresoRecep.jsp" class="btn btn-outline-info">Recepcionista</a>
            </div>
        </center>
    <br>
        <div align="center">
            
              <form class="form-control" style="width: 320px; height: 400px" action="Controlador?metodo=validardoctor" method="post">
                  <input type="hidden" name="metodo" value="validardoctor">
                      <img src="img/logo.png" height="150" width="150" /><br><br>
                      <label style="margin-bottom: 25px">Bienvenido(a) a Surco Salud!</label>
                    <div class="form-group">
                        <input type="text" name="usuariod" class="form-control" placeholder="INGRESE USUARIO">
                    </div>
                    <div class="form-group">
                        <input type="password" name="claved" class="form-control" placeholder="INGRESE CONTRASEÑA">
                    </div>
                    <input type="submit" value="INGRESAR" class="btn btn-success"><br><br>
             </form>
        </div>
    </body>
    <%@include file="comunes/piepagina.jsp" %>
</html>
