/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// Función para mostrar fecha y hora actual
function updateDateTime() {
    const now = new Date();
    
    // Formatear fecha: DD/MM/YYYY
    const day = String(now.getDate()).padStart(2, '0');
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const year = now.getFullYear();
    const formattedDate = `${day}/${month}/${year}`;
    
    // Formatear hora: HH:MM:SS
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    const formattedTime = `${hours}:${minutes}:${seconds}`;
    
    // Actualizar los elementos en el DOM
    document.getElementById('current-date').textContent = formattedDate;
    document.getElementById('current-time').textContent = formattedTime;
}

// Actualizar fecha y hora cada segundo
setInterval(updateDateTime, 1000);
updateDateTime(); // Llamada inicial

// Animaciones para cards
document.addEventListener('DOMContentLoaded', function() {
    // Agregar clase para animación de entrada
    const cards = document.querySelectorAll('.card');
    cards.forEach((card, index) => {
        setTimeout(() => {
            card.style.opacity = '1';
            card.style.transform = 'translateY(0)';
        }, 100 * index);
    });
    
    // Efecto hover para las tarjetas
    const allCards = document.querySelectorAll('.card');
    allCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            // Añadir efecto de elevación y sombra
            this.style.transform = 'translateY(-10px)';
            this.style.boxShadow = '0 15px 30px rgba(0, 0, 0, 0.2)';
            
            // Efecto de brillo en el icono
            const icon = this.querySelector('.card-icon');
            icon.style.transform = 'scale(1.1)';
            icon.style.transition = 'transform 0.3s ease';
        });
        
        card.addEventListener('mouseleave', function() {
            // Restaurar estado original
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = '0 4px 8px rgba(0, 0, 0, 0.1)';
            
            // Restaurar icono
            const icon = this.querySelector('.card-icon');
            icon.style.transform = 'scale(1)';
        });
    });

    // Animación para actividades recientes
    const activityItems = document.querySelectorAll('.activity-item');
    activityItems.forEach((item, index) => {
        item.style.opacity = '0';
        item.style.transform = 'translateX(-20px)';
        
        setTimeout(() => {
            item.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
            item.style.opacity = '1';
            item.style.transform = 'translateX(0)';
        }, 200 + (100 * index));
    });

    // Animar el dropdown del menú de usuario
    const userMenu = document.querySelector('.user-menu');
    const dropdownContent = document.querySelector('.dropdown-content');
    
    userMenu.addEventListener('mouseenter', function() {
        const menuItems = dropdownContent.querySelectorAll('a');
        menuItems.forEach((item, index) => {
            item.style.opacity = '0';
            item.style.transform = 'translateY(-10px)';
            
            setTimeout(() => {
                item.style.transition = 'opacity 0.3s ease, transform 0.3s ease';
                item.style.opacity = '1';
                item.style.transform = 'translateY(0)';
            }, 50 * index);
        });
    });
});

// Animación para botones
const buttons = document.querySelectorAll('.btn');
buttons.forEach(button => {
    button.addEventListener('mouseenter', function() {
        this.style.transition = 'transform 0.3s ease';
        this.style.transform = 'translateY(-2px)';
    });
    
    button.addEventListener('mouseleave', function() {
        this.style.transform = 'translateY(0)';
    });
    
    button.addEventListener('click', function(e) {
        // Crea efecto de onda al hacer clic
        let ripple = document.createElement('span');
        ripple.classList.add('ripple-effect');
        
        const buttonRect = this.getBoundingClientRect();
        const size = Math.max(buttonRect.width, buttonRect.height);
        
        ripple.style.width = ripple.style.height = `${size}px`;
        ripple.style.left = `${e.clientX - buttonRect.left - size/2}px`;
        ripple.style.top = `${e.clientY - buttonRect.top - size/2}px`;
        
        this.appendChild(ripple);
        
        setTimeout(() => {
            ripple.remove();
        }, 600);
    });
});

