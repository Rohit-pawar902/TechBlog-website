<%-- 
    Document   : login.jsp
    Created on : 6 Jun, 2020, 2:53:59 PM
    Author     : DELL
--%>

<%@page import="com.tech.entities.User"%>
<%@page import="com.tech.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User u=(User)session.getAttribute("currentUser");
    if(u!=null){
        response.sendRedirect("Profile.jsp");
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <div class="border b-3">
        <%@include file="normal_navbar.html" %>
        </div>
        <div class="jumbotron b-color jumbo-design">
        <div class="container pb-5" >

            <div class="row" >

                <div class="col-md-6 offset-3  ">

                    <div class="card m-1 shadow-lg  ">
                        <div class="card-header">
                            <h1 class="text-center   display-6 text-primary" style="text-color:arial"><span class="fa fa-user-plus fa-1x fa-spin"></span><br> Login user </h1>
                        </div>
                        <form action="LoginServ" method="post">
                            
                        <div class="card-body bg-white border border-black shadow-lg rounded">
                            <%
                                Message m1=(Message)session.getAttribute("msg");
                                if(m1!=null){
                                    %>
                                    <div class="alert <%=m1.getCssMsg()%>" role="alert">
                                        <%=m1.getContent()%>
                                    </div>
                                    <%
                                    session.removeAttribute("msg");
                                }
                                %>
                            <div class="text-justify text-center">
                                <div class="text-capitalize d-inline-block m-2">
                                    Email ID : &nbsp   <input type="email" name="uemail" required placeholder="Enter the name" class=" mw-100 rounded">
                                </div>

                                <div class=" text-capitalize d-inline-block m-2">
                                    Password  :    &nbsp&nbsp   <input type="password" name="upass" required placeholder="Enter the password" class="rounded mw-100">
                                </div>
                            
                                 <div class="text-center">
                                  <input type="submit" class="btn btn-primary " name="submit" value="Submit">
                                 </div>
                           </div>
                        </div>
                            </form>        
                    </div>
                </div>
                    
                    </body>
                    </html>
