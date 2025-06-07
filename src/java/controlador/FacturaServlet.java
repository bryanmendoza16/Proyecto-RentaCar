package controlador;



import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import modelo.Factura;
import modelo.FacturaDAO;
import modelo.Renta;

// resto del código...


public class FacturaServlet extends HttpServlet {
    private FacturaDAO facturaDAO;

    @Override
    public void init() throws ServletException {
        facturaDAO = new FacturaDAO();
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

            case "generarPDF":
                int idFactura = Integer.parseInt(request.getParameter("id"));
                Factura facturaPDF = facturaDAO.obtenerPorId(idFactura);
                if (facturaPDF != null) {
                    generarFacturaPDF(facturaPDF, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Factura no encontrada");
                }
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
            facturaDAO.insertar(factura);
        } else {
            factura.setFacturaID(facturaID);
            facturaDAO.actualizar(factura);
        }
        response.sendRedirect("FacturaServlet");
    }

    private void generarFacturaPDF(Factura factura, HttpServletResponse response) throws IOException {
        // Configurar respuesta para PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=factura_" + factura.getFacturaID() + ".pdf");

        Document document = new Document();
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            Font titulo = new Font(Font.FontFamily.HELVETICA, 20, Font.BOLD);
            Font texto = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);

            document.add(new Paragraph("Factura #" + factura.getFacturaID(), titulo));
            document.add(new Paragraph(" "));
            document.add(new Paragraph("Renta ID: " + factura.getRentaID(), texto));
            document.add(new Paragraph("Fecha de pago: " + factura.getFechaPago(), texto));
            document.add(new Paragraph("Monto: $" + factura.getMonto(), texto));

            // Aquí podrías agregar más detalles de la factura si quieres,
            // por ejemplo, datos del cliente o del vehículo, etc.

            document.close();
        } catch (DocumentException e) {
            throw new IOException(e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para gestión de Facturas y generación de PDF";
    }
}
