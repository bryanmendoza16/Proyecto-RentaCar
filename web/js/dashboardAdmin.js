/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Script para el Dashboard de Administración

document.addEventListener('DOMContentLoaded', function() {
    // Inicializar animaciones para elementos que aparecen al cargar la página
    initializeAnimations();
    
    // Agregar eventos para las tarjetas de módulos
    initializeModuleCards();
    
    // Mostrar notificaciones de ejemplo (simuladas)
    showDemoNotifications();
});

/**
 * Inicializa animaciones adicionales para elementos de la página
 */
function initializeAnimations() {
    // Animar aparición del título del dashboard
    const dashboardTitle = document.querySelector('.dashboard-title');
    const dashboardSubtitle = document.querySelector('.dashboard-subtitle');
    
    if (dashboardTitle) {
        dashboardTitle.style.opacity = '0';
        dashboardTitle.style.transform = 'translateY(-20px)';
        
        setTimeout(() => {
            dashboardTitle.style.transition = 'all 0.5s ease';
            dashboardTitle.style.opacity = '1';
            dashboardTitle.style.transform = 'translateY(0)';
        }, 100);
    }
    
    if (dashboardSubtitle) {
        dashboardSubtitle.style.opacity = '0';
        dashboardSubtitle.style.transform = 'translateY(-15px)';
        
        setTimeout(() => {
            dashboardSubtitle.style.transition = 'all 0.5s ease';
            dashboardSubtitle.style.opacity = '1';
            dashboardSubtitle.style.transform = 'translateY(0)';
        }, 300);
    }
    
    // Animar aparición de botones de acción con delay
    const actionButtons = document.querySelectorAll('.action-btn');
    actionButtons.forEach((button, index) => {
        button.style.opacity = '0';
        button.style.transform = 'scale(0.9)';
        
        setTimeout(() => {
            button.style.transition = 'all 0.3s ease';
            button.style.opacity = '1';
            button.style.transform = 'scale(1)';
        }, 500 + (index * 100));
    });
}

/**
 * Inicializa efectos adicionales para las tarjetas de módulos
 */
function initializeModuleCards() {
    const moduleCards = document.querySelectorAll('.module-card');
    
    moduleCards.forEach(card => {
        // Efecto de hover más pronunciado
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
            this.style.boxShadow = '0 10px 20px rgba(0, 0, 0, 0.15)';
            
            // Animar el ícono del módulo
            const icon = this.querySelector('.module-icon i');
            if (icon) {
                icon.style.transition = 'all 0.3s ease';
                icon.style.transform = 'scale(1.2) rotate(5deg)';
            }
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
            this.style.boxShadow = '0 4px 6px rgba(0, 0, 0, 0.1)';
            
            // Restaurar el ícono
            const icon = this.querySelector('.module-icon i');
            if (icon) {
                icon.style.transform = 'scale(1) rotate(0)';
            }
        });
        
        // Animar botones de acción al pasar el mouse
        const actionButtons = card.querySelectorAll('.action-btn');
        actionButtons.forEach(button => {
            button.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-4px)';
                this.style.boxShadow = '0 4px 8px rgba(0, 0, 0, 0.2)';
            });
            
            button.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
                this.style.boxShadow = 'none';
            });
        });
    });
    
    // Animar tarjetas de estadísticas
    const statCards = document.querySelectorAll('.stat-card');
    statCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-8px)';
            this.style.boxShadow = '0 8px 16px rgba(0, 0, 0, 0.1)';
            
            // Animar número
            const numberElement = this.querySelector('p');
            if (numberElement) {
                numberElement.style.transition = 'all 0.3s ease';
                numberElement.style.transform = 'scale(1.1)';
                numberElement.style.color = '#3498db';
            }
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = '0 4px 6px rgba(0, 0, 0, 0.1)';
            
            // Restaurar número
            const numberElement = this.querySelector('p');
            if (numberElement) {
                numberElement.style.transform = 'scale(1)';
                numberElement.style.color = '#2c3e50';
            }
        });
    });
}

/**
 * Muestra notificaciones de demostración (simuladas)
 */
function showDemoNotifications() {
    // Esperar un poco antes de mostrar la notificación
    setTimeout(() => {
        createNotification('¡Bienvenido al Panel de Administración!', 'info');
    }, 2000);
    
    // Mostrar otra notificación después de un tiempo
    setTimeout(() => {
        createNotification('Tienes 3 nuevas reservaciones pendientes', 'warning');
    }, 5000);
}

/**
 * Crea y muestra una notificación en la pantalla
 * @param {string} message - Mensaje a mostrar
 * @param {string} type - Tipo de notificación (info, success, warning, error)
 */
