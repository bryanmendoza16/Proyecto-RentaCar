/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.util.Date;
public class Cliente {
      private int clienteID;
    private String nombre;
    private String telefono;
    private String dui;
    private String noLicencia;
    private String correo;
    private Date fechaRegistro;
    
    public Cliente() {
    }

     public Cliente(int clienteID, String nombre, String telefono, String dui, 
                   String noLicencia, String correo, Date fechaRegistro) {
        this.clienteID = clienteID;
        this.nombre = nombre;
        this.telefono = telefono;
        this.dui = dui;
        this.noLicencia = noLicencia;
        this.correo = correo;
        this.fechaRegistro = fechaRegistro;
    }

    public int getClienteID() {
        return clienteID;
    }

    public void setClienteID(int clienteID) {
        this.clienteID = clienteID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

    public String getNoLicencia() {
        return noLicencia;
    }

    public void setNoLicencia(String noLicencia) {
        this.noLicencia = noLicencia;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

}
