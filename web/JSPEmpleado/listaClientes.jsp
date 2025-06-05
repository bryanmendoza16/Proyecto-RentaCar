<%@page import="java.util.List"%>
<%@page import="modelo.Cliente"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <style>
        /* Contenedor principal */
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 0;
        }

        /* Tabla para el título */
        .titulo-table {
            width: 100%;
            margin-bottom: 2rem;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(44, 120, 232, 0.15);
            border-radius: 8px;
            overflow: hidden;
            background-color: white;
        }
        .titulo-table td {
            text-align: center;
            padding: 1rem 0;
            font-size: 1.2rem;
            font-weight: 600;
            color: #2c78e8;
        }

        /* Tabla de clientes */
        table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
        }

        thead tr {
            background-color: #2c78e8;
            color: white;
            text-align: left;
        }

        th, td {
            padding: 0.75rem 1rem;
            border-bottom: 1px solid #ddd;
            font-size: 0.95rem;
        }

        tbody tr:hover {
            background-color: #f1f9ff;
        }

        /* Botones acciones */
        .acciones-btns {
            display: flex;
            gap: 1rem;
            justify-content: center;
        }

        .btn-editar {
            background-color: #007bff;
            color: white;
            padding: 0.4rem 0.8rem;
            border-radius: 4px;
            text-decoration: none;
            font-size: 0.85rem;
            transition: background-color 0.3s;
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }

        .btn-editar:hover {
            background-color: #0056b3;
        }

        .btn-eliminar {
            background-color: #dc3545;
            color: white;
            padding: 0.4rem 0.8rem;
            border-radius: 4px;
            text-decoration: none;
            font-size: 0.85rem;
            transition: background-color 0.3s;
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }

        .btn-eliminar:hover {
            background-color: #a71d2a;
        }

        /* Botón volver */
        .btn-volver {
            margin-top: 2rem;
            text-align: center;
        }

        .btn-secondary {
            background-color: #e0e0e0;
            color: #666;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: background-color 0.3s;
        }

        .btn-secondary:hover {
            background-color: #d0d0d0;
        }
    </style>
</head>
<body>
    <div class="container">

        <!-- Tabla para el título -->
        <table class="titulo-table" role="presentation">
            <tbody>
                <tr>
                    <td>Lista de Clientes</td>
                </tr>
            </tbody>
        </table>

        <!-- Tabla de clientes -->
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <!-- ID eliminado -->
                        <th>Nombre</th>
                        <th>Teléfono</th>
                        <th>DUI</th>
                        <th>No. Licencia</th>
                        <th>Correo</th>
                        <th>Fecha Registro</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Cliente> listaClientes = (List<Cliente>) request.getAttribute("clientes");
                        if (listaClientes != null) {
                            for (Cliente cliente : listaClientes) {
                    %>
                    <tr>
                        <!-- ID eliminado -->
                        <td><%= cliente.getNombre() %></td>
                        <td><%= cliente.getTelefono() %></td>
                        <td><%= cliente.getDui() %></td>
                        <td><%= cliente.getNoLicencia() %></td>
                        <td><%= cliente.getCorreo() %></td>
                        <td><%= cliente.getFechaRegistro() %></td>
                        <td>
                            <div class="acciones-btns">
                                <a href="clienteServlet?action=edit&id=<%= cliente.getClienteID() %>" class="btn-editar">
                                    <i class="fas fa-pen"></i> Editar
                                </a>
                                <a href="clienteServlet?action=delete&id=<%= cliente.getClienteID() %>" class="btn-eliminar"
                                   onclick="return confirm('¿Está seguro de eliminar este cliente?')">
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

        <!-- Botón Volver -->
        <div class="btn-volver">
            <a href="${pageContext.request.contextPath}/dashboardEmpleado.jsp" class="btn-secondary">
                <i class="fas fa-arrow-left"></i> Volver
            </a>
        </div>
    </div>
</body>
</html>
