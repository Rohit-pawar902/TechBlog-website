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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class LoginServ extends HttpServlet {
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      PrintWriter out=response.getWriter();
        String userEmail=request.getParameter("uemail");
            String userPass=request.getParameter("upass");
            
            UserDAO dao=new UserDAO(ConnectionProvider.getConnection());
            User u=null;
           u= dao.getUserByEmailAndPass(userEmail, userPass);
            
           if(u==null){
               Message m=new Message("Email id and PassWord are not correct","Error","alert-warning");
               HttpSession s=request.getSession();
               s.setAttribute("msg",m);
            response.sendRedirect("login.jsp");
                
           }
           else{
               //we have to jump into first page of web site 
               //enabling session
               HttpSession session= request.getSession(true);
               session.setAttribute("currentUser",u);
               response.sendRedirect("./Profile.jsp");
               
           }
           
         
    }

      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
               response.sendRedirect("login.jsp");
           }
}
