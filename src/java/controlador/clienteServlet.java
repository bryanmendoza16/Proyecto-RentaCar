package controlador;

import java.sql.Date;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDAO;

public class clienteServlet extends HttpServlet {
    private ClienteDAO clienteDAO = new ClienteDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // No hay contenido en processRequest
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "default";
        }

        switch (action) {
            case "list":
                listarClientes(request, response);
                break;
            case "new":
                mostrarFormularioNuevo(request, response);
                break;
            case "edit":
                mostrarFormularioEditar(request, response);
                break;
            case "delete":
                eliminarCliente(request, response);
                break;
            default:
                request.getRequestDispatcher("clientes.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "insert":
                insertarCliente(request, response);
                break;
            case "update":
                actualizarCliente(request, response);
                break;
            default:
                response.sendRedirect("clienteServlet");
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void listarClientes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Cliente> listaClientes = clienteDAO.listarTodos();
        request.setAttribute("clientes", listaClientes);
        request.getRequestDispatcher("JSPEmpleado/listaClientes.jsp").forward(request, response);
    }

    private void mostrarFormularioNuevo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("JSPEmpleado/formCliente.jsp").forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cliente clienteExistente = clienteDAO.obtenerPorId(id);
        request.setAttribute("cliente", clienteExistente);
        request.getRequestDispatcher("JSPEmpleado/formCliente.jsp").forward(request, response);
    }

    private void insertarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String dui = request.getParameter("dui");
        String noLicencia = request.getParameter("noLicencia");
        String correo = request.getParameter("correo");

        Cliente nuevoCliente = new Cliente();
        nuevoCliente.setNombre(nombre);
        nuevoCliente.setTelefono(telefono);
        nuevoCliente.setDui(dui);
        nuevoCliente.setNoLicencia(noLicencia);
        nuevoCliente.setCorreo(correo);
        nuevoCliente.setFechaRegistro(new Date(System.currentTimeMillis()));

        clienteDAO.insertar(nuevoCliente);

        request.setAttribute("message", "Cliente agregado exitosamente");
        request.setAttribute("messageType", "alert-success");
        response.sendRedirect("clienteServlet?action=list");
    }

    private void actualizarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("clienteID"));
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String dui = request.getParameter("dui");
        String noLicencia = request.getParameter("noLicencia");
        String correo = request.getParameter("correo");

        Cliente cliente = new Cliente();
        cliente.setClienteID(id);
        cliente.setNombre(nombre);
        cliente.setTelefono(telefono);
        cliente.setDui(dui);
        cliente.setNoLicencia(noLicencia);
        cliente.setCorreo(correo);

        clienteDAO.actualizar(cliente);

        request.getSession().setAttribute("message", "Cliente actualizado exitosamente");
        request.getSession().setAttribute("messageType", "alert-success");
        response.sendRedirect("clienteServlet?action=list");
    }

    private void eliminarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        clienteDAO.eliminar(id);

        request.setAttribute("message", "Cliente eliminado exitosamente");
        request.setAttribute("messageType", "alert-success");
        response.sendRedirect("clienteServlet?action=list");
    }
}
