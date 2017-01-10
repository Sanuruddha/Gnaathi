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
        <%
            if (request.getParameter("registersuccess") != null)
                if (request.getParameter("registersuccess").equals("false")) {
        %>
        <script>
            $("#myNav").width("100%");
        </script>
        <%}%>

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
        <%
            if (request.getParameter("loginpage") != null)
                if (request.getParameter("loginpage").equals("true")) {
        %>
        <script>
            $("#login-form").width("100%");
        </script>
        <%}%>
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
        <%if (session.getAttribute("invalidlogin") != null) {
                if (session.getAttribute("invalidlogin").equals("TRUE")) {
        %>
        <script>$(".error").css("display", "block");</script>
        <%}
            }%>
        <div id="body">
            <div style="" id="left-container">
                <img style="height:55vh;" src="img/home/home_0004_Layer-7.png" alt="tv">
                <a id="adlink" href="http://www.sgu-edu.com/intl-in-sl-fb/">
                    <div id="tv-screen">
                        <img  style="width:92%;" id="adimg" src="ads/images/ad1.png">
                        
                    </div>
                    <div style="height:9vh;background-color: #e6edf8;position: absolute;top:31vh;width: 82%;left:8%;"><p id="adcontent"><a>sgu-edu.com </a>Click here to secure your place</p></div>
                </a>
                
            </div>


            <div id="middle-container">  
                <div id="cloud-container">
                    <img onclick="loadWiki()" id="wiki-button" src="img/home/websiteedit_0002_wiki-cloud.png" alt="wiki-button">
                    <img onclick="loadForum()" id="forum-button" src="img/home/websiteedit_0000_forum-cloud.png" alt="forum-button">
                    <img onclick="loadBlog()" id="blog-button" src="img/home/websiteedit_0001_blog-cloud.png" alt="blog-button">
                </div>

                <img onclick="" id='table' src="img/home/websiteedit_0003_Layer-13.png" alt="table">
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
                        //The browser does not support Javascript event binding
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
                    <div id="projector-screen">

                    </div>
                    <script src="http://www.youtube.com/player_api"></script>
                    <script>

                    // create youtube player
                    var player;
                    var srcs = ['https://www.youtube.com/embed/XVY4DeAvnfI?enablejsapi=1&origin=http%3A%2F%2Flocalhost%3A8080&widgetid=1',
                        , 'https://www.youtube.com/embed/ROcBUEVMPLU?enablejsapi=1&origin=http%3A%2F%2Flocalhost%3A8080&widgetid=1'];
                    var j;

                    function onYouTubePlayerAPIReady() {
                        player = new YT.Player('projector-screen', {
                            height: '390',
                            width: '640',
                            videoId: 'XVY4DeAvnfI',
                            events: {
                                'onReady': onPlayerReady,
                                'onStateChange': onPlayerStateChange
                            }
                        });
                    }

// autoplay video
                    function onPlayerReady(event) {
                        event.target.pplayVideo();
                    }

                    // when video ends
                    function onPlayerStateChange(event) {

                        if (event.data === 0) {
                            for (var i = 0; i < srcs.length; i++) {
                                if (srcs[i] === $('#projector-screen').attr('src')) {
                                    j = (i + 1) % (srcs.length);
                                    $('#projector-screen').attr('src', srcs[j]);
                                    event.target.playVideo();
                                }
                            }
                        }
                    }

                    </script>
                    <img src="img/home/home_0005_Layer-6.png" alt="screen">
                    <div id="button-container">
                        <div onclick="loadImage()" id="image-gallery">
                            <button type="button" class="btn gal-btn">Images
                                <img src="img/image.png" alt="image">
                            </button>
                        </div>
                        <div onclick="loadVideo()" id="video-gallery">
                            <button type="button" class="btn gal-btn">Videos
                                <img src="img/video.png" alt="video">
                            </button>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

