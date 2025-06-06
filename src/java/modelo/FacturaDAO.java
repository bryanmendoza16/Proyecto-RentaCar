/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FacturaDAO {

    private Connection con;

    public FacturaDAO() {
        con = ConexionDB.getConnection();
    }

    public List<Factura> obtenerTodas() {
        List<Factura> lista = new ArrayList<>();
        String sql = "SELECT f.FacturaID, f.RentaID, f.FechaPago, f.Monto, " +
                     "r.FechaInicio, c.Nombre AS ClienteNombre " +
                     "FROM Factura f " +
                     "INNER JOIN Renta r ON f.RentaID = r.RentaID " +
                     "INNER JOIN Cliente c ON r.ClienteID = c.ClienteID";

        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Factura f = new Factura();
                f.setFacturaID(rs.getInt("FacturaID"));
                f.setRentaID(rs.getInt("RentaID"));
                f.setFechaPago(rs.getDate("FechaPago"));
                f.setMonto(rs.getDouble("Monto"));
                f.setFechaRenta(rs.getDate("FechaInicio"));
                f.setClienteNombre(rs.getString("ClienteNombre"));

                lista.add(f);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public Factura obtenerPorId(int id) {
        Factura f = null;
        String sql = "SELECT f.FacturaID, f.RentaID, f.FechaPago, f.Monto FROM Factura f WHERE f.FacturaID = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    f = new Factura();
                    f.setFacturaID(rs.getInt("FacturaID"));
                    f.setRentaID(rs.getInt("RentaID"));
                    f.setFechaPago(rs.getDate("FechaPago"));
                    f.setMonto(rs.getDouble("Monto"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean insertar(Factura factura) {
        String sql = "INSERT INTO Factura(RentaID, FechaPago, Monto) VALUES (?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, factura.getRentaID());
            ps.setDate(2, factura.getFechaPago());
            ps.setDouble(3, factura.getMonto());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean actualizar(Factura factura) {
        String sql = "UPDATE Factura SET RentaID=?, FechaPago=?, Monto=? WHERE FacturaID=?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, factura.getRentaID());
            ps.setDate(2, factura.getFechaPago());
            ps.setDouble(3, factura.getMonto());
            ps.setInt(4, factura.getFacturaID());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM Factura WHERE FacturaID=?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Para el formulario de nueva factura, obtener todas las rentas para elegir
    public List<Renta> obtenerTodasRentas() {
        List<Renta> lista = new ArrayList<>();
        String sql = "SELECT r.RentaID, c.Nombre, r.FechaInicio FROM Renta r INNER JOIN Cliente c ON r.ClienteID = c.ClienteID";
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Renta r = new Renta();
                r.setRentaID(rs.getInt("RentaID"));
                r.setClienteNombre(rs.getString("Nombre"));
                r.setFechaInicio(rs.getDate("FechaInicio"));
                lista.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}
