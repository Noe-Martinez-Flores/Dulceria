package com.example.Dulceria.model.personal;

import com.example.Dulceria.model.rol.Rol;

public class Personal {
    private int id;
    private String nombreCompleto;
    private String nombreUsuario;
    private String password;
    private String email;
    private String phoneNumber;
    private String code;
    private Rol rolId;

    public Personal (){

    }

    public Personal(int id, String nombreCompleto, String nombreUsuario, String password, String email, String phoneNumber, String code, Rol rolId) {
        this.id = id;
        this.nombreCompleto = nombreCompleto;
        this.nombreUsuario = nombreUsuario;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.code = code;
        this.rolId = rolId;

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

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Rol getRolId() {
        return rolId;
    }

    public void setRolId(Rol rolId) {
        this.rolId = rolId;
    }
}
