/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tech.dao;

import com.tech.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class UserDAO {
   private Connection con;

    public UserDAO(Connection con) {
        this.con = con;
    }
    
    public Boolean saveUser(User user){
        
         Boolean f=false;
        try{
           
            
            String q="insert into user(name ,email,password,gender,about) values(?,?,?,?,?)";
          PreparedStatement psmt=this.con.prepareStatement(q);
          psmt.setString(1,user.getName());
          psmt.setString(2,user.getEmail());
          psmt.setString(3, user.getPassword());
          psmt.setString(4, user.getGender());
          psmt.setString(5,user.getAbout());
          
          psmt.executeUpdate();
          f=true;
        }
        catch(SQLException e){
        e.printStackTrace();
        }
        return f;
    }
   //get user by Email and Password
    
    public User getUserByEmailAndPass(String email,String pass){
      User user=null;
        try {
            String Query="select * from user where email=? and password=? ";
            PreparedStatement psmt=con.prepareStatement(Query);
            psmt.setString(1,email);
            psmt.setString(2, pass);
            
           ResultSet rs= psmt.executeQuery();
           if(rs.next()){
              user=new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
                user.setGender(rs.getString(5));
                user.setAbout(rs.getString(6));
                user.setRdate(rs.getTimestamp(7).toString());
                user.setProfile(rs.getString(8));
              
           }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public Boolean updateUser(User u) {
        Boolean f=false;
        try {
            String q="update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=? ";
      PreparedStatement psmt=con.prepareStatement(q);
      psmt.setString(1,u.getName());
      psmt.setString(2,u.getEmail());
      psmt.setString(3,u.getPassword());
      psmt.setString(4,u.getGender());
      psmt.setString(5,u.getAbout());
      psmt.setString(6,u.getProfile());
      psmt.setInt(7,u.getId());
      
        psmt.executeUpdate();
        f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f; 
    }
}
