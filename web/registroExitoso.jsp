<%-- 
    Document   : registroExitoso
    Created on : 25-jun-2019, 13:18:15
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="Recursos/css_boot/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="Recursos/js/jquery-latest.js" type="text/javascript"></script>
        <script src="Recursos/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="Recursos/css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="Recursos/css/estilo2.css" rel="stylesheet" type="text/css"/>
        <title>Registro Existoso</title>
    </head>
    <body>
        <br/><br/><br/><br/><br/>
        <table border="0" width="100%" >
            <tr bgcolor="white" align="center">
                <td>
                    <img src="Recursos/imagenes/nombreempresa.png" alt="" width="300" height="75" />
                    
                </td>
            </tr>
        </table>
        <br/>
        
       <%-- cabecera --%>
         <div class="container">
            <br/>
            <div class="col-md-12">
                <div id="carousel-1" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-1" data-slide-to="1"></li>
                        <li data-target="#carousel-1" data-slide-to="2"></li>
                        <li data-target="#carousel-1" data-slide-to="3"></li>
                        
                    </ol>
                    
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="Recursos/imagenes/1.jpg" class="img-responsive" alt=""/>
                           
                            <div class="carousel-caption">
                                <h3>Ya empezamos!!</h3>
                                
                            </div>
                        </div>
                         <div class="item">
                             <img src="Recursos/imagenes/2.jpg" class="img-responsive" alt=""/>
                            <div class="carousel-caption">
                                <h3>Buenos Profesores</h3>
                            </div>
                        </div>
                         <div class="item">
                             <img src="Recursos/imagenes/3.png" class="img-responsive" alt=""/>
                            
                            <div class="carousel-caption">
                                <h3>Libera tu Imaginacion</h3>
                            </div>
                        </div>
                         <div class="item">
                             <img src="Recursos/imagenes/4.jpg" class="img-responsive" alt=""/>
                            <div class="carousel-caption">
                                <h3> Aprende</h3>
                            </div>
                        </div>
                        
                    </div>
                 
                    
                    <a href="#carousel-1" class="left carousel-control" role="button" data-slide="prev">
                        
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        
                        
                    </a>
                    <a href="#carousel-1" class="right carousel-control" role="button" data-slide="next">
                        
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>                        
                    </a>                   
                </div>
            </div>
            
        </div>
         <%-- cabecera --%>
        
        <%@include file="comunes/Menu.jsp" %>
        
        <center>  
           
            <div class="alert alert-success" role="alert">
  <h4 class="alert-heading">Registrado!</h4>
  <p>Bienvenido al Portal de Tutoria para Niños  <hr>
  <p class="mb-0">Siga en nuestra pagina para poder encontrar novedades</p>
</div>
             
        </center><br>
    <%@include file="comunes/piepagina.jsp" %>
    <br></body>
</html>

