package com.example.Dulceria.model.marca;

public class Marcas {
    private  int id;
    private String marcaProducto;


    public Marcas (){

    }

    public Marcas(int id, String marcaProducto) {
        this.id = id;
        this.marcaProducto = marcaProducto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMarcaProducto() {
        return marcaProducto;
    }

    public void setMarcaProducto(String marcaProducto) {
        this.marcaProducto = marcaProducto;
    }
}
