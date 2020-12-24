/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tech.servlet;

import com.tech.dao.UserDAO;
import com.tech.entities.Message;
import com.tech.entities.User;
import com.tech.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class RegisterServ extends HttpServlet {
 @Override
 public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException{
    PrintWriter out=res.getWriter();
   User user=new User();
   user.setName(req.getParameter("uname"));
   user.setEmail(req.getParameter("uemail"));
   user.setGender(req.getParameter("ugen"));
   user.setPassword(req.getParameter("upass"));
   user.setAbout(req.getParameter("uabout"));
   String check=req.getParameter("check");
   if(check==null){
   res.sendRedirect("Registration.jsp");
   }
   else{
   UserDAO save=new UserDAO(ConnectionProvider.getConnection());
   Boolean Status=save.saveUser(user);
   if(Status){
        
        Message m1=new Message("Registration successfull","Cofirmation","alert-primary");
                HttpSession s=req.getSession();
                s.setAttribute("done",m1);
                res.sendRedirect("Registration.jsp");
           
   }
   else{
        
         Message m1=new Message("Registration not successfull might you already Registered with same Email ID","Cofirmation","alert-primary");
                HttpSession s=req.getSession();
                s.setAttribute("not_done",m1);
                res.sendRedirect("Registration.jsp");
   }
 }
 }
 public void doGet(HttpServletRequest req,HttpServletResponse res){
     try {
         res.sendRedirect("Registration.jsp");
     } catch (IOException ex) {
         Logger.getLogger(RegisterServ.class.getName()).log(Level.SEVERE, null, ex);
     }
 }
}
