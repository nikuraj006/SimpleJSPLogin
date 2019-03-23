/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author nikur
 */
public class AuthCheck {
    public static ResultSet authCheck(String userName, String password,String sqlQuery){
        try{
        Connection con = DBConnection.dbConnection();
        PreparedStatement stmt=con.prepareStatement(sqlQuery);
        stmt.setString(1, userName);
        stmt.setString(2, password);
        ResultSet result = stmt.executeQuery();
        return result;
    }catch(Exception e){
        e.printStackTrace();
    }
        return null;
    }   
}
