<!DOCTYPE html>
<html>
    <head>
        <title>Gnaathi</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="wiki.css">
        <link rel="stylesheet" href="article.css">
        <link rel="stylesheet" href="../css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script  type="text/javascript" src="wiki.js"></script>
    </head>
    <body>
        <header>
            <div id='header'>
                <img id='header-background' src="img/edit/websiteedit_0010_headerback.png" alt="header back">
                <a href="../home.jsp"><img id='logo' src="img/edit/websiteedit_0008_logo.png" alt="logo"></a>
                <img id='picture' src="img/edit/websiteedit_0006_picture.png" alt="picture">
                <img id='login' src="img/edit/websiteedit_0000_settings.png" alt="login">
                <img id='clock' src="img/edit/websiteedit_0001_clock.png" alt="clock">
                <a href="logout.jsp"><div id='door'><img src="img/edit/websiteedit_0007_door.png" alt="door"></div></a>
                <div id='logout'><img src="img/edit/websiteedit_0004_----Logout.png" alt="logout"></div>

            </div>
        </header>
        <%
            String topic = request.getParameter("topic");
            System.out.println(topic);
            if (topic != null) {
                String url = topic + "/" + topic + ".html";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }

        %>

        <div id="body">
            <div id="tv-container">
                <div id="tv-screen"></div>
                <img src="img/edit/websiteedit_0011_TV.png" alt="tv">
            </div>
            <div id="middle-container"><p id="jump-to"></p><img id="forum-img" src="img/forum/forum_0000_Layer-8.png" alt="forum">      
            </div>
            <div id="screen-container">
                <div id="projector-screen"></div>
                <img src="img/edit/websiteready_0002_projector.png" alt="screen">
            </div>
        </div>
        <div class="container-fluid" id="long-container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="wiki-header"><font id="wiki-title">Welcome to Gnaathi Blog !</font></div>
                </div>

            </div>
            <div class="row">
                <%@include file="blog.jsp"%>
            </div>
        </div>
    </body>

</html>