/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author nikur
 */
public class DBConnection {
    private static Connection con = null;
    public static Connection dbConnection(){
        if(con == null)
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/college_project";
            String dbUser = "root";
            String dbPassword = "NIKU@006";
            con=DriverManager.getConnection( url,dbUser, dbPassword);            
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;        
    }
}