// Simulación de notificaciones (para demostración)
function simularNotificacion() {
    // Lista de posibles notificaciones
    const notificaciones = [
        {
            icon: 'fas fa-calendar-check',
            title: 'Nueva reservación recibida: Toyota Camry',
            time: 'Justo ahora'
        },
        {
            icon: 'fas fa-user-plus',
            title: 'Nuevo cliente registrado: Laura Martínez',
            time: 'Justo ahora'
        },
        {
            icon: 'fas fa-user-plus',
            title: 'Nuevo cliente registrado: Laura Martínez',
            time: 'Justo ahora'
        },
        {
            icon: 'fas fa-car',
            title: 'Vehículo devuelto: Honda Civic (Placa: XYZ-5678)',
            time: 'Justo ahora'
        },
        {
            icon: 'fas fa-file-invoice-dollar',
            title: 'Factura #F-2023-090 generada exitosamente',
            time: 'Justo ahora'
        }
    ];
    
    // Seleccionar una notificación aleatoria
    const notificacion = notificaciones[Math.floor(Math.random() * notificaciones.length)];
    
    // Crear elemento de notificación
    const notificacionElement = document.createElement('div');
    notificacionElement.className = 'notification';
    notificacionElement.innerHTML = `
        <div class="notification-icon">
            <i class="${notificacion.icon}"></i>
        </div>
        <div class="notification-content">
            <p>${notificacion.title}</p>
            <span>${notificacion.time}</span>
        </div>
        <div class="notification-close">
            <i class="fas fa-times"></i>
        </div>
    `;
    
    // Agregar al DOM
    document.body.appendChild(notificacionElement);
    
    // Animar entrada
    setTimeout(() => {
        notificacionElement.classList.add('show');
    }, 100);
    
    // Configurar cierre automático
    setTimeout(() => {
        notificacionElement.classList.remove('show');
        setTimeout(() => {
            notificacionElement.remove();
        }, 500);
    }, 5000);
    
    // Agregar funcionalidad al botón de cierre
    const closeBtn = notificacionElement.querySelector('.notification-close');
    closeBtn.addEventListener('click', function() {
        notificacionElement.classList.remove('show');
        setTimeout(() => {
            notificacionElement.remove();
        }, 500);
    });
    
    // Agregar a la lista de actividades recientes (solo para demostración)
    const activityList = document.querySelector('.activity-list');
    const newActivity = document.createElement('div');
    newActivity.className = 'activity-item';
    newActivity.style.opacity = '0';
    newActivity.style.transform = 'translateX(-20px)';
    
    newActivity.innerHTML = `
        <div class="activity-icon"><i class="${notificacion.icon}"></i></div>
        <div class="activity-details">
            <p class="activity-title">${notificacion.title}</p>
            <p class="activity-time">${notificacion.time}</p>
        </div>
    `;
    
    // Insertar al principio de la lista
    activityList.insertBefore(newActivity, activityList.firstChild);
    
    // Animar entrada
    setTimeout(() => {
        newActivity.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
        newActivity.style.opacity = '1';
        newActivity.style.transform = 'translateX(0)';
    }, 100);
    
    // Limitar a 4 items
    if (activityList.children.length > 4) {
        activityList.removeChild(activityList.lastChild);
    }
}

// Simular notificaciones aleatorias (para demostración)
// Descomentar para activar las notificaciones simuladas
/*
setTimeout(() => {
    // Primera notificación después de 10 segundos
    simularNotificacion();
    
    // Luego, notificaciones aleatorias entre 30 y 90 segundos
    setInterval(() => {
        simularNotificacion();
    }, Math.random() * 60000 + 30000);
}, 10000);
*/

// Añadir efecto de carga para simular acciones de los botones
document.querySelectorAll('.btn').forEach(button => {
    button.addEventListener('click', function(e) {
        // Prevenir la navegación real para la demostración
        // Descomentar para demostración, comentar para producción
        // e.preventDefault();
        
        const originalText = this.textContent;
        const originalWidth = this.offsetWidth;
        
        // Mantener el ancho para evitar saltos
        this.style.width = `${originalWidth}px`;
        this.style.textAlign = 'center';
        
        // Mostrar cargando
        this.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';
        
        // Simular carga
        setTimeout(() => {
            this.innerHTML = originalText;
            this.style.width = '';
        }, 1000);
    });
});

