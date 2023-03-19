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
        <link rel="stylesheet" href="Style.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- TÍTULO -->
        <h1 class="p-3 mb-2 bg-info text-dark">
            Números aleatorios</h1> 
        <br>

        <!-- CONTENIDO -->
        <p style="margin-left: 10%">Ingresa en la URL para editar la cantidad de números a generar</p>
        <p style="margin-left: 10%">Ejemplo: http://localhost:8080/WebApplicationjsp/jsp1.jsp?numero=1</p> <br>

        <p style="margin-left: 10%">Cantidad de números:</p>
        <h2 style="margin-left: 20%"><%=request.getParameter("numero") == null? "Sin Dato" : request.getParameter("numero") %></h2>

        <h3 style="margin-top: 4%; margin-left: 10%">Números generados</h3> <br>
        <% 
            if(request.getParameter("numero") != null) {
                int arreglo[] = new int[Integer.parseInt(request.getParameter("numero"))];
                for (int i = 0; i < Integer.parseInt(request.getParameter("numero")); i++) {
                    arreglo[i]= (int)((Math.random())*200);
                    if(arreglo[i] > 50) {
        %>
        <h4 style="margin-left: 20%"><%=arreglo[i] %> es mayor a 50</h4>
        <%
                    }
                    else {
        %>
        <h4 style="margin-left: 20%"><%=arreglo[i] %> es menor a 50</h4>
        <%
                    }
                }
            }
            else {
        %>
        <h4 style="margin-left: 20%">Los números apareceran aqui</h4>
        <%
            }
        %>

        <br>
        <a href="jsp2.jsp" style="margin-left: 10%">Ir a JSP2</a>
    </body>
</html>