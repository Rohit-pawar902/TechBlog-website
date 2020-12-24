<%-- 
    Document   : ErrorPage
    Created on : 17 Aug, 2020, 3:19:10 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="text-muted">
       <%@include file="normal_navbar.html" %>
        </div>
        <div class="container text-center">
        <img src="images/fail.png" class="img-fluid">
        <%= exception %>
        <h1 class="text-center display-2">SORRY SOMETHING WENT WRONG</h1>
        </div>
    </body>
</html>
