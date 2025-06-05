<%-- 
    Document   : dashboard
    Created on : 18 mar 2025, 22:00:59
    Author     : axel martinez
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración - Sistema de Renta de Carros</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/dashboardAdmin.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">
            <i class="fas fa-car"></i>
            <h1>Renta Car FCB Admin</h1>
        </div>
        <div class="nav-links">
            <a href="home.jsp"><i class="fas fa-home"></i> Inicio</a>
            <a href="reportes.jsp"><i class="fas fa-chart-bar"></i> Reportes</a>
            <a href="configuracion.jsp"><i class="fas fa-cog"></i> Configuración</a>
        </div>
        <div class="user-info">
            <span><i class="fas fa-user-circle"></i> Admin</span>
            <a href="home.jsp" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="dashboard-container">
        <h2 class="dashboard-title">Panel de Administración</h2>
        <p class="dashboard-subtitle">Bienvenido al sistema de gestión de renta de carros</p>
        
        <div class="stats-container">
            <div class="stat-card">
                <i class="fas fa-users"></i>
                <h3>Total Usuarios</h3>
                <p>124</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-car"></i>
                <h3>Autos Disponibles</h3>
                <p>47</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-calendar-check"></i>
                <h3>Reservaciones Activas</h3>
                <p>28</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-money-bill-wave"></i>
                <h3>Ingresos del Mes</h3>
                <p>$21,450</p>
            </div>
        </div>

        <div class="admin-modules">
            <div class="module-row">
                <!-- Usuarios -->
                <div class="module-card" id="usuariosCard">
                    <div class="module-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3>Gestión de Usuarios</h3>
                    <p>Administra las cuentas de acceso al sistema</p>
                    <div class="module-actions">
                        <a href="crearUsuario.jsp" class="action-btn create"><i class="fas fa-plus"></i> Crear</a>
                       <a href="UsuariosController?accion=listar" class="action-btn view"><i class="fas fa-eye"></i> Ver</a>
                        <a href="UsuariosController?accion=listarModificar" class="action-btn edit">
                                <i class="fas fa-edit"></i> Modificar
                             </a>
                        <a href="UsuariosController?accion=eliminarVista
"                       class="action-btn delete"><i class="fas fa-trash"></i> Eliminar</a>
                    </div>
                </div>
                
                <!-- Clientes -->
                <div class="module-card" id="clientesCard">
                    <div class="module-icon">
                        <i class="fas fa-user-tie"></i>
                    </div>
                    <h3>Gestión de Clientes</h3>
                    <p>Administra los datos de los clientes</p>
                    <div class="module-actions">
                        <a href="clientes/crear.jsp" class="action-btn create"><i class="fas fa-plus"></i> Crear</a>
                        <a href="clientes/listar.jsp" class="action-btn view"><i class="fas fa-eye"></i> Ver</a>
                        <a href="modificarUsuario.jsp" class="action-btn edit"><i class="fas fa-edit"></i> Modificar</a>
                        <a href="clientes/eliminar.jsp" class="action-btn delete"><i class="fas fa-trash"></i> Eliminar</a>
                    </div>
                </div>
            </div>

            <div class="module-row">
                <!-- Empleados -->
                <div class="module-card" id="empleadosCard">
                    <div class="module-icon">
                        <i class="fas fa-id-card"></i>
                    </div>
                    <h3>Gestión de Empleados</h3>
                    <p>Administra el personal de la empresa</p>
                    <div class="module-actions">
                        <a href="empleados/crear.jsp" class="action-btn create"><i class="fas fa-plus"></i> Crear</a>
                        <a href="empleados/listar.jsp" class="action-btn view"><i class="fas fa-eye"></i> Ver</a>
                        <a href="empleados/editar.jsp" class="action-btn edit"><i class="fas fa-edit"></i> Modificar</a>
                        <a href="empleados/eliminar.jsp" class="action-btn delete"><i class="fas fa-trash"></i> Eliminar</a>
                    </div>
                </div>
                
                <!-- Reservaciones -->
                <div class="module-card" id="reservacionesCard">
                    <div class="module-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <h3>Gestión de Reservaciones</h3>
                    <p>Administra las reservas de vehículos</p>
                    <div class="module-actions">
                        <a href="reservaciones/crear.jsp" class="action-btn create"><i class="fas fa-plus"></i> Crear</a>
                        <a href="reservaciones/listar.jsp" class="action-btn view"><i class="fas fa-eye"></i> Ver</a>
                        <a href="reservaciones/editar.jsp" class="action-btn edit"><i class="fas fa-edit"></i> Modificar</a>
                        <a href="reservaciones/eliminar.jsp" class="action-btn delete"><i class="fas fa-trash"></i> Eliminar</a>
                    </div>
                </div>
            </div>

            <div class="module-row">
                <!-- Vehículos -->
                <div class="module-card" id="vehiculosCard">
                    <div class="module-icon">
                        <i class="fas fa-car-side"></i>
                    </div>
                    <h3>Detalles de Vehículos</h3>
                    <p>Gestiona la información de los autos</p>
                    <div class="module-actions">
                        <a href="vehiculos/crear.jsp" class="action-btn create"><i class="fas fa-plus"></i> Crear</a>
                        <a href="vehiculos/listar.jsp" class="action-btn view"><i class="fas fa-eye"></i> Ver</a>
                        <a href="vehiculos/editar.jsp" class="action-btn edit"><i class="fas fa-edit"></i> Modificar</a>
                        <a href="vehiculos/eliminar.jsp" class="action-btn delete"><i class="fas fa-trash"></i> Eliminar</a>
                    </div>
                </div>
                
                <!-- Reportes -->
                <div class="module-card" id="reportesCard">
                    <div class="module-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h3>Reportes de Servicios</h3>
                    <p>Visualiza estadísticas e informes</p>
                    <div class="module-actions">
                        <a href="reportes/ventas.jsp" class="action-btn view"><i class="fas fa-dollar-sign"></i> Ventas</a>
                        <a href="reportes/reservas.jsp" class="action-btn view"><i class="fas fa-calendar"></i> Reservas</a>
                        <a href="reportes/clientes.jsp" class="action-btn view"><i class="fas fa-user"></i> Clientes</a>
                        <a href="reportes/vehiculos.jsp" class="action-btn view"><i class="fas fa-car"></i> Vehículos</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-section">
                <h3>CarRent Admin</h3>
                <p>Sistema de administración para empresa de renta de vehículos</p>
            </div>
            <div class="footer-section">
                <h3>Enlaces Rápidos</h3>
                <ul>
                    <li><a href="ayuda.jsp">Ayuda</a></li>
                    <li><a href="soporte.jsp">Soporte Técnico</a></li>
                    <li><a href="manual.jsp">Manual de Usuario</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Contacto</h3>
                <p><i class="fas fa-envelope"></i> soporte@carrent.com</p>
                <p><i class="fas fa-phone"></i> (123) 456-7890</p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 CarRent - Todos los derechos reservados</p>
        </div>
    </footer>

    <script src="js/dashboardAdmin.js"></script>
</body>
</html>
