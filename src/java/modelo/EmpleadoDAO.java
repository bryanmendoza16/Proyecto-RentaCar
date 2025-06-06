/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.ConexionDB;
import modelo.Empleado;

public class EmpleadoDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ConexionDB cn = new ConexionDB();

    public List<Empleado> listar() {
        List<Empleado> lista = new ArrayList<>();
        String sql = "SELECT * FROM Empleado";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado e = new Empleado();
                e.setEmpleadoID(rs.getInt("EmpleadoID"));
                e.setNombre(rs.getString("Nombre"));
                e.setTelefono(rs.getString("Telefono"));
                e.setCorreo(rs.getString("Correo"));
                e.setFechaRegistro(rs.getString("FechaRegistro"));
                lista.add(e);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return lista;
    }
}
