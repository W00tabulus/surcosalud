<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Recursos/css/estiloIndex.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <title>Inicio de Sesión - Recepcionista</title>
    </head>
    
    <body>
        <center>
            <div class="btn-group" role="group" aria-label="Basic example" style="margin-top: 20px">
                <a href="IngresoPaciente.jsp" class="btn btn-outline-info">Paciente</a>
                <a href="IngresoDoctor.jsp" class="btn btn-outline-info">Doctor</a>
                <button class="btn btn-info" disabled="">Recepcionista</button>
            </div>
        </center>
    <br>
        <div align="center">           
              <form class="form-control" style="width: 320px; height: 400px" action="Controlador?metodo=validarrecep" method="post">
                  <input type="hidden" name="metodo" value="validarrecep">
                  <img src="img/recepcionista.jpg" height="162" width="auto" style="margin-bottom: 10px"/>
                  <label style="margin-bottom: 25px">Bienvenido(a) a Surco Salud!</label>
                    <div class="form-group">
                        <input type="text" name="usuarior" class="form-control" placeholder="INGRESE USUARIO">
                    </div>
                    <div class="form-group">
                        <input type="password" name="claver" class="form-control" placeholder="INGRESE CONTRASEÑA">
                    </div>
                    <input type="submit" value="INGRESAR" class="btn btn-success"><br><br>
             </form>
        </div>
    </body>
    <%@include file="comunes/piepagina.jsp" %>
</html>
