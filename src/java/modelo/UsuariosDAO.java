/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


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
            us.setRol(rs.getString("Rol")); // puedes cargar el rol desde DB aquí
            return us;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}
}

