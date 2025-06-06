<%-- 
    Document   : NuevaReservacion
    Created on : 6 jun 2025, 11:50:58
    Author     : axel martinez
--%>


<%@page import="java.util.List"%>
<%@page import="modelo.Vehiculo"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Empleado"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nueva Reservación</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0; padding: 20px;
        }
        .container {
            max-width: 600px;
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
        label {
            display: block;
            margin-top: 15px;
            color: #555;
            font-weight: bold;
        }
        select, input[type="date"], input[type="number"] {
            width: 100%;
            padding: 8px 10px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 14px;
        }
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
    <h2>Nueva Reservación</h2>

    <form action="RentaServlet" method="post">

        <input type="hidden" name="action" value="guardar" />

        <label for="vehiculo">Vehículo</label>
        <select name="vehiculoID" id="vehiculo" required>
            <%
                List<Vehiculo> vehiculos = (List<Vehiculo>) request.getAttribute("vehiculos");
                if (vehiculos != null) {
                    for (Vehiculo v : vehiculos) {
            %>
                <option value="<%= v.getVehiculoID() %>"><%= v.getMarca() + " " + v.getModelo() + " (" + v.getPlaca() + ")" %></option>
            <%
                    }
                }
            %>
        </select>

        <label for="cliente">Cliente</label>
        <select name="clienteID" id="cliente" required>
            <%
                List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
                if (clientes != null) {
                    for (Cliente c : clientes) {
            %>
                <option value="<%= c.getClienteID() %>"><%= c.getNombre() %></option>
            <%
                    }
                }
            %>
        </select>

        <label for="empleado">Empleado</label>
        <select name="empleadoID" id="empleado" required>
            <%
                List<Empleado> empleados = (List<Empleado>) request.getAttribute("empleados");
                if (empleados != null) {
                    for (Empleado e : empleados) {
            %>
                <option value="<%= e.getEmpleadoID() %>"><%= e.getNombre() %></option>
            <%
                    }
                }
            %>
        </select>

        <label for="fechaInicio">Fecha Inicio</label>
        <input type="date" name="fechaInicio" id="fechaInicio" required />

        <label for="fechaFin">Fecha Fin</label>
        <input type="date" name="fechaFin" id="fechaFin" required />

        <label for="total">Total ($)</label>
        <input type="number" step="0.01" name="total" id="total" required min="0" />

        <button type="submit" class="btn-primary">Guardar Reservación</button>
    </form>

    <div class="btn-volver">
        <a href="dashboardEmpleado.jsp"><i class="fas fa-arrow-left"></i> Volver al Dashboard</a>
    </div>
</div>
</body>
</html>
