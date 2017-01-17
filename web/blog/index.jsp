<!DOCTYPE html>
<html>
    <head>
        <title>Gnaathi</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="wiki.css">
        <link rel="stylesheet" href="article.css">
        <link rel="stylesheet" href="../css/home.css">
        <link rel="stylesheet" href="../css/userhome.css">
        <link rel="stylesheet" href="../css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script  type="text/javascript" src="wiki.js"></script>
    </head>
    <body style="padding-top: 0">
        <header>
            <div id='header'>
                <img id='header-background' src="../img/edit/websiteedit_0010_headerback.png" alt="header back">
                <a href="home.html"><img id='logo' src="../img/home/home_0008_Layer-1.png" alt="logo"></a>
               
                
                <!-------->

                <a id='door' href="../logout.jsp"><img id='door-img' style="z-index:10;position: absolute;" src="../img/edit/back.png" alt="door"></a>

            </div>
        </header>
        

        
        <div style="top:20px" class="container-fluid" id="long-container">
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