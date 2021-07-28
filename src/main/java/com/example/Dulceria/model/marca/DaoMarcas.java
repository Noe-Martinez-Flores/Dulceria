package com.example.Dulceria.model.marca;

import com.example.Dulceria.util.ConnectionMySQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoMarcas {
    Connection con;
    PreparedStatement pstm; //kery sentencias de sql , lento pero seguro
    Statement statement; //se utiliza para realizar consultas , rapido pero inseguro
    ResultSet rs; //navega a travez de los indices para la consulta


    public boolean createMarca (Marcas marcas){
        boolean state = false;
        try {
            con = ConnectionMySQL.getConnection();
            String query = "INSERT INTO marcas (marcas.Marca_del_producto) VALUES (?);";
            pstm = con.prepareStatement(query);
            pstm.setString(1,marcas.getMarcaProducto());

            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;
    }


    public boolean updateMarca (Marcas marcas){  //C copio el codigo de createPerson
        boolean state = false;
        try {
            con = ConnectionMySQL.getConnection();
            String query = "UPDATE marcas  SET marcas.Marca_del_producto = ? WHERE marcas.id = ?;";
            pstm = con.prepareStatement(query);
            pstm.setString(1,marcas.getMarcaProducto());
            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;
    }


    public boolean deleteMarca (int id){  //C copio el codigo de updatePerson y el parametro fue cambiado de Person a int id, se cambio el query tambien xd
        boolean state = false;
        try {
            con = ConnectionMySQL.getConnection();
            String query = "DELETE FROM marcas WHERE marcas.id = ?;";
            pstm = con.prepareStatement(query);

            pstm.setInt(1,id);
            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;
    }

    public List<Marcas> findAll () {
        List<Marcas> listMarcas = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            String query = "SELECT marcas.id, marcas.Marca_del_producto FROM marcas;";

            statement = con.createStatement();
            rs = statement.executeQuery(query);

            while  (rs.next()){
                Marcas marcas = new Marcas();
                marcas.setId(rs.getInt("id"));
                marcas.setMarcaProducto(rs.getString("Marca_del_producto"));

                listMarcas.add(marcas);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return listMarcas;

    }

    public Marcas findById (int id){
        Marcas marcas = new Marcas();
        try{
            con = ConnectionMySQL.getConnection();
            String query = "SELECT marcas.id, marcas.Marca_del_producto FROM marcas WHERE marcas.id = ?;";
            pstm = con.prepareStatement(query);
            pstm.setInt(1,id);
            rs = pstm.executeQuery();

            if (rs.next()){
                marcas.setId(rs.getInt("id"));
                marcas.setMarcaProducto(rs.getString("nombre"));
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return marcas;

    }

    public static void main(String[] args) {
        DaoMarcas dao = new DaoMarcas();
        List<Marcas> list = dao.findAll();

        for (Marcas marcas : list){
            System.out.println(marcas.getId());
            System.out.println(marcas.getMarcaProducto());
        }

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
