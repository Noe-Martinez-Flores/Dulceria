package com.example.Dulceria.model.personal;

import com.example.Dulceria.util.ConnectionMySQL;

import java.sql.*;

public class DaoPersonal {
    Connection con;
    PreparedStatement pstm; //kery sentencias de sql , lento pero seguro
    Statement statement; //se utiliza para realizar consultas , rapido pero inseguro
    ResultSet rs;

    public boolean createPersonal (Personal personal){
        boolean state = false;
        try{

            con = ConnectionMySQL.getConnection();
            String query = "INSERT INTO personal (Nombre_completo, Nombre_de_usuario, Contraseña, Correo_Electronico, Numero_de_telefono, ROL_id) VALUES (?,?,?,?,?,2);";
            pstm = con.prepareStatement(query);
            pstm.setString(1, personal.getNombreCompleto());
            pstm.setString(2,personal.getNombreUsuario());
            pstm.setString(3,personal.getPassword());
            pstm.setString(4,personal.getEmail());
            pstm.setString(5, personal.getPhoneNumber());
            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;
    }

    public void closeConnection(){
        try{
            if (con != null){
                con.close();
            }
            if (pstm != null){
                pstm.close();
            }
            if (rs != null){
                rs.close();
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {

        }
    }
}
