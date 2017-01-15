<%-- 
    Document   : adminpanel
    Created on : Nov 11, 2016, 10:31:15 PM
    Author     : Lock
--%>
<%@include  file="checklogin.jsp"%>
<%    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="js/adminpanel.js"></script>
        <link rel="stylesheet" href="css/adminpanel.css">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="adminpanel.jsp">Admin Panel</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#">Front-end View</a></li>
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropbtn">Login as</a>
                            <div class="dropdown-content">
                                <a href="#">Regular</a>
                                <a href="#">Research personnel</a>
                                <a href="#">Elderly society</a>
                            </div>
                        </li>
                        <% if(session.getAttribute("user_type").equals(10)){%>
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Add admin</a></li>
                        <%}%>
                        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="row">

            <div class="col-sm-2">

                <!-- List-Group Panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1 class="panel-title"><span class="glyphicon glyphicon-random"></span> Job categories</h1>
                    </div>
                    <div class="list-group">
                        <a href="#" onclick="loadUserManager()" class="list-group-item">Users</a>
                        <a href="#" onclick="loadArticleManager()" class="list-group-item">Articles<span class="badge" style="display:none">New</span></a>
                        <a href="#" onclick="loadMediaManager()" class="list-group-item">Media</a>

                    </div>
                </div>
            </div>
            <div class="col-sm-8" id="middle">
                <div id="default" class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-3"></div>
                        <div id="middle-middle" class="col-sm-6">
                            
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                </div>
                <div id="article-manager" class="col-sm-12" style="display:none">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="panel panel-default" onclick="loadArticleList()">
                                <div class="panel-heading">
                                    <h1 class="panel-title"><span class="glyphicon glyphicon-random"></span> Article list</h1>
                                </div>
                                <div class="panel-body">
                                    <img src="icons/listart.png" class="img-rounded" alt="Cinque Terre" style="height:100%;width:100%">

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h1 class="panel-title"><span class="glyphicon glyphicon-random"></span> Add article</h1>
                                </div>
                                <div class="panel-body">
                                    <img src="icons/newart.png" class="img-rounded" alt="Cinque Terre" style="height:100%;width:100%">

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h1 class="panel-title"><span class="glyphicon glyphicon-random"></span> Delete article</h1>
                                </div>
                                <div class="panel-body">
                                    <img src="icons/removeart.png" class="img-rounded" alt="Cinque Terre" style="height:100%;width:100%">

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h1 class="panel-title"><span class="glyphicon glyphicon-random"></span> Modify article</h1>
                                </div>
                                <div class="panel-body">
                                    <img src="icons/editart.png" class="img-rounded" alt="Cinque Terre" style="height:100%;width:100%">

                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <div id="user-manager" class="col-sm-12" style="display:none">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h1 class="panel-title"><span class="glyphicon glyphicon-random"></span> Search user</h1>
                                </div>
                                <div class="panel-body">
                                    <img src="icons/searchuser.png" class="img-rounded" alt="Cinque Terre" style="height:100%;width:100%">

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h1 class="panel-title"><span class="glyphicon glyphicon-random"></span> Add user</h1>
                                </div>
                                <div class="panel-body">
                                    <img src="icons/adduser.png" class="img-rounded" alt="Cinque Terre" style="height:100%;width:100%">

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h1 class="panel-title"><span class="glyphicon glyphicon-random"></span> Remove user</h1>
                                </div>
                                <div class="panel-body">
                                    <img src="icons/removeuser.png" class="img-rounded" alt="Cinque Terre" style="height:100%;width:100%">

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h1 class="panel-title"><span class="glyphicon glyphicon-random"></span> Logout user</h1>
                                </div>
                                <div class="panel-body">
                                    <img src="icons/signoutuser.png" class="img-rounded" alt="Cinque Terre" style="height:100%;width:100%">

                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
