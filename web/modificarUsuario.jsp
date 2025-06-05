<%@page import="java.util.List"%>
<%@page import="modelo.Usuarios"%>
<%
    Usuarios usuario = (Usuarios) request.getAttribute("usuario");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Usuarios - Modificar</title>
    <style>
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
            padding: 2rem;
        }
        h1 {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            background: white;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: var(--box-shadow);
        }
        label {
            display: block;
            margin-bottom: 0.3rem;
            font-weight: 600;
        }
        input[type="text"], input[type="email"], input[type="password"], select {
            width: 100%;
            padding: 8px 10px;
            margin-bottom: 1rem;
            border: 1px solid var(--gray-color);
            border-radius: 4px;
            font-size: 1rem;
        }
        button {
            background-color: var(--secondary-color);
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 6px;
            font-weight: 700;
            cursor: pointer;
            transition: var(--transition);
        }
        button:hover {
            background-color: var(--accent-color);
        }
        .btn-back {
            margin-top: 1rem;
            display: block;
            width: 150px;
            margin-left: auto;
            margin-right: auto;
            padding: 10px;
            background-color: var(--primary-color);
            color: white;
            text-align: center;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
        }
        .btn-back:hover {
            background-color: var(--danger-color);
        }
    </style>
</head>
<body>
<h1>Modificar Usuario</h1>

<form action="UsuariosController?accion=actualizar" method="post">
    <input type="hidden" name="id" value="<%= usuario.getIdUsuarios() %>" />

    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" value="<%= usuario.getNombre() %>" required />

    <label for="correo">Correo:</label>
    <input type="email" id="correo" name="correo" value="<%= usuario.getCorreo() %>" required />

    <label for="rol">Rol:</label>
    <input type="text" id="rol" name="rol" value="<%= usuario.getRol() %>" required />

    <button type="submit">Editar</button>
    
</form>

    <a href="UsuariosController?accion=listar" class="btn-back">Cancelar</a>
</body>
</html>