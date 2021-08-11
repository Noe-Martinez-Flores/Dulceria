package com.example.Dulceria.model.caducLote;

import com.example.Dulceria.model.producto.Producto;

public class CaducLote {
    private int id;
    private String fechaCaducidad;
    private String numeroLote;
    private Producto producto;

    public CaducLote(){

    }

    public CaducLote(int id, String fechaCaducidad, String numeroLote) {
        this.id = id;
        this.fechaCaducidad = fechaCaducidad;
        this.numeroLote = numeroLote;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFechaCaducidad() {
        return fechaCaducidad;
    }

    public void setFechaCaducidad(String fechaCaducidad) {
        this.fechaCaducidad = fechaCaducidad;
    }

    public String getNumeroLote() {
        return numeroLote;
    }

    public void setNumeroLote(String numeroLote) {
        this.numeroLote = numeroLote;
    }
}
