<%--  
    Document   : listarFacturas
    Created on : 6 jun 2025, 15:50:26
    Author     : axel martinez
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Factura" %>
<html>
<head>
    <title>Listado de Facturas</title>
    <style>
        /* Tu CSS personalizado */
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0; padding: 20px;
        }
        .container {
            max-width: 800px;
            background: white;
            margin: auto;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px 8px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        a.button, button.action-btn {
            display: inline-block;
            padding: 8px 12px;
            margin: 10px 10px 10px 0;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        a.button:hover, button.action-btn:hover {
            background-color: #0056b3;
        }
        .actions form {
            display: inline;
            margin: 0;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Listado de Facturas</h2>

    <!-- Botón para volver al DashboardEmpleado -->
    <a href="dashboardEmpleado.jsp" class="button">Volver al Dashboard</a>

    <table>
        <thead>
        <tr>
            <th>Número de Factura</th>
            <th>Cliente</th>
            <th>Fecha de Reserva</th>
            <th>Fecha de Pago</th>
            <th>Monto</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Factura> lista = (List<Factura>) request.getAttribute("facturas");
            if (lista != null && !lista.isEmpty()) {
                for (Factura f : lista) {
        %>
        <tr>
            <td><%= f.getFacturaID() %></td>
            <td><%= f.getClienteNombre() %></td>
            <td><%= f.getFechaRenta() %></td>
            <td><%= f.getFechaPago() %></td>
            <td>$<%= String.format("%.2f", f.getMonto()) %></td>
            <td class="actions">
                <!-- Botón Editar (envía con GET) -->
                <form action="FacturaServlet" method="get" style="display:inline;">
                    <input type="hidden" name="action" value="edit" />
                    <input type="hidden" name="id" value="<%= f.getFacturaID() %>" />
                    <button type="submit" class="action-btn">Editar</button>
                </form>

                <!-- Botón Eliminar (envía con POST o GET, pero aquí GET para simplificar) -->
                <form action="FacturaServlet" method="get" style="display:inline;" onsubmit="return confirm('¿Está seguro de eliminar esta factura?');">
                    <input type="hidden" name="action" value="delete" />
                    <input type="hidden" name="id" value="<%= f.getFacturaID() %>" />
                    <button type="submit" class="action-btn" style="background-color: #dc3545;">Eliminar</button>
                </form>

                <!-- Botón Ver PDF -->
                <form action="FacturaServlet" method="get" target="_blank" style="display:inline;">
                    <input type="hidden" name="action" value="generarPDF" />
                    <input type="hidden" name="id" value="<%= f.getFacturaID() %>" />
                    <button type="submit" class="action-btn" style="background-color: #28a745;">Ver PDF</button>
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6">No hay facturas registradas.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
