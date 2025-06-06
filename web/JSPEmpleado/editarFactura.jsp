<%-- 
    Document   : editarFactura
    Created on : 6 jun 2025, 15:55:29
    Author     : axel martinez
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Factura" %>
<%@ page import="modelo.Renta" %>
<html>
<head>
    <title>Editar Factura</title>
    <style>
       /* Estilos generales */
body {
    font-family: Arial, sans-serif;
    background: #f4f6f8;
    margin: 0;
    padding: 20px;
}

/* Contenedor principal */
.container {
    max-width: 600px;
    background: white;
    margin: auto;
    padding: 20px 30px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

/* Títulos */
h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

/* Etiquetas y elementos de formulario */
label {
    display: block;
    margin-top: 15px;
    color: #555;
    font-weight: bold;
}

select,
input[type="date"],
input[type="number"],
input[type="text"] {
    width: 100%;
    padding: 8px 10px;
    margin-top: 5px;
    border-radius: 4px;
    border: 1px solid #ccc;
    box-sizing: border-box;
    font-size: 14px;
}

/* Botón principal */
button.btn-primary {
    margin-top: 25px;
    width: 100%;
    background-color: #007bff;
    border: none;
    color: white;
    padding: 12px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button.btn-primary:hover {
    background-color: #0056b3;
}

/* Botón de retorno */
.btn-volver {
    margin-top: 15px;
    text-align: center;
}

.btn-volver a {
    color: #666;
    text-decoration: none;
    font-size: 14px;
}

.btn-volver a:hover {
    text-decoration: underline;
}

    </style>
</head>
<body>
<div class="container">
    <h2>Editar Factura</h2>
    <form action="FacturaServlet" method="post">
        <input type="hidden" name="facturaID" value="<%= request.getAttribute("facturaID") %>">
        <label for="rentaID">Reserva</label>
        <select name="rentaID" id="rentaID" required>
            <option value="">-- Seleccione una reserva --</option>
            <%
                List<Renta> rentas = (List<Renta>) request.getAttribute("rentas");
                if (rentas != null) {
                    for (Renta r : rentas) {
                        String selected = "";
                        int rentaID = (Integer) request.getAttribute("rentaID");
                        if (r.getRentaID() == rentaID) {
                            selected = "selected";
                        }
            %>
            <option value="<%= r.getRentaID() %>" <%= selected %>>
                <%= r.getClienteNombre() %> - <%= r.getFechaInicio() %>
            </option>
            <%
                    }
                }
            %>
        </select>

        <label for="fechaPago">Fecha de Pago</label>
        <input type="date" name="fechaPago" id="fechaPago" value="<%= request.getAttribute("fechaPago") %>" required>

        <label for="monto">Monto</label>
        <input type="number" name="monto" id="monto" step="0.01" value="<%= request.getAttribute("monto") %>" required>

        <button type="submit" class="btn-primary">Actualizar</button>
    </form>
    <div class="btn-volver">
        <a href="FacturaServlet">Volver al listado</a>
    </div>
</div>
</body>
</html>

