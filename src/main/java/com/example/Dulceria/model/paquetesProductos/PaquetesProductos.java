package com.example.Dulceria.model.paquetesProductos;

import com.example.Dulceria.model.paquete.Paquete;
import com.example.Dulceria.model.producto.Producto;

public class PaquetesProductos {
    private Producto producto;
    private Paquete paquete;

    public PaquetesProductos (){

    }

    public PaquetesProductos(Producto producto, Paquete paquete) {
        this.producto = producto;
        this.paquete = paquete;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Paquete getPaquete() {
        return paquete;
    }

    public void setPaquete(Paquete paquete) {
        this.paquete = paquete;
    }
}