function createNotification(message, type = 'info') {
    // Crear elemento de notificación
    const notification = document.createElement('div');
    notification.className = `notification ${type}`;
    
    // Iconos según el tipo
    let icon = 'info-circle';
    if (type === 'success') icon = 'check-circle';
    if (type === 'warning') icon = 'exclamation-triangle';
    if (type === 'error') icon = 'times-circle';
    
    // Agregar contenido
    notification.innerHTML = `
        <i class="fas fa-${icon}"></i>
        <span>${message}</span>
        <button class="close-btn"><i class="fas fa-times"></i></button>
    `;
    
    // Insertar en el DOM
    document.body.appendChild(notification);
    
    // Aplicar estilos CSS en línea para la animación
    notification.style.position = 'fixed';
    notification.style.bottom = '20px';
    notification.style.right = '20px';
    notification.style.backgroundColor = type === 'info' ? '#3498db' : 
                                       type === 'success' ? '#2ecc71' : 
                                       type === 'warning' ? '#f39c12' : '#e74c3c';
    notification.style.color = 'white';
    notification.style.padding = '12px 20px';
    notification.style.borderRadius = '4px';
    notification.style.boxShadow = '0 4px 12px rgba(0, 0, 0, 0.15)';
    notification.style.display = 'flex';
    notification.style.alignItems = 'center';
    notification.style.gap = '10px';
    notification.style.zIndex = '1000';
    notification.style.minWidth = '300px';
    notification.style.opacity = '0';
    notification.style.transform = 'translateY(20px)';
    notification.style.transition = 'all 0.3s ease';
    
    // Estilo para el botón de cierre
    const closeBtn = notification.querySelector('.close-btn');
    closeBtn.style.background = 'none';
    closeBtn.style.border = 'none';
    closeBtn.style.color = 'white';
    closeBtn.style.cursor = 'pointer';
    closeBtn.style.marginLeft = 'auto';
    
    // Mostrar con animación
    setTimeout(() => {
        notification.style.opacity = '1';
        notification.style.transform = 'translateY(0)';
    }, 10);
    
    // Agregar evento para cerrar
    closeBtn.addEventListener('click', () => {
        notification.style.opacity = '0';
        notification.style.transform = 'translateY(20px)';
        
        setTimeout(() => {
            document.body.removeChild(notification);
        }, 300);
    });
    
    // Auto-cerrar después de 5 segundos
    setTimeout(() => {
        if (document.body.contains(notification)) {
            notification.style.opacity = '0';
            notification.style.transform = 'translateY(20px)';
            
            setTimeout(() => {
                if (document.body.contains(notification)) {
                    document.body.removeChild(notification);
                }
            }, 300);
        }
    }, 5000);
}

// Añadir estilos de notificación dinámicamente al documento
const notificationStyles = document.createElement('style');
notificationStyles.textContent = `
    /* Estilos para las notificaciones */
    .notification {
        animation: slideIn 0.3s ease;
    }
    
@keyframes slideIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    .notification.hide {
        animation: slideOut 0.3s ease forwards;
    }
    
    @keyframes slideOut {
        from {
            opacity: 1;
            transform: translateY(0);
        }
        to {
            opacity: 0;
            transform: translateY(20px);
        }
    }
`;

document.head.appendChild(notificationStyles);

/**
 * Agrega efectos de transición al menú de navegación
 */
