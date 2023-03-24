<%-- 
    Document   : jsp2
    Created on : 18 mar. 2023, 20:58:11
    Author     : delar
--%>

<%@page import="java.util.List"%>
<%@page import="org.hoid.Datos"%>
<%@page import="org.hoid.Negocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="images/favicon.ico">
        <link rel="stylesheet" href="main.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <h1 class="p-3 mb-2 bg-info text-dark">Tabla de Datos</h1>
        </div>
        <%
            int i = 0;
            List<Datos> lista = null;
            String id = null;
            String borrar = null;
            session = request.getSession( true );
            
            if( session != null )
            {
                if( session.getAttribute("lista") != null )
                {
                    lista = (List)session.getAttribute( "lista" );
                }
            }
            id = request.getParameter( "id" );
            borrar = request.getParameter( "borrar" );
            if( "Submit".equals( borrar ) )
            {
                lista.remove( Integer.parseInt(id) );
            }
        %>
        <div class="container-fluid">
            <a href="jsp1.jsp">Regresar a Números aleatorios</a>
            <br><br>
            <a href="jsp3.jsp">Ir al formulario</a>
            <br><br>
        </div>
        <table class="table table-hover">
             <thead class="table-dark">
            <tr>
                <td>#</td>
                <td>Id</td>
                <td>Nombre</td>
                <td>Calificacion</td>
                <td>Contraseña</td>
                <td>Correo</td>
                <td>Sexo</td>
                <td>Nacimiento</td>
                <td>Color fav</td>
                <td>Instagram</td>
                <td>Pdf Datos</td>
                <td>Acciones</td>
            </tr>
            </thead>
            <%
              if( lista != null && !lista.isEmpty() )
              {
                for( Datos datos : lista)
                {
            %>
            <tr>
                <td><%=i + 1%></td>
                <td><%=i%></td>
                <td><%=datos.getNombre( )%></td>
                <td><%=datos.getCalificacion()%></td>
                <td><%=datos.getContraseña()%></td>
                <td><%=datos.getCorreo()%></td>
                <td><%=datos.getSexo()%></td>
                <td><%=datos.getFecha()%></td>
                <td><%=datos.getColor()%></td>
                <td><%=datos.getInsta()%></td>
                <td><%=datos.getPdf()%></td>
           
                <td>
                    <a href="jsp2.jsp?id=<%=i%>&borrar=Submit">Borrar</a> 
                    <a href="jsp3.jsp?id=<%=i++%>&editar=Submit">Editar</a> 
                </td>
            </tr>
            <%
                }
              }
            %>
        </table>
    </body>
</html>
