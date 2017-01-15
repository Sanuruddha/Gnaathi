<%@include  file="checklogin.jsp"%>
<%    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
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
        <link rel="stylesheet" href="css/home.css">
        <link href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script  type="text/javascript" src="js/home.js"></script>
        <script  type="text/javascript" src="js/userhome.js"></script>
        <script  type="text/javascript" src="js/chat.js"></script>
    </head>

    <body>
        
        <header>
            <div id='header'>
                <img id='header-background' src="img/edit/websiteedit_0010_headerback.png" alt="header back">
                <a href="home.html"><img id='logo' src="img/home/home_0008_Layer-1.png" alt="logo"></a>
                <div id="prof-icon"><img id='picture' src="img/home/home_0007_Layer-3.png" alt="picture">
                <img onclick="loadProfile()" id="avatar" style="z-index: 6;height:auto;width:4%;position: absolute;top:17%;right:16.5%;" src="icons/glasses.svg" alt="avatar">
                </div>
                <div onclick="showNotifications()" id="notfication-container">
                    <img id='clock' src="img/edit/home_0000_calender.png" alt="clock">
                    <!---------->
                    <div id="noti_Counter"></div>   <!--SHOW NOTIFICATIONS COUNT.-->

                    <!--A CIRCLE LIKE BUTTON TO DISPLAY NOTIFICATION DROPDOWN.-->
                    <div id="noti_Button"></div>    

                    <!--THE NOTIFICAIONS DROPDOWN BOX.-->
                    <div id="notifications">
                        <h3>Notifications</h3>
                        <div id='notification-body' style="height:300px;">
                            
                        </div>
                        <div class="seeAll"><a href="#">See All</a></div>
                    </div>
                </div>
                <script src="js/notification.js" ></script>
                <a id='door' href="logout.jsp"><img id='door-img' src="img/edit/websiteedit_0007_door.png" alt="door"></a>

            </div>
        </header>
        
        <%@include file="error.html"%>
        <%if (request.getParameter("success") != null) {
                if (!request.getParameter("success").equals("true")) {
                } else {%>
        <%@include file="success.html"%>
        <script>$(".success").css("display", "block");
            $("#smsg").html("Successful");</script>
            <%}
                }%>
        
        <div id="body">
            <div style="" id="left-container">
                <img style="height:55vh;" src="img/home/home_0004_Layer-7.png" alt="tv">
                <a id="alink" href="http://www.sgu-edu.com/intl-in-sl-fb/">
                    <div id="tv-screen">
                        <img  style="width:92%;" id="aimg" src="as/images/a1.png">

                    </div>
                    <div style="height:9vh;background-color: #e6edf8;position: absolute;top:31vh;width: 82%;left:8%;"><p id="acontent"><font style="text-decoration: underline">sgu-edu.com </font>Click here to secure your place</p></div>
                </a> 
            </div>


            <div id="middle-container">  
                <div id="cloud-container">
                    <img onclick="loadWiki()" id="wiki-button" src="img/home/websiteedit_0002_wiki-cloud.png" alt="wiki-button">
                    <img onclick="loadForum()" id="forum-button" src="img/home/websiteedit_0000_forum-cloud.png" alt="forum-button">
                    <img onclick="loadBlog()" id="blog-button" src="img/home/websiteedit_0001_blog-cloud.png" alt="blog-button">

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
                        event.targetplayVideo();
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

            <div id="chatbutton-container">
                <img onclick="showChat()" id="chat-button" src="img/home/websiteedit_0000_chat-cloud.png" alt="chat-button">
            </div>
            <div id="chat-box">
                <%@include file="chatlist.jsp"%>
            </div>
            <script>
                if (window.attachEvent) {
                    window.attachEvent('onresize', function () {

                    });
                } else if (window.addEventListener) {
                    window.addEventListener('resize', function () {
                        var h = document.getElementById("table").height;
                        $("#chatbutton-container").height(h);

                    }, true);
                } else {

                }
                $(document).ready(function () {
                    var h = document.getElementById("table").height;
                    $("#chatbutton-container").height(h);
                });
            </script>

        </div>
        <div id="donation-button" onclick="openDonationForm()">
            &nbsp;&nbsp;&nbsp;&nbsp;Donate <br>
            <img src="icons/donate.png" alt="donate">

        </div>
        <div id="acquire-button" onclick="openAcquisitionForm()">
            &nbsp;&nbsp;&nbsp;&nbsp;Acquire <br>
            <img src="icons/acquire.png" alt="donate">

        </div>
        <div id="events-button" onclick="openEventManager()">
            &nbsp;&nbsp;&nbsp;&nbsp;Events <br>
            <img src="icons/event.png" alt="donate">

        </div>
        <div id="eventform-container">
            <%@include file="eventform.html"%>
        </div>
        <script>
            function openEventManager() {
                document.getElementById("eventNav").style.width = "100%";
                return false;

            }
            function closeEventForm() {
                document.getElementById("eventNav").style.width = "0%";
                return false;
            }
        </script>

        <div id="acquisitionform-container">
            <%@include file="acquisitionform.html"%>
        </div>
        <div id="donationform-container">
            <%@include file="donationform.html"%>
        </div>
    </body>
</html>

