<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Empleado - Sistema de Renta de Carros</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboardEmpleado.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">
            <i class="fas fa-car"></i>
            <h1>CarRent Empleado</h1>
        </div>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/index.jsp" class="nav-link"><i class="fas fa-home"></i> Inicio</a>
            <a href="${pageContext.request.contextPath}/JSPEmpleado/dashboardEmpleado.jsp" class="nav-link active"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        </div>
        <div class="user-menu">
            <span class="user-name">
                <i class="fas fa-user-circle"></i>
                <%= session.getAttribute("nombreEmpleado") != null ? session.getAttribute("nombreEmpleado") : "Empleado" %>
            </span>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/JSPEmpleado/logout.jsp"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
            </div>
        </div>
    </nav>

    <!-- Contenido Principal -->
    <main class="dashboard-container">
        <h2 class="dashboard-title">Panel de Control - Empleado</h2>
        
        <div class="welcome-section">
            <h3>Bienvenido(a), <%= session.getAttribute("nombreEmpleado") != null ? session.getAttribute("nombreEmpleado") : "Empleado" %>!</h3>
            <p class="date-time">Fecha: <span id="current-date"></span> | Hora: <span id="current-time"></span></p>
        </div>
        
        <div class="cards-container">
            <!-- Tarjeta Reservaciones -->
            <div class="card" id="reservaciones-card">
                <div class="card-icon">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div class="card-content">
                    <h3>Reservaciones</h3>
                    <p>Gestiona las reservaciones de vehículos</p>
                    <div class="card-actions">
                        <a href="${pageContext.request.contextPath}/RentaServlet?action=new" class="btn primary-btn">Nueva Reservación</a>
                        <a href="${pageContext.request.contextPath}/RentaServlet" class="btn secondary-btn">Ver Todas</a>
                    </div>
                </div>
            </div>
            
            <!-- Tarjeta Facturación -->
            <div class="card" id="facturacion-card">
                <div class="card-icon">
                    <i class="fas fa-file-invoice-dollar"></i>
                </div>
                <div class="card-content">
                    <h3>Facturación</h3>
                    <p>Genera y administra facturas para clientes</p>
                    <div class="card-actions">
                        <a href="${pageContext.request.contextPath}/FacturaServlet?action=new" class="btn primary-btn">Nueva Factura</a>
                        <a href="${pageContext.request.contextPath}/FacturaServlet" class="btn secondary-btn">Ver Facturas</a>
                    </div>
                </div>
            </div>
            
            <!-- Tarjeta Clientes -->
            <div class="card" id="clientes-card">
                <div class="card-icon">
                    <i class="fas fa-users"></i>
                </div>
                <div class="card-content">
                    <h3>Clientes</h3>
                    <p>Administra los datos de los clientes</p>
                    <div class="card-actions">
                        <a href="${pageContext.request.contextPath}/JSPEmpleado/formCliente.jsp" class="btn primary-btn">Nuevo Cliente</a>
                        <a href="${pageContext.request.contextPath}/clienteServlet?action=list" class="btn secondary-btn">Ver Clientes</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section about">
                <h3>AutoRent Elite</h3>
                <p>Sistema de gestión de renta de automóviles para empleados.</p>
                <div class="contact">
                    <span><i class="fas fa-phone"></i> +123 456 789</span>
                    <span><i class="fas fa-envelope"></i> soporte@autorentelite.com</span>
                </div>
            </div>
            <div class="footer-section links">
                <h3>Enlaces Rápidos</h3>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/ayuda.jsp">Ayuda</a></li>
                    <li><a href="${pageContext.request.contextPath}/soporte.jsp">Soporte Técnico</a></li>
                    <li><a href="${pageContext.request.contextPath}/terminos.jsp">Términos de Uso</a></li>
                    <li><a href="${pageContext.request.contextPath}/privacidad.jsp">Política de Privacidad</a></li>
                </ul>
            </div>
            <div class="footer-section social">
                <h3>Síguenos</h3>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            &copy; 2025 AutoRent Elite. Todos los derechos reservados.
        </div>
    </footer>
    
    <script src="${pageContext.request.contextPath}/js/dashboardEmpleado.js"></script>
</body>
</html>
