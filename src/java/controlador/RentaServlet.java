package controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.Renta;
import modelo.RentaDAO;
import modelo.VehiculoDAO;
import modelo.ClienteDAO;
import modelo.Empleado;
import modelo.EmpleadoDAO;
import modelo.Vehiculo;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.annotation.WebServlet;

@WebServlet("/rentaServlet")
public class RentaServlet extends HttpServlet {

    private RentaDAO rentaDAO;
    private VehiculoDAO vehiculoDAO;
    private ClienteDAO clienteDAO;
    private EmpleadoDAO empleadoDAO;

    @Override
    public void init() throws ServletException {
        rentaDAO = new RentaDAO();
        vehiculoDAO = new VehiculoDAO();
        clienteDAO = new ClienteDAO();
        empleadoDAO = new EmpleadoDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

       List<Vehiculo> listaVehiculos;
List<Cliente> listaClientes;
List<Empleado> listaEmpleados;

switch (action) {
    case "new":
        listaVehiculos = vehiculoDAO.obtenerTodas();
        listaClientes = clienteDAO.listarTodos();
        listaEmpleados = empleadoDAO.listar();

        request.setAttribute("vehiculos", listaVehiculos);
        request.setAttribute("clientes", listaClientes);
        request.setAttribute("empleados", listaEmpleados);

        request.getRequestDispatcher("JSPEmpleado/NuevaReservacion.jsp").forward(request, response);
        break;

    case "edit":
        int idEditar = Integer.parseInt(request.getParameter("id"));
        Renta renta = rentaDAO.obtenerPorId(idEditar);

        listaVehiculos = vehiculoDAO.obtenerTodas();
        listaClientes = clienteDAO.listarTodos();
        listaEmpleados = empleadoDAO.listar();

        request.setAttribute("vehiculos", listaVehiculos);
        request.setAttribute("clientes", listaClientes);
        request.setAttribute("empleados", listaEmpleados);

        request.setAttribute("renta", renta);
        request.getRequestDispatcher("JSPEmpleado/editarRenta.jsp").forward(request, response);
        break;
        case "delete":
    int idEliminar = Integer.parseInt(request.getParameter("id"));
    rentaDAO.eliminar(idEliminar);
    response.sendRedirect(request.getContextPath() + "/RentaServlet");
    break;


    default:
        List<Renta> lista = rentaDAO.obtenerTodas();

        listaVehiculos = vehiculoDAO.obtenerTodas();
        listaClientes = clienteDAO.listarTodos();
        listaEmpleados = empleadoDAO.listar();

        request.setAttribute("rentas", lista);
        request.setAttribute("vehiculos", listaVehiculos);
        request.setAttribute("clientes", listaClientes);
        request.setAttribute("empleados", listaEmpleados);

        request.getRequestDispatcher("JSPEmpleado/listarRentas.jsp").forward(request, response);
        break;
}


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int rentaID = request.getParameter("rentaID") != null && !request.getParameter("rentaID").isEmpty()
        ? Integer.parseInt(request.getParameter("rentaID")) : 0;

int vehiculoID = Integer.parseInt(request.getParameter("vehiculoID"));
int empleadoID = Integer.parseInt(request.getParameter("empleadoID"));
int clienteID = Integer.parseInt(request.getParameter("clienteID"));
String fechaInicio = request.getParameter("fechaInicio");
String fechaFin = request.getParameter("fechaFin");
String fechaRegistro = request.getParameter("fechaRegistro");
double total = Double.parseDouble(request.getParameter("total"));

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

java.sql.Date fechaInicioDate = null;
java.sql.Date fechaFinDate = null;
java.sql.Date fechaRegistroDate = null;

try {
    if (fechaInicio != null && !fechaInicio.isEmpty()) {
        java.util.Date utilInicio = sdf.parse(fechaInicio);
        fechaInicioDate = new java.sql.Date(utilInicio.getTime());
    }
    if (fechaFin != null && !fechaFin.isEmpty()) {
        java.util.Date utilFin = sdf.parse(fechaFin);
        fechaFinDate = new java.sql.Date(utilFin.getTime());
    }
    if (fechaRegistro != null && !fechaRegistro.isEmpty()) {
        java.util.Date utilRegistro = sdf.parse(fechaRegistro);
        fechaRegistroDate = new java.sql.Date(utilRegistro.getTime());
    }
} catch (ParseException e) {
    e.printStackTrace();
    // Aquí puedes redirigir con un mensaje de error si lo deseas
}

Renta renta = new Renta(rentaID, vehiculoID, empleadoID, clienteID, fechaInicioDate, fechaFinDate, total, fechaRegistroDate);

if (rentaID == 0) {
    rentaDAO.insertar(renta);
} else {
    rentaDAO.actualizar(renta);
}

response.sendRedirect("RentaServlet");

    }

    @Override
    public String getServletInfo() {
        return "Servlet para gestionar rentas (reservaciones)";
    }
}
