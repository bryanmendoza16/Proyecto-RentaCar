package modelo;

import java.util.Date;
import java.text.SimpleDateFormat;

public class Vehiculo {
    private int vehiculoID;
    private String marca;
    private String modelo;
    private int año;
    private String placa;
    private double precioRenta;
    private String disponibilidad;
    private Date fechaRegistro;

    public Vehiculo() {}

    public Vehiculo(int vehiculoID, String marca, String modelo, int año, String placa,
                    double precioRenta, String disponibilidad, Date fechaRegistro) {
        this.vehiculoID = vehiculoID;
        this.marca = marca;
        this.modelo = modelo;
        this.año = año;
        this.placa = placa;
        this.precioRenta = precioRenta;
        this.disponibilidad = disponibilidad;
        this.fechaRegistro = fechaRegistro;
    }

    public int getVehiculoID() {
        return vehiculoID;
    }

    public void setVehiculoID(int vehiculoID) {
        this.vehiculoID = vehiculoID;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public double getPrecioRenta() {
        return precioRenta;
    }

    public void setPrecioRenta(double precioRenta) {
        this.precioRenta = precioRenta;
    }

    public String getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(String disponibilidad) {
        this.disponibilidad = disponibilidad;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public String getDescripcion() {
        return marca + " " + modelo + " (" + placa + ")";
    }

    // Método auxiliar para obtener la fecha formateada como String
    public String getFechaRegistroFormateada() {
        if (fechaRegistro == null) return "";
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(fechaRegistro);
    }
}
