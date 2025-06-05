package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuarios;
import modelo.UsuariosDAO;

public class UsuariosController extends HttpServlet {

    UsuariosDAO dao = new UsuariosDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        System.out.println("=== UsuariosController - doGet() ===");
        System.out.println("Parámetro 'accion' recibido: " + accion);

        if (accion == null) {
            accion = "listar"; // por defecto
            System.out.println("Acción por defecto: " + accion);
        }

        switch (accion) {
            case "listar":
                System.out.println("Ejecutando caso: listar");
                listarUsuarios(request, response);
                break;
            case "nuevo":
                System.out.println("Ejecutando caso: nuevo");
                request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
                break;
            case "listarModificar":
                     List<Usuarios> listaMod = dao.listar();
                     request.setAttribute("usuarios", listaMod);
                        request.getRequestDispatcher("usuario-modificar.jsp").forward(request, response);
                    break;

            case "editar":
                System.out.println("Ejecutando caso: editar");
                editarUsuario(request, response);
                break;
                case "eliminarVista":
    List<Usuarios> usuariosElim = dao.listar();
    request.setAttribute("usuarios", usuariosElim);
    request.getRequestDispatcher("usuario-eliminar.jsp").forward(request, response);
    break;

            case "eliminar":
                System.out.println("Ejecutando caso: eliminar");
                eliminarUsuario(request, response);
                break;
            default:
                System.out.println("Ejecutando caso: default (listar)");
                listarUsuarios(request, response);
                break;
        }
    }

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("=== listarUsuarios() ===");
        
        try {
            List<Usuarios> lista = dao.listar();
            System.out.println("Lista obtenida del DAO: " + (lista != null ? "SÍ" : "NO"));
            
            if (lista != null) {
                System.out.println("Número de usuarios en la lista: " + lista.size());
                
                // Debug: mostrar algunos datos
                for (int i = 0; i < Math.min(3, lista.size()); i++) {
                    Usuarios u = lista.get(i);
                    System.out.println("Usuario " + (i+1) + ": ID=" + u.getIdUsuarios() + 
                                     ", Nombre=" + u.getNombre() + 
                                     ", Correo=" + u.getCorreo());
                }
            }
            
            request.setAttribute("usuarios", lista);
            System.out.println("Atributo 'usuarios' establecido en request");
            
            System.out.println("Redirigiendo a: usuario-listar.jsp");
            request.getRequestDispatcher("usuario-listar.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.out.println("ERROR en listarUsuarios(): " + e.getMessage());
            e.printStackTrace();
            
            // En caso de error, enviar lista vacía para evitar errores en JSP
            List<Usuarios> listaVacia = new java.util.ArrayList<>();
            request.setAttribute("usuarios", listaVacia);
            request.setAttribute("error", "Error al cargar usuarios: " + e.getMessage());
            request.getRequestDispatcher("usuario-listar.jsp").forward(request, response);
        }
    }

    private void editarUsuario(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("=== editarUsuario() ===");
        
        try {
            String idParam = request.getParameter("id");
            System.out.println("ID recibido: " + idParam);
            
            if (idParam == null || idParam.trim().isEmpty()) {
                System.out.println("ERROR: ID es null o vacío");
                response.sendRedirect("UsuariosController?accion=listar");
                return;
            }
            
            int id = Integer.parseInt(idParam);
            System.out.println("ID parseado: " + id);
            
            Usuarios u = dao.listarPorId(id);
            System.out.println("Usuario encontrado: " + (u != null ? u.getNombre() : "null"));
            
            request.setAttribute("usuario", u);
            request.getRequestDispatcher("modificarUsuario.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            System.out.println("ERROR: ID no es un número válido: " + e.getMessage());
            response.sendRedirect("UsuariosController?accion=listar");
        } catch (Exception e) {
            System.out.println("ERROR en editarUsuario(): " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("UsuariosController?accion=listar");
        }
    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        System.out.println("=== eliminarUsuario() ===");
        
        try {
            String idParam = request.getParameter("id");
            System.out.println("ID a eliminar: " + idParam);
            
            if (idParam == null || idParam.trim().isEmpty()) {
                System.out.println("ERROR: ID es null o vacío");
                response.sendRedirect("UsuariosController?accion=listar");
                return;
            }
            
            int id = Integer.parseInt(idParam);
            dao.eliminar(id);
            System.out.println("Usuario eliminado con ID: " + id);
            
        } catch (Exception e) {
            System.out.println("ERROR en eliminarUsuario(): " + e.getMessage());
            e.printStackTrace();
        }
        
        response.sendRedirect("UsuariosController?accion=listar");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        System.out.println("=== UsuariosController - doPost() ===");
        System.out.println("Parámetro 'accion' recibido: " + accion);
        
        if (accion == null) {
            System.out.println("ERROR: Acción es null en doPost");
            response.sendRedirect("UsuariosController?accion=listar");
            return;
        }
        
        switch (accion) {
            case "guardar":
                System.out.println("Ejecutando: guardar");
                guardarUsuario(request, response);
                break;
            case "actualizar":
                System.out.println("Ejecutando: actualizar");
                actualizarUsuario(request, response);
                break;
            default:
                System.out.println("Acción no reconocida: " + accion);
                response.sendRedirect("UsuariosController?accion=listar");
                break;
        }
    }

    private void guardarUsuario(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        System.out.println("=== guardarUsuario() ===");
        
        try {
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String password = request.getParameter("password");
            String rol = request.getParameter("rol");
            
            System.out.println("Datos recibidos - Nombre: " + nombre + ", Correo: " + correo + ", Rol: " + rol);
            
            if (nombre == null || correo == null || password == null || rol == null) {
                System.out.println("ERROR: Algunos parámetros son null");
                response.sendRedirect("UsuariosController?accion=listar");
                return;
            }
            
            Usuarios u = new Usuarios();
            u.setNombre(nombre);
            u.setCorreo(correo);
            u.setContrasena(password);
            u.setRol(rol);
            
            dao.agregar(u);
            System.out.println("Usuario guardado exitosamente");
            
        } catch (Exception e) {
            System.out.println("ERROR en guardarUsuario(): " + e.getMessage());
            e.printStackTrace();
        }
        
        response.sendRedirect("UsuariosController?accion=listar");
    }

    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        System.out.println("=== actualizarUsuario() ===");
        
        try {
            String idParam = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String password = request.getParameter("password");
            String rol = request.getParameter("rol");
            
            System.out.println("Datos recibidos - ID: " + idParam + ", Nombre: " + nombre + 
                             ", Correo: " + correo + ", Rol: " + rol);
            
            if (idParam == null || nombre == null || correo == null || password == null || rol == null) {
                System.out.println("ERROR: Algunos parámetros son null");
                response.sendRedirect("UsuariosController?accion=listar");
                return;
            }
            
            int id = Integer.parseInt(idParam);
            
            Usuarios u = new Usuarios();
            u.setIdUsuarios(id);
            u.setNombre(nombre);
            u.setCorreo(correo);
            u.setContrasena(password);
            u.setRol(rol);
            
            dao.actualizar(u);
            System.out.println("Usuario actualizado exitosamente");
            
        } catch (Exception e) {
            System.out.println("ERROR en actualizarUsuario(): " + e.getMessage());
            e.printStackTrace();
        }
        
        response.sendRedirect("UsuariosController?accion=listar");
    }

    @Override
    public String getServletInfo() {
        return "Controlador de Usuarios con Debug";
    }
}