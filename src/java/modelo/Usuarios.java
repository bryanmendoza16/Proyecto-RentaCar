/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.util.Date;

public class Usuarios {
    private int idUsuarios;      
    private String nombre;       
    private String contrasena;   
    private String correo;  
    private String rol; 
    
 public Usuarios(){
 
 }   
    
public Usuarios (int idUsuarios,String nombre,String contrasena, String correo, Date fecha){
    
    this.idUsuarios = idUsuarios;
    this.nombre = nombre;
    this.contrasena = contrasena;
    this.correo = correo;
    this.rol = rol;

}

    public int getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(int idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getRol(){
        return rol;
    
    }
    public void setRol(String rol){
        this.rol=rol;
    
    }

    
}
