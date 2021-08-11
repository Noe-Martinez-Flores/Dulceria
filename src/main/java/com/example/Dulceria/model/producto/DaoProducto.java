package com.example.Dulceria.model.producto;

import com.example.Dulceria.util.ConnectionMySQL;
import java.sql.*;
public class DaoProducto {
    Connection con;
    PreparedStatement pstm;
    Statement statement;
    ResultSet rs;
public boolean createProducto (Producto producto){
    boolean state = false;
    try{
        con = ConnectionMySQL.getConnection();
        String query1 = "INSERT INTO caducLote (fecha_de_Caducidad, numero_de_lote) VALUES (?,?);";
        String query2 = "INSERT INTO productos (Nombre_del_producto,Cantidad_de_unidades,Precio_de_menudeo,Precio_de_mayoreo,MARCAS_id,CATEGORIAS_id  ) VALUES (?,?,?,?,?,?);";
        pstm = con.prepareStatement(query1, Statement.RETURN_GENERATED_KEYS);

        state = pstm.executeUpdate() == 1;
        rs = pstm.getGeneratedKeys();
        if(rs.next()){
            int idCaducLote =rs.getInt(1);
            pstm = con.prepareStatement(query2);
        }

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
