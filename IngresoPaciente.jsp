<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Recursos/css/estiloIndex.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <title>Inicio de Sesión</title>
    </head>
    
    <body>
        <center>
            <div class="btn-group" role="group" aria-label="Basic example" style="margin-top: 20px">
                <button class="btn btn-info" disabled="">Paciente</button>
                <a href="IngresoDoctor.jsp" class="btn btn-outline-info">Doctor</a>
                <a href="IngresoRecep.jsp" class="btn btn-outline-info">Recepcionista</a>
            </div>
        </center>
    <br>
        <div align="center">
              <form class="form-control" style="width: 320px; height: 400px" action="Controlador?metodo=validarpaci" method="post">
                  <input type="hidden" name="metodo" value="validarpaci">
                  <img src="img/LogoSS.jpg" height="100" width="250"/>
                  <label style="margin-bottom: 25px">Bienvenido(a) a Surco Salud!</label>
                    <div class="form-group">
                        <input type="text" name="usuariop" class="form-control" placeholder="INGRESE NÚMERO DE DNI">
                    </div>
                    <div class="form-group">
                        <input type="password" name="clavep" class="form-control" placeholder="INGRESE CONTRASEÑA">
                    </div>
                      <br>
                      <div class="form-group">
                        <input type="submit" value="INGRESAR" class="btn btn-success"><br><br>
                    </div>
                    
             </form>
        </div>
    </body>
     <%@include file="comunes/piepagina.jsp" %>
</html>
