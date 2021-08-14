package com.example.Dulceria.model.paquete;

import java.sql.*;

public class DaoPaquete {
    Connection con;
    PreparedStatement pstm;
    Statement statement;
    ResultSet rs;



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
