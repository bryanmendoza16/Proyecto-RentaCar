/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuarios;
import modelo.UsuariosDAO;


public class ControladorServlet extends HttpServlet {
    UsuariosDAO dao=new UsuariosDAO();
    Usuarios usuario=new Usuarios();
    int r;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion=request.getParameter("accion");
        if(accion != null && accion.equals("Registrarse")){
            String nombre=request.getParameter("nombre");
             String correo=request.getParameter("correo");
              String contrasena=request.getParameter("contrasena");
            usuario.setNombre(nombre);
            usuario.setCorreo(correo);
            usuario.setContrasena(contrasena);
              Usuarios usuarioValidado = dao.Validar(usuario);
              
              if (usuarioValidado != null) {
                // El usuario fue autenticado con éxito, redirigir según su rol
                String rol = usuarioValidado.getRol();
                switch (rol) {
                    case "Administrador":
                        System.out.println(" Usuario Administrador autenticado. Redirigiendo a dashboardAdmin.jsp");
                        request.getRequestDispatcher("dashboardAdmin.jsp").forward(request, response);
                        break;
                    case "Empleado":
                        System.out.println(" Usuario Empleado autenticado. Redirigiendo a dashboardEmpleado.jsp");
                        request.getRequestDispatcher("dashboardEmpleado.jsp").forward(request, response);
                        break;
                    case "Cliente":
                        System.out.println(" Usuario Cliente autenticado. Redirigiendo a dashboardCliente.jsp");
                        request.getRequestDispatcher("dashboardCliente.jsp").forward(request, response);
                        break;
                    default:
                        System.out.println(" Rol no válido. Redirigiendo a index.jsp");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        break;
                }
            } else {
                // Usuario no encontrado, redirigir a la página de inicio
                System.out.println(" Usuario NO autenticado. Redirigiendo a index.jsp");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        
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
                return "Controlador para gestionar el login de usuarios y redirección por rol";

    }// </editor-fold>

}
