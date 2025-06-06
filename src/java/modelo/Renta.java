package modelo;

import java.sql.Date;

public class Renta {
    private int rentaID;
    private int vehiculoID;
    private int empleadoID;
    private int clienteID;
    private Date fechaInicio;
    private Date fechaFin;
    private double total;
    private Date fechaRegistro;
    
    private String clienteNombre;

    public Renta() {}

    public Renta(int rentaID, int vehiculoID, int empleadoID, int clienteID,
                 Date fechaInicio, Date fechaFin, double total, Date fechaRegistro) {
        this.rentaID = rentaID;
        this.vehiculoID = vehiculoID;
        this.empleadoID = empleadoID;
        this.clienteID = clienteID;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.total = total;
        this.fechaRegistro = fechaRegistro;
    }

    public int getRentaID() {
        return rentaID;
    }

    public void setRentaID(int rentaID) {
        this.rentaID = rentaID;
    }

    public int getVehiculoID() {
        return vehiculoID;
    }

    public void setVehiculoID(int vehiculoID) {
        this.vehiculoID = vehiculoID;
    }

    public int getEmpleadoID() {
        return empleadoID;
    }

    public void setEmpleadoID(int empleadoID) {
        this.empleadoID = empleadoID;
    }

    public int getClienteID() {
        return clienteID;
    }

    public void setClienteID(int clienteID) {
        this.clienteID = clienteID;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }
     public String getClienteNombre() {
        return clienteNombre;
    }

    public void setClienteNombre(String clienteNombre) {
        this.clienteNombre = clienteNombre;
    }
}
