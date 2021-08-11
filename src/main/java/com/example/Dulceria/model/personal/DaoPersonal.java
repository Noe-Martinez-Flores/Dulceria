package com.example.Dulceria.model.personal;

import com.example.Dulceria.model.categoria.Categoria;
import com.example.Dulceria.model.marca.Marcas;
import com.example.Dulceria.util.ConnectionMySQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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

    public boolean updatePersonal (Personal personal){
        boolean state = false;
        try{

            con = ConnectionMySQL.getConnection();
            String query = "UPDATE personal SET Nombre_completo = ?,Nombre_de_usuario = ?, Contraseña = ?, Correo_Electronico = ?,Numero_de_telefono = ? WHERE personal.id = ?;";
            pstm = con.prepareStatement(query);
            pstm.setString(1, personal.getNombreCompleto());
            pstm.setString(2,personal.getNombreUsuario());
            pstm.setString(3,personal.getPassword());
            pstm.setString(4,personal.getEmail());
            pstm.setString(5, personal.getPhoneNumber());
            pstm.setInt(6,personal.getId());
            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;
    }

    public boolean deletePersonal (int  id){
        boolean state = false;
        try{

            con = ConnectionMySQL.getConnection();
            String query = "DELETE FROM personal WHERE personal.id = ?;";
            pstm = con.prepareStatement(query);
            pstm.setInt(1, id);
            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;
    }

    public Personal findById (int id){
        Personal personal = new Personal();
        try{
            con = ConnectionMySQL.getConnection();
            String query = "SELECT id, Nombre_completo, Nombre_de_usuario, Contraseña, Correo_Electronico, Numero_de_telefono FROM personal WHERE id = ?;";
            pstm = con.prepareStatement(query);
            pstm.setInt(1,id);
            rs = pstm.executeQuery();

            if (rs.next()){
                personal.setId(rs.getInt("id"));
                personal.setNombreCompleto(rs.getString("Nombre_completo"));
                personal.setNombreUsuario(rs.getString("Nombre_de_usuario"));
                personal.setPassword(rs.getString("Contraseña"));
                personal.setEmail(rs.getString("Correo_Electronico"));
                personal.setPhoneNumber(rs.getString("Numero_de_telefono"));
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return personal;

    }

    public List<Personal> findAll () {
        List<Personal> listPersonal = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            String query = "SELECT id,Nombre_completo, Nombre_de_usuario,Correo_Electronico, Numero_de_telefono FROM personal WHERE ROL_id = 2;";

            statement = con.createStatement();
            rs = statement.executeQuery(query);

            while  (rs.next()){
                Personal personal = new Personal();
                personal.setId(rs.getInt("id"));
                personal.setNombreCompleto(rs.getString("Nombre_completo"));
                personal.setNombreUsuario(rs.getString("Nombre_de_usuario"));
                personal.setEmail(rs.getString("Correo_Electronico"));
                personal.setPhoneNumber(rs.getString("Numero_de_telefono"));

                listPersonal.add(personal);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return listPersonal;

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
