package com.example.Dulceria.model.producto;

import com.example.Dulceria.model.caducLote.CaducLote;
import com.example.Dulceria.model.categoria.Categoria;
import com.example.Dulceria.model.marca.Marcas;

public class Producto {
    private int id;
    private String nombreProducto;
    private String cantidadUnidades;
    private String precioMenudeo;
    private String precioMayoreo;
    private Marcas marcasId;
    private Categoria categoriasId;


    public Producto (){

    }

    public Producto(int id, String nombreProducto, String cantidadUnidades, String precioMenudeo, String precioMayoreo, Marcas marcasId, Categoria categoriasId) {
        this.id = id;
        this.nombreProducto = nombreProducto;
        this.cantidadUnidades = cantidadUnidades;
        this.precioMenudeo = precioMenudeo;
        this.precioMayoreo = precioMayoreo;
        this.marcasId = marcasId;
        this.categoriasId = categoriasId;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getCantidadUnidades() {
        return cantidadUnidades;
    }

    public void setCantidadUnidades(String cantidadUnidades) {
        this.cantidadUnidades = cantidadUnidades;
    }

    public String getPrecioMenudeo() {
        return precioMenudeo;
    }

    public void setPrecioMenudeo(String precioMenudeo) {
        this.precioMenudeo = precioMenudeo;
    }

    public String getPrecioMayoreo() {
        return precioMayoreo;
    }

    public void setPrecioMayoreo(String precioMayoreo) {
        this.precioMayoreo = precioMayoreo;
    }

    public Marcas getMarcasId() {
        return marcasId;
    }

    public void setMarcasId(Marcas marcasId) {
        this.marcasId = marcasId;
    }

    public Categoria getCategoriasId() {
        return categoriasId;
    }

    public void setCategoriasId(Categoria categoriasId) {
        this.categoriasId = categoriasId;
    }


}
