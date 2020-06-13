<%-- 
    Document   : cabecera
    Created on : 13-sep-2018, 23:38:42
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="../Recursos/css_boot/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <title>Banner Principal</title>
        
    </head>
    <body>
        <%--cabecera--%>
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
                            
                            <img src="../Recursos/imagenes/1.jpg" class="img-responsive" alt=""/>
                            <div class="carousel-caption">
                                <h3>Ya empezamos!!</h3>
                                
                            </div>
                        </div>
                         <div class="item">
                             
                             <img src="../Recursos/imagenes/2.jpg" class="img-responsive" alt=""/>
                            <div class="carousel-caption">
                                <h3>Buenos Profesores</h3>
                            </div>
                        </div>
                         <div class="item">
                             <img src="../Recursos/imagenes/3.png" class="img-responsive" alt=""/>
                            <div class="carousel-caption">
                                <h3>Libera tu Imaginacion</h3>
                            </div>
                        </div>
                         <div class="item">
                           
                             <img src="../Recursos/imagenes/4.jpg" class="img-responsive" alt=""/>
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
                <%--cabecera--%>
       <%-- <div>
            <header><center>
                <img src="Resources/imagenes/banner.png" alt="" height="300px" width="1190"/>
                </center></header>
        </div>--%>
        
       
       <script src="../Recursos/js/jquery-latest.js" type="text/javascript"></script>
       <script src="../Recursos/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
