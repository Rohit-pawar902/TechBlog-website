<%-- 
    Document   : Registration
    Created on : 6 Jun, 2020, 3:32:11 PM
    Author     : DELL
--%>

<%@page import="com.tech.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 

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
        <div class="container-fluid m-0 p-0">
            <div class="jumbotron b-color jumbo-design">
                <div class="container pb-5 mb-5">
                    <div class="row">
                        <div class="col-md-6 offset-3">
                            <div class="card">
                                <div class="card-header display-6 text-capitalize text-center text-primary">
                                    <span class="fa fa-user-circle-o fa-4x"></span>
                                    <br>Registration
                                </div>
                                <div class="card-body">
                                    <form action="RegisterServ" method="post">
                                        <div class="form-group">
                                            <label for="exampleInputName">Name</label>
                                            <input type="text" name="uname" class="form-control" id="exampleInputName"   placeholder="Enter Name">

                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input type="email" name="uemail" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                        </div>

                                        <div class="form-check  d-inline-block mb-2">

                                            <input class="form-check-input" name="ugen" type="radio" id="exampleInputGender" value="male">
                                            <label class="form-check-label" for="exampleInputGender">
                                                Male
                                            </label>

                                        </div>
                                        <div class="form-check d-inline-block mb-2 ">
                                            <input class="form-check-input" type="radio" name="ugen" id="exampleInputGender"  value="female">
                                            <label class="form-check-label" for="exampleInputGender">
                                                Female
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input type="password" name="upass" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <label for=" exampleFormControlTextarea1">About</label>
                                            <textarea class="form-control" name="uabout" placeholder="Enter about Yourself " id="exampleFormControlTextarea1" rows="3"></textarea>

                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <%
            Message m1 = (Message) session.getAttribute("done");
              Message m2 = (Message) session.getAttribute("not_done");
            session.removeAttribute("done");
            session.removeAttribute("not_done");
            if (m1 != null) {
        %>

        <script>confirm("<%=m1.getContent()%>);</script>
        <%
        response.sendRedirect("Profile.jsp");
            }
            if (m2 != null) {
        %>

         <script> confirm("<%=m2.getContent()%>)")/script>
        <%
         
            }
           
        %>
    </body>
</html>
