package com.example.Dulceria.model.caducLote;

import com.example.Dulceria.model.producto.Producto;
import com.example.Dulceria.util.ConnectionMySQL;
import com.example.Dulceria.model.producto.DaoProducto;

import java.io.IOException;
import java.sql.*;
import java.util.*;

public class DaoCaducLote {
    Connection con;
    PreparedStatement pstm;
    Statement statement;
    ResultSet rs;

    public boolean createFechaCaducLote (CaducLote caducLote){
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

    public boolean updateProducto (CaducLote caducLote){
        boolean state = false;
        try{
            con = ConnectionMySQL.getConnection();
            String query = "UPDATE productos SET productos.Nombre_del_producto = ? ,productos.Cantidad_de_unidades = ?,productos.Precio_de_menudeo = ?,productos.Precio_de_mayoreo = ?,productos.MARCAS_id = ?,productos.CATEGORIAS_id = ?\n" +
                    "WHERE productos.id = ?;";

            pstm = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pstm.setString(1, caducLote.getProducto().getNombreProducto());
            pstm.setInt(2, caducLote.getProducto().getCantidadUnidades());
            pstm.setDouble(3,caducLote.getProducto().getPrecioMenudeo());
            pstm.setDouble(4,caducLote.getProducto().getPrecioMayoreo());
            pstm.setInt(5,caducLote.getProducto().getMarcasId().getId());
            pstm.setInt(6,caducLote.getProducto().getCategoriasId().getId());
            pstm.setInt(7,caducLote.getProducto().getId());
            state = pstm.executeUpdate() == 1;
            if (pstm.executeUpdate() == 1){
                String query2 = "UPDATE caduclote SET Fecha_de_caducidad = ?, Numero_de_lote = ? WHERE caduclote.id = ?;";
                pstm = con.prepareStatement(query2);
                pstm.setString(1,caducLote.getFechaCaducidad());
                pstm.setString(2,caducLote.getNumeroLote());
                pstm.setInt(3,caducLote.getId());
                state = pstm.executeUpdate() == 1;
            }
        }catch (SQLException  ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;
    }

    public List<CaducLote> findAll (){
        List<CaducLote> listProductos = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            String query = "SELECT caduclote.id as idCaducLot, caduclote.Fecha_de_caducidad,caduclote.Numero_de_lote,\n" +
                    "productos.id as idProducto,productos.Nombre_del_producto, productos.Cantidad_de_unidades, productos.Precio_de_menudeo, productos.Precio_de_mayoreo,\n" +
                    "productos.MARCAS_id, productos.CATEGORIAS_id FROM caduclote INNER JOIN productos ON caduclote.PRODUCTOS_id\n" +
                    "WHERE productos.id = caduclote.PRODUCTOS_id;";
            statement = con.createStatement();
            rs = statement.executeQuery(query);

            while (rs.next()){
                CaducLote caducLote = new CaducLote();
                caducLote.setId(rs.getInt("idCaducLot"));
                caducLote.setFechaCaducidad(rs.getString("Fecha_de_caducidad"));
                caducLote.setNumeroLote(rs.getString("Numero_de_lote"));
                Producto producto = new Producto();
                producto.setId(rs.getInt("idProducto"));
                producto.setNombreProducto(rs.getString("Nombre_del_producto"));
                producto.setCantidadUnidades(rs.getInt("Cantidad_de_unidades"));
                producto.setPrecioMenudeo(rs.getDouble("Precio_de_menudeo"));
                producto.setPrecioMayoreo(rs.getDouble("Precio_de_mayoreo"));
                caducLote.setProducto(producto);
                listProductos.add(caducLote);
            }

        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return listProductos;
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
