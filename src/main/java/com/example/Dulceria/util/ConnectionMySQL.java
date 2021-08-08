

package com.example.Dulceria.util;
import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionMySQL {
    public static Connection getConnection() throws SQLException {
        DriverManager.registerDriver(new Driver());
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/dulceria?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","2252");

    }

    public static void main(String[] args) {
        try{
            Connection con = ConnectionMySQL.getConnection();
            System.out.println("Conexion exitosa");

        }catch (Exception e){
            e.printStackTrace();
        }
    }

}

