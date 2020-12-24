/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.dao;

import com.tech.entities.Catagorie;
import com.tech.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class PostDAO {

    private Connection con;

    public PostDAO(Connection con) {
        this.con = con;
    }

    public ArrayList<Catagorie> getAllCatagorie() {

        ArrayList<Catagorie> cat = new ArrayList<>();
        try {
            String q = "Select * from categories";
            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);
            while (rs.next()) {
                int cid = rs.getInt(1);
                String name = rs.getString(2);
                String description = rs.getString(3);
                Catagorie c = new Catagorie(cid, name, description);
                cat.add(c);

            }
            return cat;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }

    public boolean savePost(Post p) {
        boolean b = false;
        String q = "insert into post(userid,catid,ptitle,pcontent,pcode,ppics) values(?,?,?,?,?,?)";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(q);

            ps.setInt(1, p.getUserid());
            ps.setInt(2, p.getCatid());
            ps.setString(3, p.getPtitle());

            ps.setString(4, p.getPcontent());
            ps.setString(5, p.getPcode());

            ps.setString(6, p.getPpics());
            ps.executeUpdate();
            b = true;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }
    
    public List<Post> getAllPost(){
     List<Post> p = new ArrayList<>();
        try {
            String q = "Select * from post";
            PreparedStatement ps =con.prepareStatement(q);

            ResultSet rs = ps.executeQuery(q);
            while (rs.next()) {
                int pid = rs.getInt(1);
                String ptitle  = rs.getString(2);
                String pcontent = rs.getString(3);
                String pcode = rs.getString(4);
                String pdate = rs.getString(5);
                String ppics = rs.getString(6);
                int catid = Integer.parseInt(rs.getString(7));
                int userid = Integer.parseInt(rs.getString(8));
                Post c = new Post(pid,ptitle,pcontent,pcode,pdate,catid,userid,ppics);
                p.add(c);

            }
            return p;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
         
    }
    
    public List<Post> getPostByCatagorie(int m){
        List<Post> p = new ArrayList<>();
        try {
            String q = "Select * from post where=? ";
            PreparedStatement ps =con.prepareStatement(q);
            ps.setInt(1, m);

            ResultSet rs = ps.executeQuery(q);
            while (rs.next()) {
                int pid = rs.getInt(1);
                String ptitle  = rs.getString(2);
                String pcontent = rs.getString(3);
                String pcode = rs.getString(4);
                String pdate = rs.getString(5);
                String ppics = rs.getString(6);
                int catid = Integer.parseInt(rs.getString(7));
                int userid = Integer.parseInt(rs.getString(8));
                Post c = new Post(pid,ptitle,pcontent,pcode,pdate,catid,userid,ppics);
                p.add(c);

            }
            return p;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p; 
    }

    public  List<Post> getPost(int n){
        List<Post> p = new ArrayList<>();
        if(n==0){
          p=  getAllPost();
        }
        else{
       p= getPostByCatagorie( n);
        }
        return p;
    }
}
