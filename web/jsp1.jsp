<%-- 
    Document   : jsp1
    Created on : 18 mar. 2023, 20:57:15
    Author     : delar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="images/favicon.ico">
        <link rel="stylesheet" href="main.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- TÍTULO -->
        <div class="p-3 mb-2 bg-success text-white">
            <h1>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                Números aleatorios
            </h1>
        </div> 
        <br>
        <hr>
        <nav class="nav nav-pills nav-fill">
            <a class="nav-link active" aria-current="page" href="jsp1.jsp">Números Aleatorios</a>
            <a class="nav-link" href="jsp2.jsp">Tabla de Datos</a>
            <a class="nav-link" href="jsp3.jsp">Formulario</a>
            <a class="nav-link" href="ABC1.jsp" tabindex="-1" aria-disabled="true">Inicio</a>
        </nav>
        <hr>
        <br><br>
        <!-- CONTENIDO -->
        <div class="container-fluid"> 
            <span class="border border-black">
                Ingresa en la URL para editar la cantidad de números a generar
            </span>
        </div>
        <br>
        
        <div class="container-fluid">
            Ejemplo: http://localhost:8080/WebApplicationjsp/jsp1.jsp?numero=1
            <br><br>
        </div>
        <br><br>
        <div class="container-fluid">
            Cantidad de números:
            <h2 style="margin-left: 20%"><%=request.getParameter("numero") == null? "Sin Dato" : request.getParameter("numero") %></h2>
            <h3 style="margin-top: 4%; margin-left: 10%">Números generados</h3> <br>
        </div>
        
        <% 
            if(request.getParameter("numero") != null) {
                int arreglo[] = new int[Integer.parseInt(request.getParameter("numero"))];
                for (int i = 0; i < Integer.parseInt(request.getParameter("numero")); i++) {
                    arreglo[i]= (int)((Math.random())*200);
                    if(arreglo[i] > 50) {
        %>
        <div class="container-fluid">
            <h4 style="margin-left: 20%"><%=arreglo[i] %> es mayor a 50</h4>
        </div>
        <%
                    }
                    else {
        %>
        <div class="container-fluid">
            <h4 style="margin-left: 20%"><%=arreglo[i] %> es menor a 50</h4>
        </div>
        <%
                    }
                }
            }
            else {
        %>
        <div class="container-fluid">
            <h4 style="margin-left: 20%">Los números apareceran aqui</h4>
        </div>    
        <%
            }
        %>

        <div class="container" style="margin-top: 4%; margin-left: 10%; margin-right: 10%">
          
            <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
                <div class="col-md-4 d-flex align-items-center">
                    <a href="https://github.com/Jos-100">
                        <img src= "imagenes/Git.png" width="121" height="121" class="img-fluid" alt="Logo">
                    </a>
                    <span class="mb-3 mb-md-0 text-muted">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        &nbsp&nbsp&nbsp&nbsp&nbsp
                        &copy; 2023 Hoid was here &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                </div>
            
                <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
                    <li class="ms-3"><a class="text-muted" href="https://instagram.com/delarivajosue?igshid=NTdlMDg3MTY=">
                        <img src= "imagenes/Ins.png" width="70" height="70" class="img-fluid" alt="Instagram">
                </ul>
            </footer>
        </div>
        
    </body>
</html>