// Dashboard personalizado - estadísticas simuladas
function cargarEstadisticas() {
    // Esta función simularía la carga de estadísticas desde el servidor
    // Por ahora usamos datos simulados
    
    const hoy = new Date();
    const semana = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];
    const diaSemana = semana[hoy.getDay()];
    
    // Simular mayor o menor actividad según el día
    const factorActividad = {
        'Lunes': 0.7,
        'Martes': 0.8,
        'Miércoles': 0.9,
        'Jueves': 1.0,
        'Viernes': 1.2,
        'Sábado': 1.5,
        'Domingo': 0.6
    };
    
    const factor = factorActividad[diaSemana];
    
    // Estadísticas simuladas para el dashboard
    const estadisticas = {
        reservasHoy: Math.floor(Math.random() * 5 * factor) + 1,
        facturasHoy: Math.floor(Math.random() * 4 * factor) + 1,
        clientesNuevos: Math.floor(Math.random() * 3 * factor),
        vehiculosEntregados: Math.floor(Math.random() * 4 * factor),
        vehiculosRecibidos: Math.floor(Math.random() * 3 * factor)
    };
    
    // Actualizar pequeños contadores en las tarjetas (se añadirían al HTML)
    const badges = document.querySelectorAll('.stat-badge');
    if (badges.length > 0) {
        badges[0].textContent = estadisticas.reservasHoy;
        badges[1].textContent = estadisticas.facturasHoy;
        badges[2].textContent = estadisticas.clientesNuevos;
        badges[3].textContent = estadisticas.vehiculosEntregados + ' / ' + estadisticas.vehiculosRecibidos;
    }
}

// Preparar el efecto de pantalla de carga inicial
document.addEventListener('DOMContentLoaded', function() {
    const loader = document.createElement('div');
    loader.className = 'page-loader';
    loader.innerHTML = `
        <div class="loader-content">
            <div class="spinner"></div>
            <p>Cargando Panel de Control...</p>
        </div>
    `;
    
    document.body.appendChild(loader);
    
    // Simular tiempo de carga
    setTimeout(function() {
        loader.classList.add('fade-out');
        setTimeout(function() {
            loader.remove();
            document.body.classList.add('loaded');
            
            // Cargar estadísticas simuladas
            cargarEstadisticas();
        }, 500);
    }, 1000);
});

// Manejar notificaciones del sistema
function mostrarMensajeSistema(mensaje, tipo = 'info') {
    const toast = document.createElement('div');
    toast.className = `system-toast ${tipo}`;
    
    // Iconos según el tipo de mensaje
    const iconos = {
        'success': 'fas fa-check-circle',
        'error': 'fas fa-exclamation-circle',
        'warning': 'fas fa-exclamation-triangle',
        'info': 'fas fa-info-circle'
    };
    
    toast.innerHTML = `
        <div class="toast-icon">
            <i class="${iconos[tipo]}"></i>
        </div>
        <div class="toast-message">${mensaje}</div>
        <div class="toast-close">
            <i class="fas fa-times"></i>
        </div>
    `;
    
    // Contenedor para los mensajes
    let toastContainer = document.querySelector('.toast-container');
    
    if (!toastContainer) {
        toastContainer = document.createElement('div');
        toastContainer.className = 'toast-container';
        document.body.appendChild(toastContainer);
    }
    
    toastContainer.appendChild(toast);
    
    // Animar entrada
    setTimeout(() => {
        toast.classList.add('show');
    }, 10);
    
    // Auto ocultar después de un tiempo
    setTimeout(() => {
        toast.classList.remove('show');
        setTimeout(() => {
            toast.remove();
            
            // Eliminar el contenedor si no hay más mensajes
            if (toastContainer.children.length === 0) {
                toastContainer.remove();
            }
        }, 500);
    }, 5000);
    
    // Botón de cierre
    const closeBtn = toast.querySelector('.toast-close');
    closeBtn.addEventListener('click', function() {
        toast.classList.remove('show');
        setTimeout(() => {
            toast.remove();
            
            // Eliminar el contenedor si no hay más mensajes
            if (toastContainer.children.length === 0) {
                toastContainer.remove();
            }
        }, 500);
    });
}

