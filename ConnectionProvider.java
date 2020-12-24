/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tech.helper;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author DELL
 */
public class ConnectionProvider {
    public static Connection con;
    public static Statement st;
    
    static{
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url="jdbc:mysql://localhost:3307/techBlog";
        String name="root";
        String pass="@Rohit12";
     con= DriverManager.getConnection(url,name,pass);
         st=con.createStatement(); /////////////////////
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException ex) {
         System.out.println(ex);
    }
    
}

public static Connection getConnection(){
    return con;
}
public static Statement getStatement(){
    return st;
}

}

   