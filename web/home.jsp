<!-- home.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Renta Car - Servicio de Alquiler de Vehículos</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }
        
        body {
            background-color: #f5f5f5;
            color: #333;
        }
        
        .navbar {
            background-color: #2c3e50;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 50px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }
        
        .logo {
            color: #ecf0f1;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }
        
        .nav-links {
            display: flex;
            list-style: none;
        }
        
        .nav-links li {
            margin-left: 25px;
        }
        
        .nav-links a {
            color: #ecf0f1;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease;
        }
        
        .nav-links a:hover {
            color: #3498db;
        }
        
        .btn-login {
            background-color: #3498db;
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .btn-login:hover {
            background-color: #2980b9;
        }
        
        .hero {
            height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://source.unsplash.com/random/1600x900/?car') no-repeat center center/cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            padding-top: 70px;
        }
        
        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
            animation: fadeIn 1.5s ease;
        }
        
        .hero p {
            font-size: 20px;
            max-width: 700px;
            margin-bottom: 30px;
            animation: fadeIn 2s ease;
        }
        
        .btn-primary {
            background-color: #3498db;
            color: white;
            padding: 12px 25px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
            animation: fadeIn 2.5s ease;
        }
        
        .btn-primary:hover {
            background-color: #2980b9;
        }
        
        .section {
            padding: 80px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .section-title {
            text-align: center;
            font-size: 36px;
            margin-bottom: 50px;
            color: #2c3e50;
        }
        
        .services {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        
        .service-item {
            flex: 0 0 calc(33.33% - 20px);
            margin-bottom: 40px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }
        
        .service-item:hover {
            transform: translateY(-10px);
        }
        
        .service-icon {
            font-size: 48px;
            color: #3498db;
            margin-bottom: 20px;
        }
        
        .service-title {
            font-size: 24px;
            margin-bottom: 15px;
            color: #2c3e50;
        }
        
        .mission-vision {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .mission, .vision {
            flex: 0 0 48%;
            padding: 40px;
        }
        
        .mission h3, .vision h3 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #2c3e50;
        }
        
        .contact-form {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 0 auto;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        
        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        
        .form-control:focus {
            border-color: #3498db;
            outline: none;
        }
        
        textarea.form-control {
            height: 150px;
            resize: vertical;
        }
        
        .footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 30px 0;
        }
        
        .social-links {
            margin-top: 20px;
        }
        
        .social-icon {
            color: white;
            font-size: 24px;
            margin: 0 10px;
            transition: color 0.3s ease;
        }
        
        .social-icon:hover {
            color: #3498db;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        @media (max-width: 768px) {
            .navbar {
                padding: 15px 20px;
                flex-direction: column;
            }
            
            .nav-links {
                margin-top: 15px;
            }
            
            .hero h1 {
                font-size: 36px;
            }
            
            .service-item {
                flex: 0 0 100%;
            }
            
            .mission, .vision {
                flex: 0 0 100%;
            }
        }
    </style>
    <style>
    .login-section {
        padding: 80px 0;
        background-color: #f8f9fa;
    }
    
    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 15px;
    }
    
    .login-wrapper {
        display: flex;
        flex-wrap: wrap;
        gap: 40px;
        align-items: center;
        justify-content: center;
    }
    
    .login-info {
        flex: 1;
        min-width: 300px;
        max-width: 500px;
    }
    
    .login-info h2 {
        margin-bottom: 20px;
        color: #333;
    }
    
    .benefits-list {
        margin-top: 30px;
        padding-left: 0;
        list-style: none;
    }
    
    .benefits-list li {
        margin-bottom: 12px;
        display: flex;
        align-items: center;
    }
    
    .benefits-list i {
        color: #28a745;
        margin-right: 10px;
    }
    
    .login-form-container {
        flex: 1;
        min-width: 300px;
        max-width: 450px;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        padding: 30px;
    }
    
    .login-form h3 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }
    
    .form-group {
        margin-bottom: 20px;
    }
    
    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: 500;
    }
    
    .form-control {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 16px;
    }
    
    .form-options {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        font-size: 14px;
    }
    
    .remember-me {
        display: flex;
        align-items: center;
    }
    
    .remember-me input {
        margin-right: 5px;
    }
    
    .forgot-password {
        color: #007bff;
        text-decoration: none;
    }
    
    .btn-block {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        text-align: center;
    }
    
    .btn-primary {
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    
    .btn-primary:hover {
        background-color: #0069d9;
    }
    
    .social-login {
        margin-top: 25px;
        text-align: center;
    }
    
    .social-buttons {
        display: flex;
        gap: 10px;
        margin-top: 10px;
    }
    
    .btn-social {
        flex: 1;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        background-color: white;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    
    .btn-google:hover {
        background-color: #f8f9fa;
    }
    
    .btn-facebook {
        background-color: #3b5998;
        color: white;
    }
    
    .btn-facebook:hover {
        background-color: #344e86;
    }
    
    .register-prompt {
        margin-top: 30px;
        text-align: center;
        padding-top: 20px;
        border-top: 1px solid #eee;
    }
    
    .btn-secondary {
        display: inline-block;
        background-color: #6c757d;
        color: white;
        padding: 10px 20px;
        border-radius: 4px;
        text-decoration: none;
        margin: 10px 0;
        transition: background-color 0.3s;
    }
    
    .btn-secondary:hover {
        background-color: #5a6268;
    }
    
    .small-text {
        font-size: 14px;
        color: #6c757d;
    }
    
    @media (max-width: 768px) {
        .login-wrapper {
            flex-direction: column;
        }
        
        .login-info, .login-form-container {
            max-width: 100%;
        }
    }
</style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <!-- Barra de navegación -->
    <nav class="navbar">
        <a href="#" class="logo">Renta Car FCB</a>
        <ul class="nav-links">
            <li><a href="#inicio">Inicio</a></li>
            <li><a href="#informacion">Información</a></li>
            <li><a href="#mision-vision">Misión y Visión</a></li>
            <li><a href="#contacto">Contacto</a></li>
            <li><a href="index.jsp" class="btn-login">Iniciar Sesión</a></li>
        </ul>
    </nav>

    <!-- Sección Hero 
    <section id="inicio" class="hero">
        <h1>Alquiler de Vehículos Premium</h1>
        <p>Ofrecemos la mejor selección de vehículos para todas tus necesidades con precios competitivos y servicio excepcional.</p>
        <a href="#informacion" class="btn-primary">Conoce Más</a>
    </section>-->
    <section id="inicio" class="hero" style="background-image: url('css/multimedia/fondoinicio.jpeg'); background-size: cover; background-position: center; position: relative;">
    <!-- Overlay opcional para mejorar la legibilidad del texto -->
    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5);"></div>
    
    <!-- Contenido con posición relativa para que aparezca sobre el overlay -->
    <div style="position: relative; z-index: 2; color: white; text-align: center; padding: 80px 20px;">
        <h1>Alquiler de Vehículos Premium</h1>
        <p>Ofrecemos la mejor selección de vehículos para todas tus necesidades con precios competitivos y servicio excepcional.</p>
        <a href="#informacion" class="btn-primary">Conoce Más</a>
    </div>
</section>

    <!-- Información de la empresa -->
    <section id="informacion" class="section">
        <h2 class="section-title">Nuestros Servicios</h2>
        <div class="services">
            <div class="service-item">
                <div class="service-icon">
                    <i class="fas fa-car"></i>
                </div>
                <h3 class="service-title">Amplia Flota</h3>
                <p>Contamos con una amplia variedad de vehículos modernos para satisfacer todas tus necesidades de transporte.</p>
            </div>
            <div class="service-item">
                <div class="service-icon">
                    <i class="fas fa-money-bill-wave"></i>
                </div>
                <h3 class="service-title">Precios Accesibles</h3>
                <p>Ofrecemos las tarifas más competitivas del mercado, con planes especiales para clientes frecuentes.</p>
            </div>
            <div class="service-item">
                <div class="service-icon">
                    <i class="fas fa-headset"></i>
                </div>
                <h3 class="service-title">Atención 24/7</h3>
                <p>Nuestro equipo de atención al cliente está disponible las 24 horas para resolver cualquier duda o emergencia.</p>
            </div>
            <div class="service-item">
                <div class="service-icon">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h3 class="service-title">Seguridad Garantizada</h3>
                <p>Todos nuestros vehículos cuentan con seguro completo y pasan por revisiones técnicas periódicas.</p>
            </div>
            <div class="service-item">
                <div class="service-icon">
                    <i class="fas fa-map-marked-alt"></i>
                </div>
                <h3 class="service-title">Cobertura Nacional</h3>
                <p>Ofrecemos servicio en todo el país, con puntos de entrega y recogida en las principales ciudades.</p>
            </div>
            <div class="service-item">
                <div class="service-icon">
                    <i class="fas fa-hand-holding-heart"></i>
                </div>
                <h3 class="service-title">Trato Personalizado</h3>
                <p>Cada cliente es único, por eso adaptamos nuestros servicios a tus necesidades específicas.</p>
            </div>
        </div>
    </section>

    <!-- Misión y Visión -->
    <section id="mision-vision" class="section">
        <h2 class="section-title">Misión y Visión</h2>
        <div class="mission-vision">
            <div class="mission">
                <h3>Nuestra Misión</h3>
                <p>Proporcionar soluciones de movilidad eficientes y confiables a nuestros clientes, ofreciendo una amplia gama de vehículos y un servicio excepcional que supere sus expectativas. Nos comprometemos a mantener una flota moderna, segura y en perfecto estado, para garantizar la plena satisfacción y confianza de quienes nos eligen.</p>
            </div>
            <div class="vision">
                <h3>Nuestra Visión</h3>
                <p>Ser reconocidos como la empresa líder en el servicio de alquiler de vehículos, destacándonos por la calidad, innovación y atención personalizada. Aspiramos a expandir nuestra presencia a nivel nacional, manteniendo los más altos estándares de calidad y compromiso con la satisfacción del cliente y el cuidado del medio ambiente.</p>
            </div>
        </div>
    </section>

    <!-- Contacto -->
<section id="contacto" class="section">
    <h2 class="section-title">Contacto</h2>
    <div class="contact-form">
    <div class="contact-info">
        <div class="contact-item">
            <i class="fas fa-phone"></i>
            <p><strong>Teléfono Fijo:</strong> (01) 555-7842</p>
        </div>
        <div class="contact-item">
            <i class="fab fa-whatsapp"></i>
            <p><strong>WhatsApp:</strong> +34 623 456 789</p>
        </div>
        <div class="contact-item">
            <i class="fas fa-envelope"></i>
            <p><strong>Correo:</strong> info@tuempresa.com</p>
        </div>
        <div class="contact-item">
            <i class="fas fa-map-marker-alt"></i>
            <p><strong>Dirección:</strong> Calle Principal 123, Piso 4, 28001 Madrid, España</p>
        </div>
        <div class="contact-item">
            <i class="fas fa-clock"></i>
            <p><strong>Horario:</strong> Lunes a Viernes 9:00 - 18:00</p>
        </div>
        <div class="social-media">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-linkedin"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
    </div>
        </div>
</section>
<section id="login" class="login-section">
    <div class="container">
        <div class="login-wrapper">
            <div class="login-form-container">
                <form class="login-form">
                    <div class="login-info">
                <h2>Accede a tu cuenta</h2>
                <p>Inicia sesión para comenzar a hacer tus reservaciones de vehículos premium y disfrutar de beneficios exclusivos.</p>
                <ul class="benefits-list">
                    <li><i class="fas fa-check-circle"></i> Reservas más rápidas</li>
                    <li><i class="fas fa-check-circle"></i> Descuentos para clientes registrados</li>
                    <li><i class="fas fa-check-circle"></i> Historial de alquileres</li>
                    <li><i class="fas fa-check-circle"></i> Notificaciones de ofertas especiales</li>
                </ul>
            </div>
                    <h3>Iniciar sesión</h3>
                    
                    <a href="index.jsp" class="btn-login">Iniciar Sesión</a>
                    
                </form> 
            </div>
        </div>
    </div>
</section>


    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2025 AutoRent - Todos los derechos reservados</p>
        <div class="social-links">
            <a href="#" class="social-icon"><i class="fab fa-facebook"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-linkedin"></i></a>
        </div>
    </footer>

    <script>
        // Animación simple para scroll suave
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
        
        // Animación para la barra de navegación al hacer scroll
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 100) {
                navbar.style.backgroundColor = 'rgba(44, 62, 80, 0.95)';
                navbar.style.padding = '10px 50px';
            } else {
                navbar.style.backgroundColor = '#2c3e50';
                navbar.style.padding = '15px 50px';
            }
        });
    </script>
</body>
</html>