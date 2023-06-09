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
        <link rel="stylesheet" href="main.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <h1 class="p-3 mb-2 bg-info text-dark">
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                Formulario
            </h1>
            <br><br>
        </div>
        <br>
        <hr>
        <nav class="nav nav-pills nav-fill">
            <a class="nav-link active" aria-current="page" href="jsp3.jsp">Formulario</a>
            <a class="nav-link" href="jsp1.jsp">Números Aleatorios</a>
            <a class="nav-link" href="jsp2.jsp">Tabla de Datos</a>
            <a class="nav-link" href="ABC1.jsp" tabindex="-1" aria-disabled="true">Inicio</a>
        </nav>
        <hr>
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
             <div class="container-fluid">   
                 <h4>Todo se ha enviado correctamente</h4>
                 <br><br>
            </div>
                <script>
                    console.log("Todo se envió correctamente");
                </script>
            <div class="row" style="margin-left: 10%; margin-right: 10%; margin-top: 2%">
                <div class="col-sm-6 mb-3 mb-sm-0">
                   <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Menu ABC Bootstrap - JSP </h5>
                    <a href="ABC1.jsp" class="btn btn-primary">Ir</a>
                    </div>
                   </div>
                </div>
            </div>
        <br><br><br>
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
        
        <br><br><br>
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