// Ejemplos de uso (descomentar para pruebas)
// setTimeout(() => mostrarMensajeSistema('Sesión iniciada correctamente', 'success'), 2000);
// setTimeout(() => mostrarMensajeSistema('Su sesión expirará en 5 minutos', 'warning'), 4000);
// setTimeout(() => mostrarMensajeSistema('Error al conectar con el servidor de bases de datos', 'error'), 6000);
// setTimeout(() => mostrarMensajeSistema('Actualizaciones de sistema programadas para esta noche', 'info'), 8000);

// Animación para el menú responsivo en dispositivos móviles
const setupMobileMenu = () => {
    // Crear botón de menú para móviles si no existe ya
    let menuButton = document.querySelector('.mobile-menu-button');
    
    if (!menuButton && window.innerWidth <= 768) {
        menuButton = document.createElement('button');
        menuButton.className = 'mobile-menu-button';
        menuButton.innerHTML = '<i class="fas fa-bars"></i>';
        
        const navbar = document.querySelector('.navbar');
        navbar.insertBefore(menuButton, navbar.firstChild);
        
        // Crear contenedor para menú móvil
        const mobileMenuContainer = document.createElement('div');
        mobileMenuContainer.className = 'mobile-menu-container';
        
        // Clonar los enlaces de navegación
        const navLinks = document.querySelector('.nav-links').cloneNode(true);
        mobileMenuContainer.appendChild(navLinks);
        
        // Clonar el menú de usuario
        const userMenu = document.querySelector('.user-menu .dropdown-content').cloneNode(true);
        mobileMenuContainer.appendChild(userMenu);
        
        document.body.appendChild(mobileMenuContainer);
        
        // Toggle menu al hacer clic
        menuButton.addEventListener('click', function() {
            mobileMenuContainer.classList.toggle('active');
            menuButton.classList.toggle('active');
            
            if (menuButton.classList.contains('active')) {
                menuButton.innerHTML = '<i class="fas fa-times"></i>';
            } else {
                menuButton.innerHTML = '<i class="fas fa-bars"></i>';
            }
        });
        
        // Cerrar menú al hacer clic en un enlace
        mobileMenuContainer.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', function() {
                mobileMenuContainer.classList.remove('active');
                menuButton.classList.remove('active');
                menuButton.innerHTML = '<i class="fas fa-bars"></i>';
            });
        });
    }
};

// Configurar menú móvil al cargar y al cambiar tamaño de ventana
window.addEventListener('load', setupMobileMenu);
window.addEventListener('resize', setupMobileMenu);

