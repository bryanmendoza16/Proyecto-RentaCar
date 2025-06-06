/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Date;

public class Factura {
    private int facturaID;
    private int rentaID;
    private Date fechaPago;
    private double monto;

    // Campos relacionados para mostrar datos amigables (no se guardan en BD)
    private String clienteNombre;  // para mostrar cliente de la renta
    private Date fechaRenta;        // para mostrar fecha inicio renta

    public Factura() {
    }

    public Factura(int facturaID, int rentaID, Date fechaPago, double monto) {
        this.facturaID = facturaID;
        this.rentaID = rentaID;
        this.fechaPago = fechaPago;
        this.monto = monto;
    }

    // getters y setters

    public int getFacturaID() {
        return facturaID;
    }

    public void setFacturaID(int facturaID) {
        this.facturaID = facturaID;
    }

    public int getRentaID() {
        return rentaID;
    }

    public void setRentaID(int rentaID) {
        this.rentaID = rentaID;
    }

    public Date getFechaPago() {
        return fechaPago;
    }

    public void setFechaPago(Date fechaPago) {
        this.fechaPago = fechaPago;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getClienteNombre() {
        return clienteNombre;
    }

    public void setClienteNombre(String clienteNombre) {
        this.clienteNombre = clienteNombre;
    }

    public Date getFechaRenta() {
        return fechaRenta;
    }

    public void setFechaRenta(Date fechaRenta) {
        this.fechaRenta = fechaRenta;
    }
}
