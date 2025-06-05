<%-- 
    Document   : crearUsuario
    Created on : 4 jun 2025, 14:35:58
    Author     : axel martinez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Crear Usuario</title>
    <style>
        /* Mismo CSS base */
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

<h1>Crear Usuario</h1>

<form action="UsuariosController" method="post">
    <input type="hidden" name="accion" value="guardar">

    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" required>

    <label for="correo">Correo:</label>
    <input type="email" id="correo" name="correo" required>

    <label for="password">Contraseña:</label>
    <input type="password" id="password" name="password" required>

    <label for="rol">Rol:</label>
    <select id="rol" name="rol" required>
        <option value="">--Seleccione--</option>
        <option value="Administrador">Administrador</option>
        <option value="Empleado">Empleado</option>
        <option value="Cliente">Cliente</option>
    </select>

    <button type="submit">Crear</button>
</form>


<a href="dashboardAdmin.jsp" class="btn-back">Regresar</a>

</body>
</html>