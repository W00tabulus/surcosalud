<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidad.Paciente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="Recursos/css_boot/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="Recursos/css/estilos.css" rel="stylesheet" type="text/css"/>
         <link href="Recursos/css/estilo2.css" rel="stylesheet" type="text/css"/>
        <title>Actualizar Cliente</title>
    </head>
    <body>
    <center>
        <h1><b>Actualiza tu Perfil</b></h1>
        <br>
    </center>

    <% Paciente a = (Paciente) request.getAttribute("dataclibusq");%>

        <form action="Controlador?metodo=actualizarpaciente" method="post">
            <input type="hidden" name="metodo" value="actualizarpaciente">
            <input type="hidden" name="id" value="<%= a.getNrodocumpaciente()%>">
            <center>
            <table CELLPADDING='10' cellspacing='10' border="0" style="background-color:  #AEEA8E ">
                <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><b>Nombre</b></td>
                    <td><input type="text" name="nombrep" value="<%= a.getNompaciente()%>"></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <tr><td>&nbsp;</td></tr>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><b>Apellidos &nbsp;&nbsp;&nbsp;</b></td>
                    <td><input type="text" name="apellidop" value="<%= a.getApepaciente()%>"></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <tr><td>&nbsp;</td></tr>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><b>Telefono</b></td>
                    <td><input type="text" name="telefonop" value="<%= a.getTelefpaciente()%>"></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <tr><td>&nbsp;</td></tr>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><b>Direccion</b></td>
                    <td><input type="text" name="direccionp" value="<%= a.getDirecpaciente()%>"></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <tr><td>&nbsp;</td></tr>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><center><input type="submit" value="enviar" class="btn btn-primary"></center></td>
                    <td><center><input type="reset" value="borrar" class="btn btn-danger"></center></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <tr><td>&nbsp;</td></tr>
                </tr>
            </table>
            </center>
        </form>
    </body>
</html>
