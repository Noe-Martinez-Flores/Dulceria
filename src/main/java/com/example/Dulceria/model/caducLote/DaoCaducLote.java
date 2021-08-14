package com.example.Dulceria.model.caducLote;

import com.example.Dulceria.util.ConnectionMySQL;
import com.example.Dulceria.model.producto.DaoProducto;

import java.io.IOException;
import java.sql.*;

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
