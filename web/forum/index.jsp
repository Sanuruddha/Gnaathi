<!DOCTYPE html>
<html>
    <head>
        <title>Gnaathi</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="forum.css">
        <link rel="stylesheet" href="../css/userhome.css">
        <link rel="stylesheet" href="../css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script  type="text/javascript" src="forum.js"></script>
    </head>
    <body>
        <header>
            <div id='header'>
                <img id='header-background' src="../img/edit/websiteedit_0010_headerback.png" alt="header back">
                <a href="home.html"><img id='logo' src="../img/home/home_0008_Layer-1.png" alt="logo"></a>
               
                
                <!-------->

                <a id='door' href="../logout.jsp"><img id='door-img' style="z-index:10;position: absolute;" src="../img/edit/back.png" alt="door"></a>

            </div>
        </header>

        <div id="body">
            
            <div id="middle-container" style="top:-100px"><p id="jump-to"></p><img id="forum-img" src="img/forum/forum_0000_Layer-8.png" alt="forum">      
            </div>
            
        </div>
        <div style="top:400px" class="container-fluid" id="long-container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="forum-header"><font id="forum-title">Welcome to Forum !</font></div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    
                    <div id="forum">
                        <%@include file="forum.jsp" %>
                            
                        </div>
                    
                </div>
            </div>
        </div>
    </body>

</html>