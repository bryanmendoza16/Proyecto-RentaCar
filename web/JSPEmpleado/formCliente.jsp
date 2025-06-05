<%-- 
    Document   : formCliente
    Created on : 5 jun 2025, 12:08:17
    Author     : axel martinez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= (request.getAttribute("cliente") != null) ? "Editar Cliente" : "Nuevo Cliente" %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px 40px;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            border-radius: 10px;
        }
         .title-container {
        background-color: #007bff; /* azul */
        color: black; /* ahora texto negro */
        padding: 15px 25px;
        border-radius: 8px;
        margin-bottom: 30px;
        text-align: center;
        font-size: 1.8em;
        font-weight: bold;
        user-select: none;
    }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }
        input[type="text"],
        input[type="tel"],
        input[type="email"] {
            width: 100%;
            padding: 10px 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: box-shadow 0.3s ease;
            color: #333;
        }
        input[type="text"]:focus,
        input[type="tel"]:focus,
        input[type="email"]:focus {
            outline: none;
            box-shadow: 0 0 5px #007bff;
            border-color: #007bff;
        }
        .button-container {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        .btn {
            padding: 10px 25px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            user-select: none;
            transition: background-color 0.3s ease;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #565e64;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title-container">
            <%= (request.getAttribute("cliente") != null) ? "Editar Cliente" : "Nuevo Cliente" %>
        </div>
        
      <form action="${pageContext.request.contextPath}/clienteServlet" method="post" class="form">

            <input type="hidden" name="action" value="<%= (request.getAttribute("cliente") != null) ? "update" : "insert" %>">
            
            <% 
                Object clienteObj = request.getAttribute("cliente");
                if (clienteObj != null) {
                    modelo.Cliente cliente = (modelo.Cliente) clienteObj;
            %>
                <input type="hidden" name="clienteID" value="<%= cliente.getClienteID() %>">
            <% } %>
            
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input 
                    type="text" id="nombre" name="nombre" 
                    value="<%= (request.getAttribute("cliente") != null) ? ((modelo.Cliente)request.getAttribute("cliente")).getNombre() : "" %>" 
                    required 
                    pattern="[A-Za-z\s]+" 
                    title="Solo letras y espacios"
                    autocomplete="off"
                >
            </div>
            <div class="form-group">
    <label for="telefono">Teléfono:</label>
    <input 
        type="tel" 
        id="telefono" 
        name="telefono" 
        value="${cliente.telefono}" 
        required 
        pattern="[0-9-]+" 
        title="Por favor ingrese solo números y guiones, ejemplo: 123-456-7890">
</div>
            
            <div class="form-group">
                <label for="dui">DUI:</label>
                <input 
                    type="text" id="dui" name="dui" 
                    value="<%= (request.getAttribute("cliente") != null) ? ((modelo.Cliente)request.getAttribute("cliente")).getDui() : "" %>" 
                    required 
                    pattern="[0-9\-]+" 
                    title="Solo números y guiones"
                    autocomplete="off"
                >
            </div>
            
            <div class="form-group">
                <label for="noLicencia">No. Licencia:</label>
                <input 
                    type="text" id="noLicencia" name="noLicencia" 
                    value="<%= (request.getAttribute("cliente") != null) ? ((modelo.Cliente)request.getAttribute("cliente")).getNoLicencia() : "" %>" 
                    required 
                    pattern="[A-Za-z0-9]+" 
                    title="Solo letras y números"
                    autocomplete="off"
                >
            </div>
            
            <div class="form-group">
                <label for="correo">Correo:</label>
                <input 
                    type="email" id="correo" name="correo" 
                    value="<%= (request.getAttribute("cliente") != null) ? ((modelo.Cliente)request.getAttribute("cliente")).getCorreo() : "" %>" 
                    required
                    autocomplete="off"
                >
            </div>
            
            <div class="button-container">
                <button type="submit" class="btn btn-primary">Guardar</button>
              <a href="${pageContext.request.contextPath}/dashboardEmpleado.jsp" class="btn btn-secondary">Cancelar</a>

            </div>
        </form>
    </div>
</body>
</html>


