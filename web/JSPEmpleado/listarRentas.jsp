<%@page import="java.util.List"%> 
<%@page import="modelo.Renta"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Empleado"%>
<%@page import="modelo.Vehiculo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Reservaciones</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        /* (Tu CSS permanece igual) */
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6f8;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.08);
        }

        .titulo-table td {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            padding-bottom: 25px;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        thead {
            background-color: #007bff;
            color: white;
        }

        th, td {
            padding: 14px 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .acciones-btns {
            display: flex;
            gap: 10px;
        }

        .btn-editar,
        .btn-eliminar {
            display: inline-flex;
            align-items: center;
            padding: 8px 12px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
            color: white;
        }

        .btn-editar {
            background-color: #28a745;
        }

        .btn-editar:hover {
            background-color: #218838;
        }

        .btn-eliminar {
            background-color: #dc3545;
        }

        .btn-eliminar:hover {
            background-color: #c82333;
        }

        .btn-volver {
            margin-top: 20px;
            text-align: left;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
            padding: 10px 16px;
            text-decoration: none;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">

        <!-- Título -->
        <table class="titulo-table" role="presentation">
            <tbody>
                <tr>
                    <td>Lista de Reservaciones</td>
                </tr>
            </tbody>
        </table>

        <!-- Tabla de reservaciones -->
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Vehículo</th>
                        <th>Empleado</th>
                        <th>Cliente</th>
                        <th>Fecha Inicio</th>
                        <th>Fecha Fin</th>
                        <th>Total</th>
                        <th>Fecha Registro</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
    <%
        List<Renta> listaRentas = (List<Renta>) request.getAttribute("rentas");
        List<Vehiculo> vehiculos = (List<Vehiculo>) request.getAttribute("vehiculos");
        List<Empleado> empleados = (List<Empleado>) request.getAttribute("empleados");
        List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        if (listaRentas != null) {
            for (Renta renta : listaRentas) {
                String descVehiculo = "";
                for (Vehiculo v : vehiculos) {
                    if (v.getVehiculoID() == renta.getVehiculoID()) {
                        descVehiculo = v.getDescripcion();
                        break;
                    }
                }

                String nombreEmpleado = "";
                for (Empleado e : empleados) {
                    if (e.getEmpleadoID() == renta.getEmpleadoID()) {
                        nombreEmpleado = e.getNombre();
                        break;
                    }
                }

                String nombreCliente = "";
                for (Cliente c : clientes) {
                    if (c.getClienteID() == renta.getClienteID()) {
                        nombreCliente = c.getNombre();
                        break;
                    }
                }
    %>
    <tr>
        <td><%= descVehiculo %></td>
        <td><%= nombreEmpleado %></td>
        <td><%= nombreCliente %></td>
        <td><%= renta.getFechaInicio() != null ? sdf.format(renta.getFechaInicio()) : "Sin fecha" %></td>
        <td><%= renta.getFechaFin() != null ? sdf.format(renta.getFechaFin()) : "Sin fecha" %></td>
        <td>$<%= String.format("%.2f", renta.getTotal()) %></td>
        <td><%= renta.getFechaRegistro() != null ? sdf.format(renta.getFechaRegistro()) : "Sin registro" %></td>
        <td>
            <div class="acciones-btns">
    <a href="rentaServlet?action=edit&id=<%= renta.getRentaID() %>" class="btn-editar">
        <i class="fas fa-pen"></i> Editar
    </a>
    <a href="rentaServlet?action=delete&id=<%= renta.getRentaID() %>" class="btn-eliminar"
       onclick="return confirm('¿Está seguro de eliminar esta reservación?')">
        <i class="fas fa-trash"></i> Eliminar
    </a>
</div>

        </td>
    </tr>
    <%
            }
        }
    %>
</tbody>

            </table>
        </div>

        <div class="btn-volver">
            <a href="dashboardEmpleado.jsp" class="btn-secondary">
                <i class="fas fa-arrow-left"></i> Volver
            </a>
        </div>

    </div>
</body>
</html>
