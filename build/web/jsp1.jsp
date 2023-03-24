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
        <div class="p-3 mb-2 bg-primary text-white">
            <h1>Números aleatorios</h1>
        </div> 
        <br>

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

        <br><br><br>
        <div class="container-fluid">
        <a href="jsp2.jsp" style="margin-left: 10%">Ir a Tabla de datos</a>
        <br><br>
        <a href="jsp3.jsp" style="margin-left: 10%">Ir a Formulario</a>
        </div>
    </body>
</html>