/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Factura;
import modelo.FacturaDAO;
import modelo.Renta;

public class FacturaServlet extends HttpServlet {
     private FacturaDAO facturaDAO;
     
      @Override
    public void init() throws ServletException {
        facturaDAO = new FacturaDAO();
    }
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                List<Renta> listaRentas = facturaDAO.obtenerTodasRentas();
                request.setAttribute("rentas", listaRentas);
                request.getRequestDispatcher("JSPEmpleado/nuevaFactura.jsp").forward(request, response);
                break;

            case "edit":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                Factura factura = facturaDAO.obtenerPorId(idEditar);
                List<Renta> listaRentasEdit = facturaDAO.obtenerTodasRentas();

                request.setAttribute("factura", factura);
                request.setAttribute("rentas", listaRentasEdit);
                request.getRequestDispatcher("JSPEmpleado/editarFactura.jsp").forward(request, response);
                break;

            case "delete":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                facturaDAO.eliminar(idEliminar);
                response.sendRedirect("FacturaServlet");
                break;

            default:
                List<Factura> listaFacturas = facturaDAO.obtenerTodas();
                request.setAttribute("facturas", listaFacturas);
                request.getRequestDispatcher("JSPEmpleado/listarFacturas.jsp").forward(request, response);
                break;
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int facturaID = request.getParameter("facturaID") != null && !request.getParameter("facturaID").isEmpty()
                ? Integer.parseInt(request.getParameter("facturaID")) : 0;

        int rentaID = Integer.parseInt(request.getParameter("rentaID"));
        String fechaPagoStr = request.getParameter("fechaPago");
        double monto = Double.parseDouble(request.getParameter("monto"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.sql.Date fechaPago = null;
        try {
            Date parsedDate = sdf.parse(fechaPagoStr);
            fechaPago = new java.sql.Date(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Factura factura = new Factura();
        factura.setRentaID(rentaID);
        factura.setFechaPago(fechaPago);
        factura.setMonto(monto);

        if (facturaID == 0) {
            // Insertar
            facturaDAO.insertar(factura);
        } else {
            // Actualizar
            factura.setFacturaID(facturaID);
            facturaDAO.actualizar(factura);
        }
        response.sendRedirect("FacturaServlet");
        }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
