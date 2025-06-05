/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.Cliente;

public class ClienteDAO {
     private Connection connection;
    
    
    public ClienteDAO() {
        // Asumiendo que ya tienes una clase de conexión
        connection = ConexionDB.getConnection();
    }
    
   public void insertar(Cliente cliente) {
    try {
        String sql = "INSERT INTO cliente (Nombre, Telefono, DUI, NoLicencia, Correo, FechaRegistro) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, cliente.getNombre());
        ps.setString(2, cliente.getTelefono());
        ps.setString(3, cliente.getDui());
        ps.setString(4, cliente.getNoLicencia());
        ps.setString(5, cliente.getCorreo());
        ps.setDate(6, new java.sql.Date(cliente.getFechaRegistro().getTime())); // Conversión correcta
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    
    public void actualizar(Cliente cliente) {
        try {
            String sql = "UPDATE cliente SET Nombre=?, Telefono=?, DUI=?, NoLicencia=?, Correo=? WHERE ClienteID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getTelefono());
            ps.setString(3, cliente.getDui());
            ps.setString(4, cliente.getNoLicencia());
            ps.setString(5, cliente.getCorreo());
            ps.setInt(6, cliente.getClienteID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void eliminar(int id) {
        try {
            String sql = "DELETE FROM cliente WHERE ClienteID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Cliente obtenerPorId(int id) {
        Cliente cliente = null;
        try {
            String sql = "SELECT * FROM cliente WHERE ClienteID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setClienteID(rs.getInt("ClienteID"));
                cliente.setNombre(rs.getString("Nombre"));
                cliente.setTelefono(rs.getString("Telefono"));
                cliente.setDui(rs.getString("DUI"));
                cliente.setNoLicencia(rs.getString("NoLicencia"));
                cliente.setCorreo(rs.getString("Correo"));
                cliente.setFechaRegistro(rs.getDate("FechaRegistro"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cliente;
    }
    
    public List<Cliente> listarTodos() {
        List<Cliente> clientes = new ArrayList<>();
        try {
            String sql = "SELECT * FROM cliente ORDER BY ClienteID DESC";
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setClienteID(rs.getInt("ClienteID"));
                cliente.setNombre(rs.getString("Nombre"));
                cliente.setTelefono(rs.getString("Telefono"));
                cliente.setDui(rs.getString("DUI"));
                cliente.setNoLicencia(rs.getString("NoLicencia"));
                cliente.setCorreo(rs.getString("Correo"));
                cliente.setFechaRegistro(rs.getDate("FechaRegistro"));
                clientes.add(cliente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clientes;
    }

}
