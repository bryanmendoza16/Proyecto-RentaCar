package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class VehiculoDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private ConexionDB cn = new ConexionDB();

    // Cambié el nombre a obtenerTodas() para uniformidad
    public List<Vehiculo> obtenerTodas() {
        List<Vehiculo> lista = new ArrayList<>();
        String sql = "SELECT * FROM vehiculos";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Vehiculo v = new Vehiculo();
                v.setVehiculoID(rs.getInt("VehiculoID"));
                v.setMarca(rs.getString("Marca"));
                v.setModelo(rs.getString("Modelo"));
                v.setAño(rs.getInt("Año"));
                v.setPlaca(rs.getString("Placa"));
                v.setPrecioRenta(rs.getDouble("PrecioRenta"));
                v.setDisponibilidad(rs.getString("Disponibilidad"));

                java.sql.Date fecha = rs.getDate("FechaRegistro");
                if (fecha != null) {
                    v.setFechaRegistro(new Date(fecha.getTime()));
                } else {
                    v.setFechaRegistro(null);
                }

                lista.add(v);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // Siempre cerrar recursos para evitar fugas
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lista;
    }
}
