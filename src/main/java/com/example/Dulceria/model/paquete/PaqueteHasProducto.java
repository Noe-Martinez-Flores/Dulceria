package com.example.Dulceria.model.paquete;

import com.example.Dulceria.model.producto.Producto;

public class PaqueteHasProducto {
    private int paqueteId ;
    private int productoId;
    private Paquete paquete;
    private Producto producto;
    private int CantidadDeProductos;

    public int getCantidadDeProductos() {
        return CantidadDeProductos;
    }

    public void setCantidadDeProductos(int cantidadDeProductos) {
        CantidadDeProductos = cantidadDeProductos;
    }

    public Paquete getPaquete() {
        return paquete;
    }

    public void setPaquete(Paquete paquete) {
        this.paquete = paquete;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public PaqueteHasProducto() {
    }

    public PaqueteHasProducto(int paqueteId, int productoId) {
        this.paqueteId = paqueteId;
        this.productoId = productoId;
    }

    public int getPaqueteId() {
        return paqueteId;
    }

    public void setPaqueteId(int paqueteId) {
        this.paqueteId = paqueteId;
    }

    public int getProductoId() {
        return productoId;
    }

    public void setProductoId(int productoId) {
        this.productoId = productoId;
    }
}