function initializeNavEffects() {
    const navLinks = document.querySelectorAll('.nav-links a');
    
    navLinks.forEach(link => {
        // Agregar efecto de 'ripple' al hacer clic
        link.addEventListener('click', function(e) {
            const ripple = document.createElement('span');
            const rect = this.getBoundingClientRect();
            
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            
            ripple.style.position = 'absolute';
            ripple.style.left = `${x}px`;
            ripple.style.top = `${y}px`;
            ripple.style.width = '0';
            ripple.style.height = '0';
            ripple.style.backgroundColor = 'rgba(255, 255, 255, 0.3)';
            ripple.style.borderRadius = '50%';
            ripple.style.transform = 'translate(-50%, -50%)';
            ripple.style.transition = 'all 0.6s ease-out';
            
            this.style.position = 'relative';
            this.style.overflow = 'hidden';
            this.appendChild(ripple);
            
            setTimeout(() => {
                ripple.style.width = '400px';
                ripple.style.height = '400px';
                ripple.style.opacity = '0';
            }, 10);
            
            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });
}

// Llamar a initializeNavEffects después de que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', initializeNavEffects);

/**
 * Inicializa efectos de carga para secciones que aparecen al hacer scroll
 */
function initializeScrollEffects() {
    // Obtener todas las tarjetas y secciones importantes
    const elements = document.querySelectorAll('.module-card, .stat-card, .footer-section');
    
    // Función para verificar si un elemento está en el viewport
    function isInViewport(element) {
        const rect = element.getBoundingClientRect();
        return (
            rect.top <= (window.innerHeight || document.documentElement.clientHeight) * 0.85 &&
            rect.bottom >= 0
        );
    }
    
    // Función para manejar el evento de scroll
    function handleScroll() {
        elements.forEach(element => {
            if (isInViewport(element) && !element.classList.contains('shown')) {
                element.classList.add('shown');
                element.style.transition = 'all 0.7s ease';
                element.style.opacity = '1';
                element.style.transform = 'translateY(0)';
            }
        });
    }
    
    // Configurar inicialmente los elementos como ocultos si están fuera del viewport
    elements.forEach(element => {
        if (!isInViewport(element)) {
            element.style.opacity = '0';
            element.style.transform = 'translateY(40px)';
        } else {
            element.classList.add('shown');
        }
    });
    
    // Agregar el evento de scroll
    window.addEventListener('scroll', handleScroll);
    
    // Llamar a handleScroll inicialmente
    handleScroll();
}

// Llamar a initializeScrollEffects después de que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', initializeScrollEffects);

/**
 * Inicializa contadores animados para los valores de estadísticas
 */
function initializeCounters() {
    const statValues = document.querySelectorAll('.stat-card p');
    
    statValues.forEach(statValue => {
        // Obtener el valor final
        const finalValue = parseInt(statValue.textContent);
        // Establecer valor inicial
        statValue.textContent = '0';
        
        // Función para animar el contador
        const animateCounter = (timestamp, startValue, endValue, startTime, duration, element) => {
            if (!startTime) startTime = timestamp;
            const progress = timestamp - startTime;
            const percentage = Math.min(progress / duration, 1);
            
            // Usar una función easing para una animación más suave
            const easeOut = t => 1 - Math.pow(1 - t, 3);
            const easedPercentage = easeOut(percentage);
            
            const currentValue = Math.floor(startValue + (endValue - startValue) * easedPercentage);
            
            // Añadir formato según el tipo de estadística
            if (element.textContent.includes('$')) {
                element.textContent = '$' + currentValue.toLocaleString();
            } else {
                element.textContent = currentValue.toString();
            }
            
            if (percentage < 1) {
                requestAnimationFrame(time => 
                    animateCounter(time, startValue, endValue, startTime, duration, element)
                );
            }
        };
        
        // Iniciar animación cuando la tarjeta es visible
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    // Cuando la tarjeta es visible, inicia la animación
                    requestAnimationFrame(time => 
                        animateCounter(time, 0, finalValue, null, 2000, statValue)
                    );
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.5 });
        
        // Observar la tarjeta padre
        observer.observe(statValue.closest('.stat-card'));
    });
}

// Llamar a initializeCounters después de que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', initializeCounters);

/**
 * Simula carga de datos en tiempo real para las estadísticas
 */
function simulateRealtimeUpdates() {
    // Funcionalidad para simular actualizaciones en tiempo real cada 30 segundos
    setInterval(() => {
        // Elegir una estadística aleatoria para actualizar
        const statCards = document.querySelectorAll('.stat-card');
        if (statCards.length > 0) {
            const randomIndex = Math.floor(Math.random() * statCards.length);
            const randomCard = statCards[randomIndex];
            const statValue = randomCard.querySelector('p');
            
            if (statValue) {
                let currentValue = parseInt(statValue.textContent.replace(/\D/g, ''));
                let change = Math.floor(Math.random() * 5) + 1; // Cambio aleatorio entre 1 y 5
                
                // Decidir si aumenta o disminuye (70% probabilidad de aumento)
                const increase = Math.random() < 0.7;
                if (!increase) change = -change;
                
                // Asegurar que no sea negativo
                const newValue = Math.max(0, currentValue + change);
                
                // Animar transición
                statValue.style.transition = 'all 0.5s ease';
                statValue.style.transform = 'scale(1.2)';
                statValue.style.color = increase ? '#2ecc71' : '#e74c3c';
                
                // Actualizar valor
                if (statValue.textContent.includes('$')) {
                    statValue.textContent = '$' + newValue.toLocaleString();
                } else {
                    statValue.textContent = newValue.toString();
                }
                
                // Mostrar notificación de cambio
                const cardTitle = randomCard.querySelector('h3').textContent;
                const message = increase ? 
                    `${cardTitle} ha aumentado en ${change}` : 
                    `${cardTitle} ha disminuido en ${Math.abs(change)}`;
                
                createNotification(message, increase ? 'success' : 'warning');
                
                // Restaurar estilo después de un momento
                setTimeout(() => {
                    statValue.style.transform = 'scale(1)';
                    statValue.style.color = '#2c3e50';
                }, 1000);
            }
        }
    }, 30000); // 30 segundos
}

