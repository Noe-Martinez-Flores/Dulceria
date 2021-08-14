package com.example.Dulceria.model.paquete;

public class Paquete {
    private String nombrePaquete;
    private int cantidadUnidadesPaquete;
    private double precioPaquete;

    public Paquete (){

    }

    public Paquete(String nombrePaquete, int cantidadUnidadesPaquete, double precioPaquete) {
        this.nombrePaquete = nombrePaquete;
        this.cantidadUnidadesPaquete = cantidadUnidadesPaquete;
        this.precioPaquete = precioPaquete;
    }

    public String getNombrePaquete() {
        return nombrePaquete;
    }

    public void setNombrePaquete(String nombrePaquete) {
        this.nombrePaquete = nombrePaquete;
    }

    public int getCantidadUnidadesPaquete() {
        return cantidadUnidadesPaquete;
    }

    public void setCantidadUnidadesPaquete(int cantidadUnidadesPaquete) {
        this.cantidadUnidadesPaquete = cantidadUnidadesPaquete;
    }

    public double getPrecioPaquete() {
        return precioPaquete;
    }

    public void setPrecioPaquete(double precioPaquete) {
        this.precioPaquete = precioPaquete;
    }
}
