<%@include  file="checklogin.jsp"%>
<%    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
%>
<html>
    <head>
        <title>Gnaathi</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" href="css/chatbox.css">
        <link rel="stylesheet" href="css/userhome.css">
        <link href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script  type="text/javascript" src="js/home.js"></script>
        <script  type="text/javascript" src="js/userhome.js"></script>
        <script  type="text/javascript" src="js/chat.js"></script>
    </head>

    <body>
        <div id="loginform-container">
            <form action="loginprocess.jsp" method="post">
                <table style="margin: auto">
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
                </table>

            </form>
        </div>
        <header>
            <div id='header'>
                <img id='header-background' src="img/edit/websiteedit_0010_headerback.png" alt="header back">
                <a href="home.html"><img id='logo' src="img/home/home_0008_Layer-1.png" alt="logo"></a>
                <img id='picture' src="img/home/home_0007_Layer-3.png" alt="picture">
                <img id='clock' src="img/edit/websiteedit_0001_clock.png" alt="clock">
                <a id='door' href="logout.jsp"><img id='door-img' src="img/edit/websiteedit_0007_door.png" alt="door"></a>

            </div>
        </header>
        <div id="body">
            <div id="left-container">
                <div id="tv-screen"></div>
                <img src="img/home/home_0004_Layer-7.png" alt="tv">
            </div>


            <div id="middle-container">  
                <div id="cloud-container">
                    <img onclick="loadWiki()" id="wiki-button" src="img/home/websiteedit_0002_wiki-cloud.png" alt="wiki-button">
                    <img onclick="loadForum()" id="forum-button" src="img/home/websiteedit_0000_forum-cloud.png" alt="forum-button">
                    <img onclick="loadBlog()" id="blog-button" src="" alt="blog-button">
                </div>

                <img id='table' src="img/home/websiteedit_0003_Layer-13.png" alt="table">
                <script>
                    if (window.attachEvent) {
                        window.attachEvent('onresize', function () {

                        });
                    } else if (window.addEventListener) {
                        window.addEventListener('resize', function () {
                            var h = document.getElementById("table").height;

                            var mc = document.getElementById("middle-container").clientHeight;
                            $("#cloud-container").height(mc - h);

                            var cc = document.getElementById("cloud-container").clientHeight;

                        }, true);
                    } else {
                        
                    }
                    $(document).ready(function () {
                        var h = document.getElementById("table").height;

                        var mc = document.getElementById("middle-container").clientHeight;
                        $("#cloud-container").height(mc - h);
                    });
                </script>
            </div>

            <div>
                <div id="right-container">
                    <div id="projector-screen"></div>
                    <img src="img/home/home_0005_Layer-6.png" alt="screen">
                </div>

            </div>
            <div id="chat-box">
                <%@include file="chatlist.jsp"%>
            </div>
        </div>

    </body>
</html>