// Llamar a simulateRealtimeUpdates después de que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', simulateRealtimeUpdates);

/**
 * Inicializa interactividad para los módulos principales
 */
function initializeModuleInteractions() {
    // Agregamos funcionalidad para mostrar información adicional al hacer clic en un módulo
    const moduleCards = document.querySelectorAll('.module-card');
    
    moduleCards.forEach(card => {
        card.addEventListener('click', function(e) {
            // Evitar que se active si se hizo clic en un botón de acción
            if (e.target.closest('.action-btn')) return;
            
            // Toggle de clase 'active' para expandir/contraer
            this.classList.toggle('active');
            
            // Si no existe el panel de detalles, crearlo
            let detailsPanel = this.querySelector('.module-details');
            
            if (!detailsPanel) {
                detailsPanel = document.createElement('div');
                detailsPanel.className = 'module-details';
                
                // Contenido del panel de detalles según el tipo de módulo
                const moduleTitle = this.querySelector('h3').textContent;
                
                let detailsContent = '';
                
                if (moduleTitle.includes('Usuario')) {
                    detailsContent = `
                        <h4>Información de Usuarios</h4>
                        <p>Total de usuarios registrados: 124</p>
                        <p>Usuarios activos: 98</p>
                        <p>Usuarios nuevos este mes: 15</p>
                    `;
                } else if (moduleTitle.includes('Cliente')) {
                    detailsContent = `
                        <h4>Información de Clientes</h4>
                        <p>Total de clientes: 112</p>
                        <p>Clientes frecuentes: 45</p>
                        <p>Clientes nuevos este mes: 8</p>
                    `;
                } else if (moduleTitle.includes('Empleado')) {
                    detailsContent = `
                        <h4>Información de Empleados</h4>
                        <p>Total de empleados: 28</p>
                        <p>En servicio actualmente: 12</p>
                        <p>Conductores disponibles: 8</p>
                    `;
                } else if (moduleTitle.includes('Reservacion')) {
                    detailsContent = `
                        <h4>Información de Reservaciones</h4>
                        <p>Reservaciones activas: 28</p>
                        <p>Pendientes de hoy: 7</p>
                        <p>Completadas este mes: 43</p>
                    `;
                } else if (moduleTitle.includes('Vehículo')) {
                    detailsContent = `
                        <h4>Información de Vehículos</h4>
                        <p>Total de vehículos: 75</p>
                        <p>Disponibles: 47</p>
                        <p>En mantenimiento: 8</p>
                    `;
                } else if (moduleTitle.includes('Reporte')) {
                    detailsContent = `
                        <h4>Información de Reportes</h4>
                        <p>Ingresos mensuales: $21,450</p>
                        <p>Reservaciones completadas: 43</p>
                        <p>Tasa de ocupación: 62.5%</p>
                    `;
                }
                
                detailsPanel.innerHTML = detailsContent;
                
                // Botón para cerrar
                const closeButton = document.createElement('button');
                closeButton.className = 'details-close-btn';
                closeButton.innerHTML = '<i class="fas fa-times"></i>';
                closeButton.addEventListener('click', (e) => {
                    e.stopPropagation();
                    this.classList.remove('active');
                    detailsPanel.style.maxHeight = '0';
                    setTimeout(() => {
                        if (this.contains(detailsPanel)) {
                            this.removeChild(detailsPanel);
                        }
                    }, 300);
                });
                
                detailsPanel.appendChild(closeButton);
                this.appendChild(detailsPanel);
                
                // Animar aparición
                requestAnimationFrame(() => {
                    detailsPanel.style.maxHeight = '0';
                    detailsPanel.style.overflow = 'hidden';
                    detailsPanel.style.transition = 'all 0.3s ease';
                    
                    requestAnimationFrame(() => {
                        detailsPanel.style.maxHeight = detailsPanel.scrollHeight + 'px';
                    });
                });
            } else {
                // Si ya existe el panel, manejamos su visibilidad
                if (this.classList.contains('active')) {
                    detailsPanel.style.maxHeight = detailsPanel.scrollHeight + 'px';
                } else {
                    detailsPanel.style.maxHeight = '0';
                    setTimeout(() => {
                        if (this.contains(detailsPanel)) {
                            this.removeChild(detailsPanel);
                        }
                    }, 300);
                }
            }
        });
    });
}

// Llamar a initializeModuleInteractions después de que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', initializeModuleInteractions);

