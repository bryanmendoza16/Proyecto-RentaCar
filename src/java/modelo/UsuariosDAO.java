package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuariosDAO implements Validar {
    Connection con;
    ConexionDB cn = new ConexionDB();
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public Usuarios Validar(Usuarios usua) {
        String sql = "SELECT * FROM usuario WHERE Nombre=? AND Correo=? AND Password=?";
        try {
            con = cn.getConnection();
            if (con == null) {
                System.out.println("ERROR: No se pudo establecer conexión en Validar()");
                return null;
            }
            
            ps = con.prepareStatement(sql);
            ps.setString(1, usua.getNombre());
            ps.setString(2, usua.getCorreo());
            ps.setString(3, usua.getContrasena());

            rs = ps.executeQuery();

            if (rs.next()) {
                Usuarios us = new Usuarios();
                us.setIdUsuarios(rs.getInt("UsuarioID"));
                us.setNombre(rs.getString("Nombre"));
                us.setCorreo(rs.getString("Correo"));
                us.setContrasena(rs.getString("Password"));
                us.setRol(rs.getString("Rol"));
                return us;
            }
        } catch (SQLException e) {
            System.out.println("Error SQL en Validar(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            cerrarRecursos();
        }
        return null;
    }

    // Método para listar todos los usuarios
    public List<Usuarios> listar() {
        List<Usuarios> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuario";
        
        System.out.println("=== DEBUG: Iniciando listar() ===");
        
        try {
            con = cn.getConnection();
            System.out.println("Conexión establecida: " + (con != null));
            
            if (con == null) {
                System.out.println("ERROR: No se pudo establecer conexión a la base de datos");
                return lista;
            }
            
            ps = con.prepareStatement(sql);
            System.out.println("PreparedStatement creado para: " + sql);
            
            rs = ps.executeQuery();
            System.out.println("Query ejecutado exitosamente");
            
            int contador = 0;
            while (rs.next()) {
                contador++;
                Usuarios u = new Usuarios();
                
                // Obtener valores y mostrar debug
                int id = rs.getInt("UsuarioID");
                String nombre = rs.getString("Nombre");
                String correo = rs.getString("Correo");
                String password = rs.getString("Password");
                String rol = rs.getString("Rol");
                
                System.out.println("Usuario " + contador + " - ID: " + id + ", Nombre: " + nombre + ", Correo: " + correo);
                
                u.setIdUsuarios(id);
                u.setNombre(nombre);
                u.setCorreo(correo);
                u.setContrasena(password);
                u.setRol(rol);
                
                lista.add(u);
            }
            
            System.out.println("Total de usuarios encontrados: " + contador);
            System.out.println("Tamaño de lista retornada: " + lista.size());
            
        } catch (SQLException e) {
            System.out.println("Error SQL en listar(): " + e.getMessage());
            System.out.println("SQLState: " + e.getSQLState());
            System.out.println("Error Code: " + e.getErrorCode());
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Error general en listar(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            cerrarRecursos();
        }
        
        System.out.println("=== DEBUG: Finalizando listar() ===");
        return lista;
    }

    // Método para obtener un usuario por su ID
    public Usuarios listarPorId(int id) {
        Usuarios u = new Usuarios();
        String sql = "SELECT * FROM usuario WHERE UsuarioID=?";
        
        System.out.println("=== DEBUG: Buscando usuario con ID: " + id + " ===");
        
        try {
            con = cn.getConnection();
            if (con == null) {
                System.out.println("ERROR: No se pudo establecer conexión en listarPorId()");
                return u;
            }
            
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                u.setIdUsuarios(rs.getInt("UsuarioID"));
                u.setNombre(rs.getString("Nombre"));
                u.setCorreo(rs.getString("Correo"));
                u.setContrasena(rs.getString("Password"));
                u.setRol(rs.getString("Rol"));
                System.out.println("Usuario encontrado: " + u.getNombre());
            } else {
                System.out.println("No se encontró usuario con ID: " + id);
            }
        } catch (SQLException e) {
            System.out.println("Error SQL en listarPorId(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            cerrarRecursos();
        }
        return u;
    }

    // Método para agregar un nuevo usuario
    public void agregar(Usuarios u) {
        String sql = "INSERT INTO usuario(Nombre, Correo, Password, Rol) VALUES (?, ?, ?, ?)";
        
        System.out.println("=== DEBUG: Agregando usuario: " + u.getNombre() + " ===");
        
        try {
            con = cn.getConnection();
            if (con == null) {
                System.out.println("ERROR: No se pudo establecer conexión en agregar()");
                return;
            }
            
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getCorreo());
            ps.setString(3, u.getContrasena());
            ps.setString(4, u.getRol());
            
            int filasAfectadas = ps.executeUpdate();
            System.out.println("Usuario agregado exitosamente. Filas afectadas: " + filasAfectadas);
            
        } catch (SQLException e) {
            System.out.println("Error SQL en agregar(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            cerrarRecursos();
        }
    }

    // Método para actualizar un usuario existente
    public void actualizar(Usuarios u) {
        String sql = "UPDATE usuario SET Nombre=?, Correo=?, Password=?, Rol=? WHERE UsuarioID=?";
        
        System.out.println("=== DEBUG: Actualizando usuario ID: " + u.getIdUsuarios() + " ===");
        
        try {
            con = cn.getConnection();
            if (con == null) {
                System.out.println("ERROR: No se pudo establecer conexión en actualizar()");
                return;
            }
            
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getCorreo());
            ps.setString(3, u.getContrasena());
            ps.setString(4, u.getRol());
            ps.setInt(5, u.getIdUsuarios());
            
            int filasAfectadas = ps.executeUpdate();
            System.out.println("Usuario actualizado. Filas afectadas: " + filasAfectadas);
            
        } catch (SQLException e) {
            System.out.println("Error SQL en actualizar(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            cerrarRecursos();
        }
    }

    // Método para eliminar un usuario por ID
    public void eliminar(int id) {
        String sql = "DELETE FROM usuario WHERE UsuarioID=?";
        
        System.out.println("=== DEBUG: Eliminando usuario ID: " + id + " ===");
        
        try {
            con = cn.getConnection();
            if (con == null) {
                System.out.println("ERROR: No se pudo establecer conexión en eliminar()");
                return;
            }
            
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            
            int filasAfectadas = ps.executeUpdate();
            System.out.println("Usuario eliminado. Filas afectadas: " + filasAfectadas);
            
        } catch (SQLException e) {
            System.out.println("Error SQL en eliminar(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            cerrarRecursos();
        }
    }
    
    // Método para cerrar recursos de forma segura
    private void cerrarRecursos() {
        try {
            if (rs != null) {
                rs.close();
                rs = null;
            }
            if (ps != null) {
                ps.close();
                ps = null;
            }
            if (con != null) {
                con.close();
                con = null;
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar recursos: " + e.getMessage());
            e.printStackTrace();
        }
    }
}