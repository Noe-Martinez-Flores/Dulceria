package com.example.Dulceria.model.rol;

public class Rol {
    private int id;
    private String puesto;

    public Rol (){

    }

    public Rol(int id, String puesto) {
        this.id = id;
        this.puesto = puesto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }
}
