<%@page import="java.util.List"%>
<%@ page import="modelo.Usuarios" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Eliminar Usuarios</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --danger-color: #e74c3c;
            --light-color: #ecf0f1;
            --warning-color: #f39c12;
            --text-color: #333;
            --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            color: var(--text-color);
            padding: 2rem;
        }
        h1 {
            color: var(--primary-color);
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 2rem;
            box-shadow: var(--box-shadow);
            background: white;
            border-radius: 8px;
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
        }
        .btn-eliminar {
            background-color: var(--danger-color);
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
            transition: var(--transition);
        }
        .btn-eliminar:hover {
            background-color: #c0392b;
        }
        .btn-container {
            text-align: center;
        }
        .btn-back {
            background-color: var(--primary-color);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
        }
        .btn-back:hover {
            background-color: #1a242f;
        }
    </style>

    <script>
        function confirmarEliminacion(nombre, url) {
            if (confirm("¿Estás seguro que deseas eliminar al usuario: " + nombre + "?")) {
                window.location.href = url;
            }
        }
    </script>
</head>
<body>
    <h1>Usuarios - Eliminar</h1>

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
                        <button class="btn-eliminar" onclick="confirmarEliminacion('<%= u.getNombre() %>', 'UsuariosController?accion=eliminar&id=<%= u.getIdUsuarios() %>')">
                            Eliminar
                        </button>
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
