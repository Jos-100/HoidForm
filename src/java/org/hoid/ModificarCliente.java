/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.hoid;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author delar
 */
@WebServlet(name = "ModificarCliente", urlPatterns = {"/ModificarCliente"})
public class ModificarCliente extends HttpServlet {
    private int idx;
    Cliente cliente = new Cliente();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = null;
        List<Cliente> usuarios = null;
        session = request.getSession();
        usuarios = (List<Cliente>) session.getAttribute("usuarios"); 
        
        idx = Integer.parseInt(request.getParameter("boleta"));
        cliente = usuarios.get(idx);
        
        
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ModificarCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            String accion = request.getParameter("guardar");
            if(accion != null && "Guardar".equals(accion) )
            {
                guardaCliente( request );
            }
            else
            {
                imprimirFormulario( out );
            }
            out.println("<a href=\"ClienteList\">Lista de clientes</a>");
            out.println("</body>");
            out.println("</html>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    public void imprimirFormulario( PrintWriter out )
    {
        
        
        out.println("<form id=\"form1\">");
        out.println("<table border=\"1\">");
        out.println("<tr>");
        out.println("<td>Boleta</td><td>");
        out.println("<input id=\"boleta\" name=\"boleta\" type=\"text\" />");
        out.println("</td>");
        out.println("<tr>");
        out.println("<td>Nombre</td><td>");
        out.println("<input id=\"nombre\" name=\"nombre\" type=\"text\" />");
        out.println("</td>");
        out.println("<tr>");
        out.println("<td>Apellido Paterno</td><td>");
        out.println("<input id=\"apellidoP\" name=\"apellidoP\" type=\"text\" />");
        out.println("</td>");
        out.println("<tr>");
        out.println("<td>Apellido Materno</td><td>");
        out.println("<input id=\"apellidoM\" name=\"apellidoM\" type=\"text\" />");
        out.println("</td>");
        out.println("<tr>");
        out.println("<td>Edad</td><td>");
        out.println("<input id=\"edad\" name=\"edad\" type=\"number\" />");
        out.println("</td>");
        out.println("<tr>");
        out.println("<td>Contraseña</td><td>");
        out.println("<input id=\"contraseña\" name=\"contraseña\" type=\"password\" />");
        out.println("</td>");
        out.println("<tr>");
        out.println("<td>Calificación</td><td>");
        out.println("<input id=\"calificación\" name=\"calificación\" type=\"number\" />");
        out.println("</td>");
        out.println("<tr>");
        out.println("<td>Correo</td><td>");
        out.println("<input id=\"correo\" name=\"correo\" type=\"email\" />");
        out.println("</td>");
        out.println("<tr>");
        out.println("<td>Sexo</td><td>");
        out.println("<input id=\"sexo\" name=\"sexo\" type=\"text\" />");
        out.println("</td>");
        out.println("<tr>");
        out.println("<td colspan=\"2\"><input id=\"guardar\" name=\"guardar\" value=\"Guardar\"  type=\"submit\" /></td>");
        out.println("</tr>");
        out.println("</table>");
        out.println("</form>");   
        out.println("<br><a href=\"http://localhost:8080/HoidForm/ClienteList\">ABC Servlet</a>");
    }

    private void guardaCliente(HttpServletRequest request) 
    {
        Cliente cliente = new Cliente( );
        List<Cliente>list = null;
        cliente.setBoleta(getCampoInteger(request.getParameter("boleta")));
        cliente.setNombre(request.getParameter("nombre"));
        cliente.setApellidoP(request.getParameter("apellidoP"));
        cliente.setApellidoM(request.getParameter("apellidoM"));
        cliente.setEdad(getCampoInteger(request.getParameter("edad")));
        cliente.setContraseña(request.getParameter("contraseña"));
        cliente.setCalificacion(getCampoInteger(request.getParameter("calificación")));
        cliente.setCorreo(request.getParameter("correo"));
        cliente.setSexo(request.getParameter("sexo"));
        
        if( cliente.getApellidoM( ) == null || cliente.getApellidoP() == null ||
            cliente.getNombre() == null || cliente.getEdad() == null 
            || cliente.getBoleta() == null || cliente.getContraseña() == null
            || cliente.getSexo() == null || cliente.getCorreo() == null || cliente.getCalificacion() == null)
        {
            return;
        }
        list = (List<Cliente>) request.getSession().getAttribute("clientes");
        if( list == null )
        {
            list = new ArrayList<>();
            request.getSession().setAttribute("clientes", list);
        }
        list.add(cliente);
        
    }
    
    private Integer getCampoInteger( String parametro )
    {
        try
        {
            return Integer.valueOf(parametro);
        }
        catch(NumberFormatException ex)
        {
            return  null;
        }
    }
    private void redireccionar( PrintWriter out ) {
        out.print("<h3 style=\"margin-left: 20%; margin-top: 4%\">Registro exitoso</h3>");
        out.print("<a href=\"ClienteList\" style=\"margin-left: 20%\">Ir a la lista</a>");
    }

}
