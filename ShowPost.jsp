 
<%@page import="java.util.List"%>
<%@page import="com.tech.entities.Post"%>
<%@page import="com.tech.dao.PostDAO"%>
<%@page import="com.tech.helper.ConnectionProvider"%>
 
<%
 int catid=Integer.parseInt(request.getParameter("ok"));
             PostDAO pdao=new PostDAO(ConnectionProvider.getConnection());
             List<Post> l=pdao.getPost(catid);
             %>
             <div class="row">
<%
             for(Post p : l){
                 %>
                 <div class="col-sm-3">
                 <div class="card" style="width:20rem;">
                     <img class="card-img-top img-fluid rotated" src="images/<%=p.getPpics()%>" alt="Card image cap">
                     <div class="card-body">
                         <h5 class="card-title"><%=p.getPtitle()%></h5>
                                <p class="card-text"><%=p.getPcontent()%></p>
                     </div>
                     <div class="card-fotter">
                         <a href="" class="btn btn-outline-success">Read More...</a>
                         <a href="" class="btn btn-outline-success">Read More...</a>
                        
                     </div>
                 </div>
                 </div>
                    
   
         <% 
             }
           %>
             </div>
                 
 
  