<%@page import="java.util.List"%>
<%@ page import="modelo.Usuarios" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Modificar Usuarios</title>
    <style>
        /* Reutilizando mismo estilo de usuario-listar.jsp */
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e67e22;
            --success-color: #2ecc71;
            --danger-color: #e74c3c;
            --warning-color: #f39c12;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
            --gray-color: #95a5a6;
            --text-color: #333;
            --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            color: var(--text-color);
            line-height: 1.6;
            padding: 2rem;
        }
        h1 {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 1rem;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 2rem;
            box-shadow: var(--box-shadow);
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: var(--primary-color);
            color: white;
        }
        tr:nth-child(even) {
            background-color: var(--light-color);
        }
        tr:hover {
            background-color: #e8f4f8;
            cursor: default;
        }
        .btn-editar {
            background-color: var(--warning-color);
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            text-decoration: none;
        }
        .btn-editar:hover {
            background-color: var(--accent-color);
        }
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
        .btn-back {
            background-color: var(--secondary-color);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            text-decoration: none;
            transition: var(--transition);
        }
        .btn-back:hover {
            background-color: var(--primary-color);
        }
    </style>
</head>
<body>
<h1>Usuarios - Modificar</h1>

<table>
    <thead>
        <tr>
             <%-- <th>ID</th> --%>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Rol</th>
            <th>Acción</th>
        </tr>
    </thead>
    <tbody>
        <%
            List<Usuarios> listaUsuarios = (List<Usuarios>) request.getAttribute("usuarios");
            if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
                for (Usuarios u : listaUsuarios) {
        %>
            <tr>
                <%-- <td><%= u.getIdUsuarios() %></td> --%>
                <td><%= u.getNombre() %></td>
                <td><%= u.getCorreo() %></td>
                <td><%= u.getRol() %></td>
                <td>
                    <a href="UsuariosController?accion=editar&id=<%= u.getIdUsuarios() %>" class="btn-editar">Editar</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5" style="text-align:center;">No hay usuarios registrados.</td>
            </tr>
        <%
            }
        %>
    </tbody>
</table>

<div class="btn-container">
    <a href="dashboardAdmin.jsp" class="btn-back">Regresar</a>
</div>

</body>
</html>
