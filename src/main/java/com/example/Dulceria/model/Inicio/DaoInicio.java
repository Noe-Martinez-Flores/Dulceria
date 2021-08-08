package com.example.Dulceria.model.Inicio;

import com.example.Dulceria.model.rol.Rol;
import com.example.Dulceria.model.Inicio.Inicio;
import com.example.Dulceria.util.ConnectionMySQL;

import javax.swing.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoInicio {
    Connection con;
    PreparedStatement pstm;
    Statement statement;
    ResultSet rs;

    public Inicio login (String nombreDeUsuario, String password) {
        Inicio user = new Inicio();
        try {
            con = ConnectionMySQL.getConnection();
            String query = "SELECT personal.id as idUsuario,personal.Nombre_completo as nombre,personal.Nombre_de_usuario as usuario ,\n" +
                    " personal.contraseña as contraseña , personal.Correo_Electronico as correo_electronico,\n" +
                    " personal.Numero_de_telefono as telefono, rol.id as idRol, rol.puesto as rolNombre\n" +
                    "                    FROM rol INNER JOIN personal ON personal.ROL_id = rol.id \n" +
                    "                    AND personal.Nombre_de_usuario = ? AND personal.contraseña = ?;";

            pstm = con.prepareStatement(query);
            pstm.setString(1, nombreDeUsuario);
            pstm.setString(2, password);
            rs = pstm.executeQuery();
            if (rs.next()) {
                user.setId(rs.getInt("idUsuario"));
                user.setNombreCompleto(rs.getString("nombre"));
                user.setNombreDeUsuario(rs.getString("usuario"));
                user.getContraseña(rs.getString("contraseña"));
                user.setCorreoElectronico(rs.getString("correo_electronico"));
                user.setNumeroDeTelefono(rs.getString("telefono"));


                Rol rol = new Rol();
                rol.setId(rs.getInt("idRol"));
                rol.setPuesto(rs.getString("rolNombre"));
                user.setRol(rol);
                user.setMessage("good");

            } else {
                user.setMessage("fail");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }

        return user;
    }
    public List<Inicio> findAll() {
        List<Inicio> listUser = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            String query = "SELECT usuario.id as idusuario , usuario.correo_electronico as email ,rol.id as idrol , rol.nombre as rol ,persona.id as idpersona , concat(persona.nombre,' ',persona.primer_apellido,' ',persona.segundo_apellido) as nombrecompleto,\n" +
                    "persona.telefono as telefono, persona.fecha_nacimiento as fechanacimiento \n" +
                    "FROM rol inner join usuario on rol.id = usuario.rol_id inner join persona on persona.id =  usuario.persona_id;";
            statement = con.createStatement();
            rs = statement.executeQuery(query);
            while (rs.next()) {
                Inicio user = new Inicio();
                user.setId(rs.getInt("idUsuario"));
                user.setNombreCompleto(rs.getString("nombre"));
                user.setNombreDeUsuario(rs.getString("primer_apellido"));
                user.getContraseña(rs.getString("segundo_apellido"));
                user.setCorreoElectronico(rs.getString("correo_electronico"));
                user.setNumeroDeTelefono(rs.getString("nombre"));


                Rol rol = new Rol();
                rol.setId(rs.getInt("idRol"));
                rol.setPuesto(rs.getString("rolNombre"));
                user.setRol(rol);


                listUser.add(user);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return listUser;
    }


    public void closeConnection() {
        try {
            if (con != null) {
                con.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}