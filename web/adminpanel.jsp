<%-- 
    Document   : adminpanel
    Created on : Nov 11, 2016, 10:31:15 PM
    Author     : Lock
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
                    <a class="navbar-brand" href="#">Admin Panel</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#">Front-end View</a></li>
                        <li><a href="#">Page 3</a></li>
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
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Add admin</a></li>
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
                        <a href="#" class="list-group-item">Users</a>
                        <a href="#" class="list-group-item">Articles<span class="badge">New</span></a>
                        <a href="#" class="list-group-item">Media</a>

                    </div>
                </div>
            </div>
    </body>
</html>
