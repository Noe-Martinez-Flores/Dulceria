package com.example.Dulceria.model.caducLote;

import com.example.Dulceria.model.categoria.Categoria;
import com.example.Dulceria.model.marca.Marcas;
import com.example.Dulceria.model.producto.Producto;

public class CaducLote {
    private int id;
    private String fechaCaducidad;
    private String numeroLote;
    private Producto producto;
    private Marcas marcas;
    private Categoria categoria;


    public CaducLote(){

    }

    public CaducLote(int id, String fechaCaducidad, String numeroLote, Producto producto, Marcas marcas, Categoria categoria) {
        this.id = id;
        this.fechaCaducidad = fechaCaducidad;
        this.numeroLote = numeroLote;
        this.producto = producto;
        this.marcas = marcas;
        this.categoria = categoria;
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

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Marcas getMarcas() {
        return marcas;
    }

    public void setMarcas(Marcas marcas) {
        this.marcas = marcas;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
}