// Añadir estilos CSS adicionales para componentes dinámicos
const addDynamicStyles = () => {
    const styleElement = document.createElement('style');
    styleElement.textContent = `
        /* Estilos para el loader de página */
        .page-loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.9);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            transition: opacity 0.5s ease;
        }
        
        .page-loader.fade-out {
            opacity: 0;
        }
        
        .loader-content {
            text-align: center;
        }
        
        .spinner {
            width: 50px;
            height: 50px;
            border: 5px solid rgba(52, 152, 219, 0.2);
            border-radius: 50%;
            border-top-color: var(--primary-color);
            animation: spin 1s linear infinite;
            margin: 0 auto 20px;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        /* Notificaciones */
        .notification {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: var(--white);
            border-left: 4px solid var(--primary-color);
            padding: 15px;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            width: 350px;
            max-width: 90%;
            transform: translateX(120%);
            transition: transform 0.3s ease;
            z-index: 9990;
        }
        
        .notification.show {
            transform: translateX(0);
        }
        
        .notification-icon {
            width: 40px;
            height: 40px;
            background-color: rgba(52, 152, 219, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }
        
        .notification-icon i {
            color: var(--primary-color);
            font-size: 18px;
        }
        
        .notification-content {
            flex: 1;
        }
        
        .notification-content p {
            margin: 0 0 5px;
            font-size: 14px;
            color: var(--text-color);
        }
        
        .notification-content span {
            font-size: 12px;
            color: var(--text-light);
        }
        
        .notification-close {
            margin-left: 15px;
            cursor: pointer;
            color: var(--text-light);
        }
        
        .notification-close:hover {
            color: var(--danger-color);
        }
        
        /* Toast messages */
        .toast-container {
            position: fixed;
            top: 20px;
            right: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            z-index: 9991;
        }
        
        .system-toast {
            background-color: var(--white);
            padding: 15px;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            width: 350px;
            max-width: 90%;
            transform: translateX(120%);
            transition: transform 0.3s ease;
        }
        
        .system-toast.show {
            transform: translateX(0);
        }
        
        .system-toast.success {
            border-left: 4px solid var(--secondary-color);
        }
        
        .system-toast.error {
            border-left: 4px solid var(--danger-color);
        }
        
        .system-toast.warning {
            border-left: 4px solid var(--warning-color);
        }
        
        .system-toast.info {
            border-left: 4px solid var(--primary-color);
        }
        
        .toast-icon {
            width: 30px;
            margin-right: 15px;
            text-align: center;
        }
        
        .toast-icon i {
            font-size: 18px;
        }
        
        .system-toast.success .toast-icon i {
            color: var(--secondary-color);
        }
        
        .system-toast.error .toast-icon i {
            color: var(--danger-color);
        }
        
        .system-toast.warning .toast-icon i {
            color: var(--warning-color);
        }
        
        .system-toast.info .toast-icon i {
            color: var(--primary-color);
        }
        
        .toast-message {
            flex: 1;
            font-size: 14px;
        }
        
        .toast-close {
            margin-left: 15px;
            cursor: pointer;
            color: var(--text-light);
        }
        
        .toast-close:hover {
            color: var(--text-color);
        }
        
        /* Ripple effect */
        .ripple-effect {
            position: absolute;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.4);
            transform: scale(0);
            animation: ripple 0.6s linear;
            pointer-events: none;
        }
        
        @keyframes ripple {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
        
        /* Mobile menu */
        .mobile-menu-button {
            display: none;
            background: none;
            border: none;
            font-size: 24px;
            color: var(--primary-color);
            cursor: pointer;
        }
        
        .mobile-menu-container {
            display: none;
            position: fixed;
            top: 70px;
            left: 0;
            width: 100%;
            height: calc(100% - 70px);
            background-color: var(--white);
            z-index: 99;
            padding: 20px;
            transform: translateX(-100%);
            transition: transform 0.3s ease;
        }
        
        .mobile-menu-container.active {
            transform: translateX(0);
            display: block;
        }
        
        .mobile-menu-container .nav-links {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
        }
        
        .mobile-menu-container a {
            display: block;
            padding: 12px 15px;
            border-radius: var(--border-radius);
            text-decoration: none;
            color: var(--text-color);
            transition: background-color 0.3s ease;
        }
        
        .mobile-menu-container a:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }
        
        @media screen and (max-width: 768px) {
            .mobile-menu-button {
                display: block;
            }
        }
        
        /* Stat badges */
        .stat-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: var(--primary-color);
            color: white;
            border-radius: 50%;
            width: 25px;
            height: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: bold;
        }
    `;
    
    document.head.appendChild(styleElement);
};

addDynamicStyles();

// Esta función verificaría si hay mensajes del sistema o notificaciones pendientes
function verificarNotificacionesSistema() {
    // En un entorno real, esto haría una petición al servidor
    // Para la demostración, usamos un intervalo y probabilidad aleatoria
    
    setInterval(() => {
        // 10% de probabilidad de mostrar un mensaje del sistema
        if (Math.random() < 0.1) {
            const mensajes = [
                { tipo: 'info', texto: 'Recuerde completar todos los campos obligatorios en las reservaciones.' },
                { tipo: 'info', texto: 'Hay nuevas actualizaciones disponibles para el sistema.' },
                { tipo: 'warning', texto: 'Su sesión expirará en 5 minutos por inactividad.' },
                { tipo: 'success', texto: 'Las reservaciones de hoy han sido procesadas correctamente.' }
            ];
            
            const mensaje = mensajes[Math.floor(Math.random() * mensajes.length)];
            mostrarMensajeSistema(mensaje.texto, mensaje.tipo);
        }
    }, 60000); // Verificar cada minuto
}

// Descomentar para habilitar notificaciones aleatorias
// verificarNotificacionesSistema();
        