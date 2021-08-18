package com.example.Dulceria.model.paquete;

import com.example.Dulceria.model.categoria.Categoria;
import com.example.Dulceria.model.marca.Marcas;
import com.example.Dulceria.model.producto.Producto;
import com.example.Dulceria.util.ConnectionMySQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoPaquete {
    Connection con;
    PreparedStatement pstm;
    Statement statement;
    ResultSet rs;


    public boolean crearPaquete(Paquete paquete){
        boolean state = false;
        try {
            con = ConnectionMySQL.getConnection();
            String query = "insert into paquetes(Nombre_del_paquete,cantidad_de_unidades_por_paquete,Precio_del_paquete) values (?, ?, ?);";
            pstm = con.prepareStatement(query);
            pstm.setString(1,paquete.getNombrePaquete());
            pstm.setInt(2,paquete.getCantidadUnidadesPaquete());
            pstm.setDouble(3,paquete.getPrecioPaquete());

            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;
    }
    public Paquete regresarIdPaquete(String namePaquete){

      Paquete paquete = new Paquete();
        try {
            con = ConnectionMySQL.getConnection();
        String query="SELECT paquetes.id FROM paquetes WHERE paquetes.Nombre_del_paquete = ?;";
            pstm = con.prepareStatement(query);
            pstm.setString(1, namePaquete);
            rs = pstm.executeQuery();
            if (rs.next()){
                paquete.setId(rs.getInt(1));

            }


        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
return paquete;

    }
    public  List<PaqueteHasProducto> consultarProdPaq(int idPaquete){
        List<PaqueteHasProducto> listProd = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            String query="select productos.id as idProducto ,productos.Nombre_del_producto as nombreProducto ,categorias.id as idCategoria,\n" +
                    "categorias.Nombre_de_la_categoria as nombreCategoria,marcas.id as idMarca ,marcas.Marca_del_producto as nombreMarca,\n" +
                    "paquetes_has_productos.CantidadDeProductos as cantidadProd from paquetes_has_productos inner join productos on  paquetes_has_productos.PRODUCTOS_id=productos.id inner join\n" +
                    "marcas on productos.MARCAS_id=marcas.id inner join categorias on  productos.CATEGORIAS_id=categorias.id \n" +
                    "where paquetes_has_productos.PAQUETES_id= "+ idPaquete +" ;";
            pstm =con.prepareStatement(query);
            rs=pstm.executeQuery();
            while (rs.next()){
                PaqueteHasProducto paqueteHasProducto = new PaqueteHasProducto();
                Producto producto =new Producto();
                Marcas marca = new Marcas();
                Categoria categoria = new Categoria();
                paqueteHasProducto.setCantidadDeProductos(rs.getInt("cantidadProd"));
                producto.setId(rs.getInt("idProducto"));
                producto.setNombreProducto(rs.getString("nombreProducto"));
                categoria.setId(rs.getInt("idCategoria"));
                categoria.setNombreCategoria(rs.getString("nombreCategoria"));
                marca.setId(rs.getInt("idMarca"));
                marca.setMarcaProducto(rs.getString("nombreMarca"));
                producto.setCategoriasId(categoria);
                producto.setMarcasId(marca);
                paqueteHasProducto.setCantidadDeProductos(rs.getInt("cantidadProd"));
                paqueteHasProducto.setProducto(producto);

                listProd.add(paqueteHasProducto);
            }
    }catch (SQLException ex){
        ex.printStackTrace();
    }finally {
        closeConnection();
    }

return listProd;
}
public Paquete retornarPaquete(int idPaquete){
        Paquete paquete=new Paquete();
    try {
        con = ConnectionMySQL.getConnection();
        String query="SELECT paquetes.Nombre_del_paquete as nombre FROM paquetes WHERE paquetes.id = "+idPaquete+";";
        pstm = con.prepareStatement(query);

        rs = pstm.executeQuery();
        if (rs.next()){

            paquete.setNombrePaquete(rs.getString("nombre"));
        }


    }catch (SQLException ex){
        ex.printStackTrace();
    }finally {
        closeConnection();
    }
        return paquete;
}
    public List<PaqueteHasProducto> consultarPaquetes(){
        List<PaqueteHasProducto> listPaquete = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
        String query="SELECT  DISTINCT   paquetes.id as id ,PAQUETES.Nombre_del_paquete as nombre, paquetes.cantidad_de_unidades_por_paquete as cantidad, paquetes.Precio_del_paquete as precio \n" +
                "FROM dulceria.paquetes INNER JOIN paquetes_has_productos ON paquetes.id = paquetes_has_productos.paquetes_id ;";
            statement = con.createStatement();
            rs = statement.executeQuery(query);

            while (rs.next()){
                PaqueteHasProducto paqueteHasProducto = new PaqueteHasProducto();
                Paquete paquete=new Paquete();
                paquete.setId(rs.getInt("id"));
                paquete.setNombrePaquete(rs.getString("nombre"));
                paquete.setCantidadUnidadesPaquete(rs.getInt("cantidad"));
                paquete.setPrecioPaquete(rs.getDouble("precio"));
                paqueteHasProducto.setPaquete(paquete);

                listPaquete.add(paqueteHasProducto);
            }


        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }

return listPaquete;
    }
    public boolean agregarProdAPaquete(PaqueteHasProducto paquete){
        boolean state = false;
        try {
            con = ConnectionMySQL.getConnection();
            String query = "insert into paquetes_has_productos(PAQUETES_id,PRODUCTOS_id,CantidadDeProductos) values(?,?,?)";
            pstm = con.prepareStatement(query);
            pstm.setInt(1,paquete.getPaqueteId());
            pstm.setInt(2,paquete.getProductoId());
            pstm.setInt(3,paquete.getCantidadDeProductos());


            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;
    }


    public List<Paquete> findAllpaqhasprod() {
        List<Paquete> listPaquete = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            String query = "SELECT paquetes.id as id, paquetes.Nombre_del_paquete as nombre ," +
                    "paquetes.cantidad_de_unidades_por_paquete as cantidad, " +
                    "paquetes.Precio_del_paquete as precio FROM paquetes;";

            statement = con.createStatement();
            rs = statement.executeQuery(query);

            while (rs.next()){
                Paquete paquete = new Paquete();
                paquete.setId(rs.getInt("id"));
                paquete.setNombrePaquete(rs.getString("nombre"));
                paquete.setCantidadUnidadesPaquete(rs.getInt("cantidad"));
                paquete.setPrecioPaquete(rs.getDouble("precio"));

                listPaquete.add(paquete);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return listPaquete;

    }
    public List<Paquete> findAll () {
        List<Paquete> listPaquete = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            String query = "SELECT paquetes.id as id, paquetes.Nombre_del_paquete as nombre ," +
                    "paquetes.cantidad_de_unidades_por_paquete as cantidad, " +
                    "paquetes.Precio_del_paquete as precio FROM paquetes;";

            statement = con.createStatement();
            rs = statement.executeQuery(query);

            while (rs.next()){
                Paquete paquete = new Paquete();
                paquete.setId(rs.getInt("id"));
                paquete.setNombrePaquete(rs.getString("nombre"));
                paquete.setCantidadUnidadesPaquete(rs.getInt("cantidad"));
                paquete.setPrecioPaquete(rs.getDouble("precio"));

                listPaquete.add(paquete);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return listPaquete;

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
            } if (statement != null){
                statement.close();
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
    }

}
