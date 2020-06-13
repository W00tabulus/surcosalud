<%-- 
    Document   : crearCuenta
    Created on : Oct 8, 2018, 2:31:39 AM
    Author     : gusta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/ccs?family=Lato:400,900" rel="stylesheet">
        <link rel="stylesheet" href="css/estilos.css">
        <title>Crear una nueva cuenta</title>
        <script> 
                  function comprobarClave(){ 
   	contrasena = document.metodo.contrasena.value 
   	contrasena2 = document.metodo.contrasena2.value 

   	if (contrasena == contrasena2) 
      	alert("Tu cuenta ha sido registrada")
   	else 
      	alert("Las contraseñas no coinciden, volver a escribirlas")
                   } 
        </script>
    </head>
    <body>
        
        <div class="reg_container">
            <div class="login_top">
                <h2 class="login_title">Genera tu <span>Registro</span></h2>
            </div>
            <form class="form_reg" action="Controlador" name="metodo" method="post" enctype="multipart/form-data">
                <input type="hidden" name="metodo" value="registrarecep">
                <input class="input" type="text" name="userrecep" placeholder="&#127891; Codigo de Recepcionista" required>
                <input class="input" type="password" name="contrasena" placeholder="&#x1F512; password" required="">
                <input class="input" type="password" name="contrasena2" placeholder="&#x1F512; Confirmar Password" required="">
                <input class="input" type="text" name="nombrer" placeholder="&#128100; Nombre" required autofocus>
                <input class="input" type="text" name="apellidor" placeholder="&#128100; Apellido" required>
                <input class="input" type="text" name="telefonor" placeholder="&#128100; Celular" required>
                <select class="input" name="sexor" required >
                    <option selected>Elige tu sexo</option>
                    <option>Masculino</option>
                    <option>Femenino</option>
                </select>
                <input class="input" type="file" name="fotor" value="fotor" required>
                
                
                
                <div class="btn_form">
                    <input class="btn_registrar" type="submit" value="REGISTRAR" onClick="comprobarClave()">
                    <input class="btn_reset" type="reset" value="LIMPIAR">
                    
                </div>
            </form>
            
        </div>
        
    </body>
</html>
