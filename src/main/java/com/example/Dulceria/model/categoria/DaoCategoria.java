package com.example.Dulceria.model.categoria;

import com.example.Dulceria.model.marca.Marcas;
import com.example.Dulceria.util.ConnectionMySQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoCategoria {
    Connection con;
    PreparedStatement pstm; //kery sentencias de sql , lento pero seguro
    Statement statement; //se utiliza para realizar consultas , rapido pero inseguro
    ResultSet rs; //navega a travez de los indices para la consulta

    public boolean createCategoria (Categoria categoria){
        boolean state = false;
        try {
            con = ConnectionMySQL.getConnection();
            String query = "INSERT INTO categorias (categorias.Nombre_de_la_categoria) VALUES (?);";
            pstm = con.prepareStatement(query);
            pstm.setString(1,categoria.getNombre_de_la_categoria());

            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;
    }

    public boolean updateCategoria (Categoria categoria){  //C copio el codigo de createPerson
        boolean state = false;
        try {
            con = ConnectionMySQL.getConnection();
            String query = " UPDATE categorias  SET categorias.Nombre_de_la_categoria = ? WHERE categorias.id = ?;";
            pstm = con.prepareStatement(query);
            pstm.setString(1,categoria.getNombre_de_la_categoria());
            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;
    }

    public boolean deleteCategoria(int id){  //C copio el codigo de updatePerson y el parametro fue cambiado de Person a int id, se cambio el query tambien xd
        boolean state = false;
        try {
            con = ConnectionMySQL.getConnection();
            String query = "DELETE FROM categorias WHERE categorias.id = ?;";
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

    public List<Categoria> findAll () {
        List<Categoria> listCategorias = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            String query = "SELECT categorias.id, categorias.Nombre_de_la_categoria FROM categorias;";

            statement = con.createStatement();
            rs = statement.executeQuery(query);

            while  (rs.next()){
                Categoria categoria = new Categoria();
                categoria.setId(rs.getInt("id"));
                categoria.setNombre_de_la_categoria(rs.getString("Nombre_de_la_categoria"));

                listCategorias.add(categoria);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return listCategorias;

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
