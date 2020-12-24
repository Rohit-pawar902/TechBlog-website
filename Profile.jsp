<%-- 
    Document   : Profile
    Created on : 18 Aug, 2020, 5:13:20 PM
    Author     : DELL
--%>

<%@page import="com.tech.entities.User"%>
<%    User n = (User) session.getAttribute("currentUser");
    if (n != null) {
%>



<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <%@include file="Admin_nav.jsp" %> 
        <%
//            RequestDispatcher req = request.getRequestDispatcher("Admin_nav.jsp");
//            req.include(request, response);

        %>
        <div class="container">
            <div class="row  border border-primary">
                <div class="col-sm-3 row  border border-warning m-3">
                    
                    <div class="list-group" value="0" id="catagorie-list">
                        <div href="#" onClick class="list-group-item list-group-item-action active" name="CATID" value="0">all Catagories</div>
                        <%                PostDAO p = new PostDAO(ConnectionProvider.getConnection());
                            ArrayList<Catagorie> temp = p.getAllCatagorie();

                            for (Catagorie m : temp) {

                        %>
                        <div href="#" class="list-group-item " id="l1" name="CATID" value="<%=m.getCid()%>"> <%=m.getName()%>  </div>
                        <%
                            }
                        %>
                    </div>
                    <%
                        }
                    %>
                   
                </div>

                <div class="col-sm-8 border border-primary"">

                     
                            <div id="show-post">


                            </div>
                      


                </div>
            </div> 
        </div>
        <!--cdn script-->
        <script>
            $('document').ready(function(e) {
                $("#catagorie-list").click(function() {
                   console.log("cliked");
                   let v= $('this list-group-item:selected').val()();
                    console.log(v);
                    $.ajax({
                        url: "ShowPost.jsp",
                        data:{ok:v},
                        success: function(data, textStatus, jqXHR) {
                            $("#show-post").html(data);
                        }
                    })
                })
            })
        </script>
    </body>
</html>
