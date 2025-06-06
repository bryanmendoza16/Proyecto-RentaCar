<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    modelo.Renta renta = (modelo.Renta) request.getAttribute("renta");
    java.util.List<modelo.Vehiculo> vehiculos = (java.util.List<modelo.Vehiculo>) request.getAttribute("vehiculos");
    java.util.List<modelo.Cliente> clientes = (java.util.List<modelo.Cliente>) request.getAttribute("clientes");
    java.util.List<modelo.Empleado> empleados = (java.util.List<modelo.Empleado>) request.getAttribute("empleados");
%>
<html>
<head>
    <title>Editar Reservación</title>
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
        select, input[type="date"], input[type="number"], input[type="text"] {
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
    <h2>Editar Reservación</h2>

    <form action="RentaServlet" method="post">
        <input type="hidden" name="rentaID" value="<%= renta.getRentaID() %>" />
        
        <label for="vehiculoID">Vehículo:</label>
        <select id="vehiculoID" name="vehiculoID">
            <% for(modelo.Vehiculo v : vehiculos) { %>
                <option value="<%= v.getVehiculoID() %>" <%= (v.getVehiculoID() == renta.getVehiculoID()) ? "selected" : "" %>>
                    <%= v.getMarca() + " " + v.getModelo() %>
                </option>
            <% } %>
        </select>

        <label for="clienteID">Cliente:</label>
        <select id="clienteID" name="clienteID">
            <% for(modelo.Cliente c : clientes) { %>
                <option value="<%= c.getClienteID() %>" <%= (c.getClienteID() == renta.getClienteID()) ? "selected" : "" %>>
                    <%= c.getNombre() %>
                </option>
            <% } %>
        </select>

        <label for="empleadoID">Empleado:</label>
        <select id="empleadoID" name="empleadoID">
            <% for(modelo.Empleado e : empleados) { %>
                <option value="<%= e.getEmpleadoID() %>" <%= (e.getEmpleadoID() == renta.getEmpleadoID()) ? "selected" : "" %>>
                    <%= e.getNombre() %>
                </option>
            <% } %>
        </select>

        <label for="fechaInicio">Fecha Inicio:</label>
        <input type="date" id="fechaInicio" name="fechaInicio" value="<%= renta.getFechaInicio() != null ? renta.getFechaInicio().toString() : "" %>" />

        <label for="fechaFin">Fecha Fin:</label>
        <input type="date" id="fechaFin" name="fechaFin" value="<%= renta.getFechaFin() != null ? renta.getFechaFin().toString() : "" %>" />

        <label for="total">Total:</label>
        <input type="text" id="total" name="total" value="<%= renta.getTotal() %>" />

        <button type="submit" class="btn-primary">Actualizar</button>
    </form>
    <div class="btn-volver">
        <a href="RentaServlet">Volver a la lista</a>
    </div>
</div>
</body>
</html>
