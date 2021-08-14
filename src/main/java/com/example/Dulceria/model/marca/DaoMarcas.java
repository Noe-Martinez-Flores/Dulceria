package com.example.Dulceria.model.marca;

import com.example.Dulceria.model.categoria.Categoria;
import com.example.Dulceria.model.categoria.DaoCategoria;
import com.example.Dulceria.util.ConnectionMySQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class DaoMarcas {
    Connection con;
    //query sentencias de sql , lento pero seguro
    PreparedStatement pstm;
    //se utiliza para realizar consultas , rapido pero inseguro
    Statement statement;
    //navega a travez de los indices para la consulta
    ResultSet rs;


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

    public boolean updateMarca (Marcas marcas){
        boolean stateUpdateMarca = false;
        try {
            con = ConnectionMySQL.getConnection();
            String query = "UPDATE marcas SET Marca_del_producto = ? WHERE id = ?;";
            pstm = con.prepareStatement(query);
            pstm.setString(1,marcas.getMarcaProducto());
            pstm.setInt(2, marcas.getId());
            stateUpdateMarca = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return stateUpdateMarca;
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
            String query = "SELECT * FROM marcas WHERE marcas.id = ?;";
            pstm = con.prepareStatement(query);
            pstm.setInt(1,id);
            rs = pstm.executeQuery();

            if (rs.next()){
                marcas.setId(rs.getInt(1));
                marcas.setMarcaProducto(rs.getString(2));
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return marcas;

    }

    public List<Marcas> findMarcas(String marca) {
        List<Marcas> listMarcas = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            String query = "SELECT marcas.id, marcas.Marca_del_producto FROM marcas where marcas.Marca_del_producto  LIKE '%" + marca + "%';";
            pstm=con.prepareStatement(query);
            rs=pstm.executeQuery();
            while (rs.next()){

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

    public static void main(String[] args) { //test del backend
        DaoCategoria dao = new DaoCategoria();
        List<Categoria> list = dao.findAll();
        for(Categoria xd : list){
            System.out.println(xd.getId());
            System.out.println(xd.getNombreCategoria());

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
        }
    }
}
