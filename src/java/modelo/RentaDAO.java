package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RentaDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List<Renta> obtenerTodas() {
        List<Renta> lista = new ArrayList<>();
        String sql = "SELECT * FROM renta";

        try {
            con = ConexionDB.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Renta r = new Renta();
                r.setRentaID(rs.getInt("RentaID"));
                r.setVehiculoID(rs.getInt("VehiculoID"));
                r.setEmpleadoID(rs.getInt("EmpleadoID"));
                r.setClienteID(rs.getInt("ClienteID"));
                r.setFechaInicio(rs.getDate("FechaInicio"));
                r.setFechaFin(rs.getDate("FechaFin"));
                r.setTotal(rs.getDouble("Total"));
                r.setFechaRegistro(rs.getDate("FechaRegistro"));
                lista.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void insertar(Renta r) {
        String sql = "INSERT INTO renta (VehiculoID, EmpleadoID, ClienteID, FechaInicio, FechaFin, Total, FechaRegistro) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            con = ConexionDB.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, r.getVehiculoID());
            ps.setInt(2, r.getEmpleadoID());
            ps.setInt(3, r.getClienteID());
            ps.setDate(4, r.getFechaInicio());
            ps.setDate(5, r.getFechaFin());
            ps.setDouble(6, r.getTotal());
            ps.setDate(7, r.getFechaRegistro());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Renta obtenerPorId(int id) {
        Renta r = new Renta();
        String sql = "SELECT * FROM renta WHERE RentaID = ?";

        try {
            con = ConexionDB.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                r.setRentaID(rs.getInt("RentaID"));
                r.setVehiculoID(rs.getInt("VehiculoID"));
                r.setEmpleadoID(rs.getInt("EmpleadoID"));
                r.setClienteID(rs.getInt("ClienteID"));
                r.setFechaInicio(rs.getDate("FechaInicio"));
                r.setFechaFin(rs.getDate("FechaFin"));
                r.setTotal(rs.getDouble("Total"));
                r.setFechaRegistro(rs.getDate("FechaRegistro"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    public void actualizar(Renta r) {
        String sql = "UPDATE renta SET VehiculoID = ?, EmpleadoID = ?, ClienteID = ?, FechaInicio = ?, FechaFin = ?, Total = ?, FechaRegistro = ? WHERE RentaID = ?";

        try {
            con = ConexionDB.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, r.getVehiculoID());
            ps.setInt(2, r.getEmpleadoID());
            ps.setInt(3, r.getClienteID());
            ps.setDate(4, r.getFechaInicio());
            ps.setDate(5, r.getFechaFin());
            ps.setDouble(6, r.getTotal());
            ps.setDate(7, r.getFechaRegistro());
            ps.setInt(8, r.getRentaID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM renta WHERE RentaID = ?";

        try {
            con = ConexionDB.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
