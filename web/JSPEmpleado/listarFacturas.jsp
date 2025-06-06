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
        a.button {
            display: inline-block;
            padding: 8px 12px;
            margin: 10px 0;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a.button:hover {
            background-color: #0056b3;
        }
        .actions a {
            margin-right: 10px;
            color: #007bff;
            text-decoration: none;
        }
        .actions a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Listado de Facturas</h2>
    <a href="FacturaServlet?action=new" class="button">Nueva Factura</a>
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
                <a href="FacturaServlet?action=edit&id=<%= f.getFacturaID() %>">Editar</a>
                <a href="FacturaServlet?action=delete&id=<%= f.getFacturaID() %>" onclick="return confirm('¿Está seguro de eliminar esta factura?');">Eliminar</a>
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

