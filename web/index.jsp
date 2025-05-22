<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="registro-container">
        <h2 class="form-title">Inicio Sesion</h2>
        <form action="ControladorServlet" method="post" class="registro-form">
            <input type="text" name="nombre" placeholder="Nombre Completo" required class="form-input">
            <input type="email" name="correo" placeholder="Correo Electrónico" required class="form-input">
            <input type="password" name="contrasena" placeholder="Contraseña" required class="form-input">
            <input type="hidden" name="accion" value="Registrarse">
            <button type="submit" class="form-button">Iniciar sesion</button>
        </form>
    </div>
</body>
</html>