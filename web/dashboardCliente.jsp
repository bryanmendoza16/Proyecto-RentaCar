<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi cuenta - Renta Car FCB</title>
    <link rel="stylesheet" href="css/dashboardCliente.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">
            <img src="images/logo.png" alt="Logo Renta de Carros">
            <h1>Renta Car FCB</h1>
        </div>
        <div class="nav-links">
            <a href="home.jsp" class="nav-link"><i class="fas fa-home"></i> Inicio</a>
            <a href="catalogo.jsp" class="nav-link"><i class="fas fa-car"></i> Catálogo</a>
            <a href="dashboardCliente.jsp" class="nav-link active"><i class="fas fa-user"></i> Mi Cuenta</a>
            
        </div>
        <div class="user-menu">
            <span class="user-name">
                <i class="fas fa-user-circle"></i>
                <%= session.getAttribute("nombreCliente") != null ? session.getAttribute("nombreCliente") : "Cliente" %>
            </span>
            <div class="dropdown-content">
                <a href="home.jsp"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
            </div>
        </div>
        <button class="menu-toggle">
            <i class="fas fa-bars"></i>
        </button>
    </nav>
    
    <!-- Contenido Principal -->
    <main class="dashboard-container">
        <div class="welcome-banner">
            <div class="welcome-text">
                <h2>Bienvenido(a), <%= session.getAttribute("nombreCliente") != null ? session.getAttribute("nombreCliente") : "Cliente" %></h2>
                <p>Gestiona tus reservaciones y encuentra los mejores vehículos para tu próximo viaje.</p>
            </div>
            <div class="welcome-image">
                <img src="images/dashboard-illustration.png" alt="Ilustración Dashboard">
            </div>
        </div>
        
 
        
        <!-- Sección principal de funciones -->
        <section class="main-features">
            <h2 class="section-title">Mis Servicios</h2>
            
            <div class="features-grid">
                <!-- Tarjeta de Reservaciones -->
                <div class="feature-card" id="reservations-card">
                    <div class="card-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <div class="card-content">
                        <h3>Mis Reservaciones</h3>
                        <p>Gestiona tus reservaciones actuales y revisa el historial.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> Ver reservaciones activas</li>
                            <li><i class="fas fa-check"></i> Modificar reservaciones</li>
                            <li><i class="fas fa-check"></i> Cancelar reservaciones</li>
                            <li><i class="fas fa-check"></i> Ver historial</li>
                        </ul>
                        <a href="misReservaciones.jsp" class="btn primary-btn">Ver Mis Reservaciones</a>
                    </div>
                </div>
                
                <!-- Tarjeta de Nueva Reservación -->
                <div class="feature-card" id="new-reservation-card">
                    <div class="card-icon">
                        <i class="fas fa-plus-circle"></i>
                    </div>
                    <div class="card-content">
                        <h3>Nueva Reservación</h3>
                        <p>Encuentra y reserva el vehículo perfecto para tu próximo viaje.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> Buscar vehículos disponibles</li>
                            <li><i class="fas fa-check"></i> Comparar modelos y precios</li>
                            <li><i class="fas fa-check"></i> Personalizar extras y servicios</li>
                            <li><i class="fas fa-check"></i> Pago seguro en línea</li>
                        </ul>
                        <a href="nuevaReservacion.jsp" class="btn primary-btn">Reservar Ahora</a>
                    </div>
                </div>
                
                <!-- Tarjeta de Favoritos -->
                <div class="feature-card" id="favorites-card">
                    <div class="card-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <div class="card-content">
                        <h3>Mis Favoritos</h3>
                        <p>Accede rápidamente a los vehículos que más te interesan.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> Guardar vehículos favoritos</li>
                            <li><i class="fas fa-check"></i> Comparar características</li>
                            <li><i class="fas fa-check"></i> Recibir notificaciones de disponibilidad</li>
                            <li><i class="fas fa-check"></i> Reservar desde favoritos</li>
                        </ul>
                        <a href="misFavoritos.jsp" class="btn primary-btn">Ver Favoritos</a>
                    </div>
                </div>
                
                <!-- Tarjeta de Ayuda -->
                <div class="feature-card" id="help-card">
                    <div class="card-icon">
                        <i class="fas fa-question-circle"></i>
                    </div>
                    <div class="card-content">
                        <h3>Centro de Ayuda</h3>
                        <p>Resuelve tus dudas y obtén asistencia cuando la necesites.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> Preguntas frecuentes</li>
                            <li><i class="fas fa-check"></i> Contacto con soporte</li>
                            <li><i class="fas fa-check"></i> Guías de uso</li>
                            <li><i class="fas fa-check"></i> Asistencia en carretera</li>
                        </ul>
                        <a href="ayudaCliente.jsp" class="btn primary-btn">Obtener Ayuda</a>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Sección de actividad reciente -->
        <section class="recent-activity">
            <h2 class="section-title">Actividad Reciente</h2>
            
            <div class="activity-container">
                <div class="activity-item">
                    <div class="activity-icon">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <div class="activity-details">
                        <h4>Reservación Confirmada</h4>
                        <p>Toyota Corolla - 15/05/2025 al 20/05/2025</p>
                        <span class="activity-time">Hace 2 días</span>
                    </div>
                    <div class="activity-action">
                        <a href="detalleReservacion.jsp?id=1234" class="btn secondary-btn">Ver</a>
                    </div>
                </div>
                
                <div class="activity-item">
                    <div class="activity-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <div class="activity-details">
                        <h4>Vehículo Añadido a Favoritos</h4>
                        <p>Nissan Sentra - Sedán Compacto</p>
                        <span class="activity-time">Hace 4 días</span>
                    </div>
                    <div class="activity-action">
                        <a href="detalleVehiculo.jsp?id=2345" class="btn secondary-btn">Ver</a>
                    </div>
                </div>
                
                <div class="activity-item">
                    <div class="activity-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div class="activity-details">
                        <h4>Puntos de Lealtad Añadidos</h4>
                        <p>+ 50 puntos por tu última reservación</p>
                        <span class="activity-time">Hace 1 semana</span>
                    </div>
                    <div class="activity-action">
                        <a href="puntosLealtad.jsp" class="btn secondary-btn">Ver</a>
                    </div>
                </div>
            </div>
            
            <a href="todasActividades.jsp" class="ver-todo">Ver toda la actividad <i class="fas fa-arrow-right"></i></a>
        </section>
        
        <!-- Sección de recomendaciones -->
        <section class="recommendations">
            <h2 class="section-title">Recomendados para ti</h2>
            
            <div class="cars-carousel">
                <div class="car-card">
                    <div class="car-image">
                        <img src="images/cars/suv-premium.jpg" alt="SUV Premium">
                        <span class="car-tag">Popular</span>
                    </div>
                    <div class="car-details">
                        <h3>SUV Premium</h3>
                        <p class="car-category">Toyota RAV4 o similar</p>
                        <div class="car-features">
                            <span><i class="fas fa-user"></i> 5</span>
                            <span><i class="fas fa-suitcase"></i> 3</span>
                            <span><i class="fas fa-gas-pump"></i> Híbrido</span>
                            <span><i class="fas fa-snowflake"></i> A/C</span>
                        </div>
                        <div class="car-price">
                            <span class="price">$85</span> / día
                        </div>
                        <a href="reservarVehiculo.jsp?id=3456" class="btn primary-btn">Reservar Ahora</a>
                    </div>
                </div>
                
                <div class="car-card">
                    <div class="car-image">
                        <img src="images/cars/sedan-economico.jpg" alt="Sedán Económico">
                        <span class="car-tag">Oferta</span>
                    </div>
                    <div class="car-details">
                        <h3>Sedán Económico</h3>
                        <p class="car-category">Nissan Versa o similar</p>
                        <div class="car-features">
                            <span><i class="fas fa-user"></i> 5</span>
                            <span><i class="fas fa-suitcase"></i> 2</span>
                            <span><i class="fas fa-gas-pump"></i> Gasolina</span>
                            <span><i class="fas fa-snowflake"></i> A/C</span>
                        </div>
                        <div class="car-price">
                            <span class="price">$45</span> / día
                        </div>
                        <a href="reservarVehiculo.jsp?id=4567" class="btn primary-btn">Reservar Ahora</a>
                    </div>
                </div>
                
                <div class="car-card">
                    <div class="car-image">
                        <img src="images/cars/convertible.jpg" alt="Convertible">
                        <span class="car-tag">Premium</span>
                    </div>
                    <div class="car-details">
                        <h3>Convertible</h3>
                        <p class="car-category">Ford Mustang o similar</p>
                        <div class="car-features">
                            <span><i class="fas fa-user"></i> 4</span>
                            <span><i class="fas fa-suitcase"></i> 2</span>
                            <span><i class="fas fa-gas-pump"></i> Gasolina</span>
                            <span><i class="fas fa-snowflake"></i> A/C</span>
                        </div>
                        <div class="car-price">
                            <span class="price">$120</span> / día
                        </div>
                        <a href="reservarVehiculo.jsp?id=5678" class="btn primary-btn">Reservar Ahora</a>
                    </div>
                </div>
            </div>
            
            <a href="catalogo.jsp" class="ver-todo">Ver catálogo completo <i class="fas fa-arrow-right"></i></a>
        </section>
    </main>
    
    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section about">
                <h3>AutoRent Elite</h3>
                <p>Tu mejor opción para rentar vehículos con calidad y confianza.</p>
                <div class="contact">
                    <span><i class="fas fa-phone"></i> +123 456 789</span>
                    <span><i class="fas fa-envelope"></i> info@autorentelite.com</span>
                </div>
            </div>
            <div class="footer-section links">
                <h3>Enlaces Rápidos</h3>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="catalogo.jsp">Catálogo</a></li>
                    <li><a href="promociones.jsp">Promociones</a></li>
                    <li><a href="requisitos.jsp">Requisitos</a></li>
                    <li><a href="ubicaciones.jsp">Ubicaciones</a></li>
                </ul>
            </div>
            <div class="footer-section resources">
                <h3>Recursos</h3>
                <ul>
                    <li><a href="ayuda.jsp">Centro de Ayuda</a></li>
                    <li><a href="faq.jsp">Preguntas Frecuentes</a></li>
                    <li><a href="terminos.jsp">Términos y Condiciones</a></li>
                    <li><a href="privacidad.jsp">Política de Privacidad</a></li>
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
                <div class="newsletter">
                    <p>Suscríbete a nuestro boletín</p>
                    <form action="newsletter.jsp" method="post">
                        <input type="email" name="email" placeholder="Tu correo electrónico">
                        <button type="submit"><i class="fas fa-paper-plane"></i></button>
                    </form>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            &copy; 2025 AutoRent Elite. Todos los derechos reservados.
        </div>
    </footer>
    
    <script src="js/dashboardCliente.js"></script>
</body>
</html>