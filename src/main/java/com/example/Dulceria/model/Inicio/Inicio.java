package com.example.Dulceria.model.Inicio;

import com.example.Dulceria.model.rol.Rol;

public class Inicio {
    private int id;
    private  String nombreCompleto;
    private  String nombreDeUsuario;
    private  String contraseña;
    private  String correoElectronico;
    private  String numeroDeTelefono;
    private  String codigo;
    private Rol rol;
    private String message;



    public Inicio() {
    }

    public Inicio(int id, String nombreCompleto, String nombreDeUsuario, String contraseña, String correoElectronico, String numeroDeTelefono, String codigo, Rol rol,String message) {
        this.id = id;
        this.nombreCompleto = nombreCompleto;
        this.nombreDeUsuario = nombreDeUsuario;
        this.contraseña = contraseña;
        this.correoElectronico = correoElectronico;
        this.numeroDeTelefono = numeroDeTelefono;
        this.codigo = codigo;
        this.rol = rol;
        this.message = message;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getNombreDeUsuario() {
        return nombreDeUsuario;
    }

    public void setNombreDeUsuario(String nombreDeUsuario) {
        this.nombreDeUsuario = nombreDeUsuario;
    }

    public String getContraseña(String segundo_apellido) {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getNumeroDeTelefono() {
        return numeroDeTelefono;
    }

    public void setNumeroDeTelefono(String numeroDeTelefono) {
        this.numeroDeTelefono = numeroDeTelefono;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
