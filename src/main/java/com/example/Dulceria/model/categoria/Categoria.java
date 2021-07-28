package com.example.Dulceria.model.categoria;

public class Categoria {
    private int id;
    private String Nombre_de_la_categoria;

    public Categoria (){

    }

    public Categoria(int id, String nombre_de_la_categoria) {
        this.id = id;
        this.Nombre_de_la_categoria = nombre_de_la_categoria;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre_de_la_categoria() {
        return Nombre_de_la_categoria;
    }

    public void setNombre_de_la_categoria(String nombre_de_la_categoria) {
        Nombre_de_la_categoria = nombre_de_la_categoria;
    }
}
