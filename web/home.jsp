<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gnaathi</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/registerform.css">
        <link rel="stylesheet" href="css/error.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script  type="text/javascript" src="js/home.js"></script>

    </head>
    <body>

        <div id="registerform-container">
            <%@include file="registerform.html"%>
        </div>
        <div id="login-form" class="overlay">
            <div class = "overlay-content" id="loginform-container">
                <form action="loginprocess.jsp" method="post">
                    <table style="margin: auto">
                        <tr>
                            <td></td>
                            <td></td>
                            <td><a id="login-close" href = "javascript:void(0)" class = "closebtn" onclick = "closeLogin()" >&times;</a></td>
                        </tr>
                        <tr><td>Email:</td>
                            <td><input type="text" name="email" placeholder="Email"></td>                      
                        </tr>
                        <tr><td>Password:</td>
                            <td><input type="password" name="password" placeholder="Password"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" name="submit" value="Login"  style="width: 100px"></td>
                        </tr>
                        <tr>
                            <td colspan="2"> 
                                <a onclick="openNav()" style="color: #003399">Create account</a>
                            </td>
                        </tr>
                    </table>

                </form>
            </div>
        </div>
        <header>
            <div id='header'>
                <img id='header-background' src="img/edit/websiteedit_0010_headerback.png" alt="header back">
                <a href="home.html"><img id='logo' src="img/home/home_0008_Layer-1.png" alt="logo"></a>
                <img id='picture' src="img/home/home_0007_Layer-3.png" alt="picture">
                
                <img id='clock' src="img/edit/websiteedit_0001_clock.png" alt="clock">
                <div id="door-container">
                <img id='login' src="img/home/websiteedit_0000_settings.png" alt="login">
                <a id='door' href="index.html"><img id='door-img' src="img/edit/websiteedit_0007_door.png" alt="door"></a>
                </div>
            </div>
        </header>
        <%@include file="error.html"%>
        <%if (session.getAttribute("invalidlogin")!=null) {
            if (session.getAttribute("invalidlogin").equals("TRUE")){       
        %>
        <script>$(".error").css("display", "block");</script>
        <%}}%>
        <div id="body">
            <div id="left-container">
                <div id="tv-screen"></div>
                <img src="img/home/home_0004_Layer-7.png" alt="tv">
            </div>


            <div id="middle-container">                         
                <img onclick="loadWiki()" id="wiki-button" src="img/home/websiteedit_0002_wiki-cloud.png" alt="wiki-button">
                <img onclick="loadForum()" id="forum-button" src="img/home/websiteedit_0000_forum-cloud.png" alt="forum-button">
                <img onclick="" id='table' src="img/home/websiteedit_0003_Layer-13.png" alt="table">

            </div>

            <div>
                <div id="right-container">
                    <div id="projector-screen">
                        <img style="z-index: 6;width: 100%;height: 100%;" src="gallery/images/1.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
                    </div>
                    <img src="img/home/home_0005_Layer-6.png" alt="screen">
                </div>
            </div>
        </div>

    </body>
</html>

