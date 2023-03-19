<%-- 
    Document   : jsp3
    Created on : 18 mar. 2023, 20:58:42
    Author     : delar
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hoid.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="images/favicon.ico">
        <link rel="stylesheet" href="style.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="p-3 mb-2 bg-info text-dark">Formulario</h1>
        <%
            String nombre = null;
            String calificacion = null;
            String contraseña = null;
            String correo = null;
            String guardar = null;
            String id = null;
            String editar = null;
            String sexo = null;
            String fecha = null;
            String color = null;
            String insta = null;
            String pdf = null;
            String accion = "guardar";
            String actualizar = "guardar";
            Datos datos = null;
            Integer idx = null;
            List<Datos>lista = null;
            
            session = request.getSession( true );
            if( session != null )
            {
                if( session.getAttribute("lista") == null )
                {
                    session.setAttribute("lista", new ArrayList<Datos>());
                }
                lista = (List)session.getAttribute("lista");
            }
            nombre = request.getParameter( "nombre" );
            calificacion = request.getParameter( "calificacion" );
            contraseña = request.getParameter( "contraseña" );
            correo = request.getParameter( "correo" );
            sexo = request.getParameter( "sexo");
            fecha = request.getParameter( "fecha");
            color = request.getParameter( "color" );
            insta = request.getParameter( "insta" );
            pdf = request.getParameter( "pdf" );
            guardar = request.getParameter( "guardar" );
            id = request.getParameter( "id" );
            editar = request.getParameter( "editar" );
            actualizar = request.getParameter( "actualizar" );
            
            if( "Submit".equals( editar ) )
            {
                idx = Integer.parseInt( id );
                if( idx < lista.size() )
                {
                    datos = lista.get( idx );
                }
                accion = "actualizar";
            }
            
            if( "Submit".equals( guardar ) || "Submit".equals( actualizar ) )
            {
                if( "Submit".equals( guardar ) )
                {
                    datos = new Datos( );
                }
                else
                {
                    datos = lista.get( Integer.parseInt( id ) );
                }
                datos.setNombre(nombre);
                datos.setCalificacion( Float.parseFloat( calificacion ) );
                datos.setContraseña(contraseña);
                datos.setCorreo(correo);
                datos.setSexo(sexo);
                datos.setFecha(fecha);
                datos.setColor(color);
                datos.setInsta(insta);
                datos.setPdf(pdf);
                if( "Submit".equals( guardar ) )
                {
                    lista.add( datos );
                }
        %>
                <h1>EXITO!</h1>
                <script>
                    console.log("Todo se envió correctamente");
                </script>
                <a href="jsp2.jsp">Ir a jsp2 </a>
        <%
            }
            if( datos == null )
            {
                datos = new Datos( );
                datos.setNombre( "" );
                datos.setCalificacion( 0f );
                datos.setContraseña( "" );
                datos.setCorreo( "" );
                datos.setSexo( "" );
                datos.setFecha( "" );
                datos.setColor( "" );
                datos.setInsta( "" );
                datos.setPdf( "" );

            }
            if( !"Submit".equals( guardar ) && !"Submit".equals( actualizar ) )
            {
        %>  
        <form id="form1">
            <table class="table table-striped">
                <tr>
                    <td>Nombre</td>
                    <td><input id="nombre" name="nombre" value="<%=datos.getNombre()%>" type="text"/></td>

                </tr>
                <tr>
                    <td>Calificación</td>
                    <td><input id="calificacion" name="calificacion" value="<%=datos.getCalificacion()%>" type="number"/></td>
                </tr>
                <tr>
                    <td>Contraseña</td>
                    <td><input id="contraseña" name="contraseña" value="<%=datos.getContraseña()%>" type="password"/></td>
                </tr>
                <tr>
                    <td>Sexo</td>
                    <td><input id="sexo" name="sexo" value="<%=datos.getSexo()%>" type="radio"/>Masculino
                    <input id="sexo" name="sexo" value="<%=datos.getSexo()%>" type="radio"/>Femenino</td>
                </tr>
                <tr>
                    <td>Correo</td>
                    <td><input id="correo" name="correo" value="<%=datos.getCorreo()%>" type="email"/></td>
                </tr>
                <tr>
                    <td>Fecha de nacimiento</td>
                    <td><input id="fecha" name="fecha" value="<%=datos.getFecha()%>" type="date"/></td>
                </tr>
                <tr>
                    <td>Color Favorito </td>
                    <td><input id="color" name="color" value="<%=datos.getColor()%>" type="color"/></td>
                </tr>
                <tr>
                    <td>Link de Perfil de Instagram </td>
                    <td><input id="insta" name="insta" value="<%=datos.getInsta()%>" type="url"/></td>
                </tr>
                <tr>
                    <td>Pdf de tus datos de identificación </td>
                    <td><input id="pdf" name="pdf" value="<%=datos.getInsta()%>" type="file"/></td>
                       
                        <%
                            if( "Submit".equals( editar ) )
                            {
                        %>
                                <input type="hidden" name="id" id="id" value="<%=id%>" />
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr >
                    <td colspan="2">
                        <input type="submit" id="Guardar" name="<%=accion%>" />
                    </td>
                </tr>
            </table>
        </form>
        <%
            }
        %>
    </body>
</html>
