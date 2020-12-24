
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.entities.Catagorie"%>
<%@page import="com.tech.dao.PostDAO"%>
<%@page import="com.tech.helper.ConnectionProvider"%>
<%@page import="com.tech.entities.User"%>
<%@page errorPage="ErrorPage.jsp" %>
<%
    User u = (User) session.getAttribute("currentUser");
    if (u != null) {


%> 
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .jumbo-design{

                clip-path: polygon(41% 0, 84% 0, 100% 0, 99% 96%, 71% 83%, 25% 97%, 0 71%, 0 0);
            }
            .b-color{
                background-color:  #651fff!important;
            }
        </style>
    </head>
    <body>
        <div class="m-0 p-0">
            <nav class="navbar navbar-expand-lg navbar-light bg-primary m-0 p-3 shadow">
                <a class="navbar-brand   text-white" href="index.jsp"><span class="fa fa-certificate p-1 m-1"></span>Tech-Blogging Website</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="btn btn-primary mx-2 px-2 " href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-primary mx-2 px-2" href="login.jsp">Login</a>
                        </li>
                    </ul>


                    <div class="nav-item rounded border border-black mr-1">
                        <span class="fa fa-user fa-spin ml-1 pl-1"></span>
                        <a class="btn btn-primary mx-3 px-1" href="!#" data-toggle="modal" data-target="#profile-modal"><%= u.getName()%></a>
                    </div>
                    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center bg-primary">
                                    <h5 class="modal-titleb " id="exampleModalLabel">User Profile</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div id="Profile-Detail" >
                                    <div class="modal-body">
                                        <div class="container text-center">

                                            <img src="images/<%= u.getProfile()%>" class="img-fluid " width="100" height="100">

                                            <h1 class="text-muted text-capitalize lead"><%=u.getName()%></h1>

                                            <table class="table table-hover table-striping ">
                                                <tr>
                                                    <th>User ID:</th>
                                                    <td><%=u.getId()%></td>
                                                </tr>
                                                <tr>
                                                    <th>Email Id:</th>
                                                    <td><%=u.getEmail()%></td> 
                                                </tr>
                                                <tr>
                                                    <th>Gender :</th>
                                                    <td><%=u.getGender()%></td>
                                                </tr>
                                                <tr>
                                                    <th>About :</th>
                                                    <td><%=u.getAbout()%></td>
                                                </tr>
                                                <tr>
                                                    <th>Registration Date :</th>
                                                    <td><%=u.getRdate()%></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>  

                                <!--profile-Edit-->
                                <div id="Profile-Edit" style="display:none">
                                    <div class="text-center">
                                        <img src="images/<%= u.getProfile()%>" class="img-fluid " >
                                        <h1 class="text-muted text-capitalize lead"><%=u.getName()%></h1>
                                        <h1 class="text-center text-capitalize display-6">Edit Profile Carefully</h1>
                                    </div>

                                    <form  method="post" action="EditServ" class="form-group"  enctype="multipart/form-data"    >
                                        <table class="table table-hover table-striping ">
                                            <tr>
                                                <th>User ID:</th>
                                                <td><input type="text" class="form-control" value="<%=u.getId()%>" name="uId" readonly="true" ></td>
                                            </tr>
                                            <tr>
                                                <th>User Name::</th>
                                                <td><input type="text" class="form-control" value="<%=u.getName()%>" name="uUser" ></td> 
                                            </tr>
                                            <tr>
                                                <th>Email Id:</th>
                                                <td><input type="Email" class="form-control" value="<%=u.getEmail()%>" name="uEmail" ></td> 
                                            </tr>
                                            <tr>
                                                <th>Password :</th>
                                                <td><input type="Password" class="form-control" value="<%=u.getPassword()%>" name="uPass" ></td>
                                            </tr>
                                            <tr>
                                                <th>Gender :</th>
                                                <td><input type="gender" class="form-control" value=" <%=u.getGender()%>" name="uGender" readonly="true" ></td>
                                            </tr>
                                            <tr>
                                                <th>About :</th>
                                                <td> <textarea class="form-control" name="uAbout" ><%=u.getAbout()%></textarea>
                                            </tr>
                                            <tr>
                                                <th>Profile :</th>
                                                <td><input type="file" name="image" class="form-control" > </td>
                                            </tr>
                                        </table> 
                                        <div class="container text-center text-capitalize">
                                            <button type="submit" class="btn btn-outline-success">save</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" id="e-close" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" data-toggle="modal" id="Profile-Edit-Button" data-target="#Profile-Edit" >EDIT</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Post field-->
                    <div class="nav-item rounded border border-black mr-1">
                        <span class="fa fa-user fa-spin ml-1 pl-1"></span>
                        <a class="btn btn-primary mx-3 px-1" href="!#" data-toggle="modal" data-target="#post-modal">POST</a>
                    </div>                    

                    <div class="modal fade" id="post-modal" tabindex="-1" role="dialog" aria-labelledby="example1" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center bg-primary">
                                    <h5 class="modal-titleb " id="example1">POST POSTING</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="modal-body">
                                    <form  id="post-form" method="post" enctype="multipart/form-data">
                                        <div class="form-group">

                                            <div class="form-group">
                                                <select name="catId"   class="form-control" >
                                                    <option selected diabled >select catagorie</option>
                                                    <%
                                                        PostDAO p = new PostDAO(ConnectionProvider.getConnection());
                                                        ArrayList<Catagorie> temp = p.getAllCatagorie();

                                                        for (Catagorie m : temp) {
                                                    %>
                                                    <option class="form-control" value="<%=m.getCid()%>"> <%=m.getName()%> </option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" placeholder="Enter the Title" name="ptitle"   class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                                <textarea  class="form-control " style="height:300px;" name="pcontent" placeholder="Enter the content"></textarea>  
                                            </div>
                                            <div class="form-group">
                                                <textarea  class="form-control " style="height:300px;" name="pcode" placeholder="Enter the code"></textarea>  
                                            </div>
                                            <div class="form-group">
                                                <input type="file"  class="form-control " name="ppics"  > 
                                            </div>
                                            <div class="form-group text-capitalize text-center">
                                                <input type="submit" value="submit" class="btn btn-primary" >

                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="form-inline my-2 my-lg-0 border border-black rounded" >
                        <span class="fa fa-user-circle-o fa-spin m-1 p-1 "></span>
                        <a class=" btn btn-primary " href="LogoutServ">Logout</a>
                    </div>
                </div>
            </nav>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
                    $(document).ready(function() {
            let profileStatus = false;
                    $('#Profile-Edit-Button').click(function() {
            if (profileStatus == false) {
            $("#Profile-Detail").hide();
                    $("#Profile-Edit").show();
                    $("#e-close").hide();
                    profileStatus = true;
                    $(this).text("BACK");
            }
            else {
            $("#Profile-Detail").show();
                    $("#Profile-Edit").hide();
                    $("#e-close").show();
                    profileStatus = false;
                    $(this).text("EDIT");
            }
            });
            });</script>
        <script>
                    $('document').ready(function(e){

            $("#post-form").on("submit", function(event){

            event.preventDefault(); //normal nature of form changes by doing this
                    let form = new FormData(this);
                    $.ajax({
                    url:"PostSubmitServ",
                            type:'post',
                            data: form,
                            success:function(data, textStatus, jqXHR){
                            //sucess
                            if (data.trim() == "done"){
                            swal("good!", "Saved", "success");
                            }
                            else{
                            swal("Error", "something went wrong", "error");
                            }

                            },
                            error:function(data, textStatus, errorThrown){
                            //failure
                            swal("Error", "something went wrong", "error");
                            },
                            processData: false,
                            contentType:false

                    })
            })


            });

        </script>
        <%
            }
        %>


    </body>
</html>
