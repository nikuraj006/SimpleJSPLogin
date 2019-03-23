/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.sql.Connection;

/**
 *
 * @author nikur
 */
public class Main {
    public static void main(String[] args){
        Connection con = DBConnection.dbConnection();
        System.out.println(con);
    }
    
}
