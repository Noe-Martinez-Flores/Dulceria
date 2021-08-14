package com.example.Dulceria.model.producto;

import com.example.Dulceria.model.caducLote.CaducLote;
import com.example.Dulceria.model.categoria.Categoria;
import com.example.Dulceria.model.marca.Marcas;
import com.example.Dulceria.util.ConnectionMySQL;

import java.io.IOException;
import java.util.*;
import java.sql.*;
public class DaoProducto {
    Connection con;
    PreparedStatement pstm;
    Statement statement;
    ResultSet rs;

public boolean createProducto (CaducLote caducLote){
    boolean state = false;
    try{
        con = ConnectionMySQL.getConnection();
        String query1 = "INSERT INTO productos (Nombre_del_producto,Cantidad_de_unidades,Precio_de_menudeo,Precio_de_mayoreo,MARCAS_id,CATEGORIAS_id  ) VALUES (?,?,?,?,?,?);";
        String query2 = "INSERT INTO caducLote (fecha_de_Caducidad, numero_de_lote,PRODUCTOS_id) VALUES (?,?,?);";
        pstm = con.prepareStatement(query1, Statement.RETURN_GENERATED_KEYS);
        pstm.setString(1, caducLote.getProducto().getNombreProducto());
        pstm.setInt(2,caducLote.getProducto().getCantidadUnidades());
        pstm.setDouble(3,caducLote.getProducto().getPrecioMenudeo());
        pstm.setDouble(4,caducLote.getProducto().getPrecioMayoreo());
        pstm.setInt(5,caducLote.getProducto().getMarcasId().getId());
        pstm.setInt(6,caducLote.getProducto().getCategoriasId().getId());
        state = pstm.executeUpdate() == 1;
        rs = pstm.getGeneratedKeys();
        if(rs.next()){
            int idProducto =rs.getInt(1);
            pstm = con.prepareStatement(query2);
            pstm.setString(1,caducLote.getFechaCaducidad());
            pstm.setString(2,caducLote.getNumeroLote());
            pstm.setInt(3,idProducto);
            state = pstm.executeUpdate() == 1;
        }

    }catch (SQLException ex){
        ex.printStackTrace();
    }finally {
        closeConnection();
    }
    return state;
}

    public List<CaducLote> findAll () {
        List<CaducLote> listProd = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            String query = "SELECT productos.id AS prodId, productos.Nombre_del_producto AS nombre, productos.Cantidad_de_unidades as existencia, `caduclote`.id as caducId, `caduclote`.Fecha_de_caducidad as caducidad\n" +
                    "FROM `caduclote` inner join productos \n" +
                    "on productos.id = `caduclote`.PRODUCTOS_id ;";

            statement = con.createStatement();
            rs = statement.executeQuery(query);

            while  (rs.next()){
                CaducLote caduc =new CaducLote();
                caduc.setId(rs.getInt("caducId"));
                caduc.setFechaCaducidad(rs.getString("caducidad"));
                Producto prod = new Producto();
                prod.setId(rs.getInt("prodId"));
                prod.setNombreProducto(rs.getString("nombre"));
                prod.setCantidadUnidades(rs.getInt("existencia"));

                caduc.setProducto(prod);
                listProd.add(caduc);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return listProd;

    }

    public List<CaducLote> findProductos(String producto) {
        List<CaducLote> listProd = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            String query = "SELECT productos.id AS prodId, productos.Nombre_del_producto AS nombre, productos.Cantidad_de_unidades as existencia, `caduclote`.id as caducId, `caduclote`.Fecha_de_caducidad as caducidad\n" +
                    "FROM `caduclote` inner join productos \n" +
                    "on productos.id = `caduclote`.PRODUCTOS_id \n" +
                    "where productos.Nombre_del_producto LIKE '%" + producto + "%';";
            pstm=con.prepareStatement(query);
            rs=pstm.executeQuery();
            while (rs.next()){

                CaducLote caduc =new CaducLote();
                caduc.setId(rs.getInt("caducId"));
                caduc.setFechaCaducidad(rs.getString("caducidad"));
                Producto prod = new Producto();
                prod.setId(rs.getInt("prodId"));
                prod.setNombreProducto(rs.getString("nombre"));
                prod.setCantidadUnidades(rs.getInt("existencia"));

                caduc.setProducto(prod);
                listProd.add(caduc);

            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return listProd;
    }

    public boolean deleteProducto (int id){
        boolean state = false;
        try{
            con = ConnectionMySQL.getConnection();
            String query = "DELETE FROM productos WHERE productos.id = ?";
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



    public CaducLote findById (int id){

        CaducLote caducLote = new CaducLote();
        Producto producto = new Producto();
        try{
            con = ConnectionMySQL.getConnection();
            String query = "SELECT productos.id,Nombre_del_producto,Cantidad_de_unidades,Precio_de_menudeo,Precio_de_mayoreo,Fecha_de_caducidad,Numero_de_lote,\n" +
                    "categorias.id as categoriasId, categorias.Nombre_de_la_categoria, marcas.id as marcasId,caduclote.id as caducId, Marca_del_producto\n" +
                    "FROM productos INNER JOIN caduclote ON caduclote.PRODUCTOS_id = productos.id\n" +
                    "INNER JOIN categorias on CATEGORIAS_id = categorias.id \n" +
                    "INNER JOIN  marcas ON MARCAS_id = marcas.id\n" +
                    "WHERE productos.id = ?;";
            pstm = con.prepareStatement(query);
            pstm.setInt(1,id);
            rs = pstm.executeQuery();

            if(rs.next()){
                caducLote.setId(rs.getInt("caducId"));
                caducLote.setFechaCaducidad(rs.getString("Fecha_de_caducidad"));
                caducLote.setNumeroLote(rs.getString("Numero_de_lote"));
                producto.setId(rs.getInt("id"));
                producto.setNombreProducto(rs.getString("Nombre_del_producto"));
                producto.setCantidadUnidades(rs.getInt("Cantidad_de_unidades"));
                producto.setPrecioMenudeo(rs.getDouble("Precio_de_menudeo"));
                producto.setPrecioMayoreo(rs.getDouble("Precio_de_mayoreo"));
                caducLote.setProducto(producto);
                Marcas marcas = new Marcas();
                marcas.setId(rs.getInt("marcasId"));
                marcas.setMarcaProducto(rs.getString("Marca_del_producto"));
                caducLote.setMarcas(marcas);
                Categoria categoria = new Categoria();
                categoria.setId(rs.getInt("categoriasId"));
                categoria.setNombreCategoria(rs.getString("Nombre_de_la_categoria"));
                caducLote.setCategoria(categoria);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return caducLote;
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
