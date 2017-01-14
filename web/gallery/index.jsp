<!DOCTYPE html>
<html>
    <head>
        <title>Gnaathi Videos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" href="css/css_vidgal_home.css">
        <link rel="stylesheet" href="css/gallery_header.css">
        <link rel="stylesheet" href="../css/home.css">
    </head>

    <body>


        <header style="height:25vh">
            <div style="height:100%" id='header'>
                <img id='header-background' src="../img/edit/websiteedit_0010_headerback.png" alt="header back">
                <a href="home.html"><img id='logo' src="../img/home/home_0008_Layer-1.png" alt="logo"></a>
                <div style="height:100%" id="door-container">
                    <% if(session.getAttribute("session")==null){%>
                    <a style="height:100%;width:100%;" id='door' href="../home.jsp"><img style="top:-16%;" id='door-img' src="img/edit/websiteedit_0007_door.png" alt="door"></a>
                    <%}else{%>
                    <a style="height:100%;width:100%;" id='door' href="../userhome.jsp"><img style="top:-16%;" id='door-img' src="img/edit/websiteedit_0007_door.png" alt="door"></a>
                    <%}%>
                </div>

                
        </header>


        <span style="color: #636568;font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Video Navigation</span>

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="cancer.jsp">Cancer</a>
            <a href="diabetes.jsp">Diabetes</a>
            <a href="std.jsp">STDs</a>
            <a href="kidney_dis.jsp">Kidney Diseases</a>
            <a href="dengue.jsp">Dengue</a>
            <a href="how_to.jsp">How to</a>
            <a href="firstaid.jsp">Tips and First Aid</a>
            <a href="religious.jsp">Religious</a>
            <a href="entertainment.jsp">Entertainment</a>
        </div>

    <center>

        <div id="main">




            <iframe id="mainVideo" width="560" height="315" src="https://www.youtube.com/embed/Wl2_knlv_xw?autoplay=1" frameborder="0" allowfullscreen></iframe>
            

            <div id="myDiv" onclick="changeVideo(event)">

                <div id="vid1"><img src="https://img.youtube.com/vi/Wl2_knlv_xw/0.jpg"><label id="vid1_label"></label></div>

                <div id="vid2"><img src="https://img.youtube.com/vi/8T8BPTihr4Q/0.jpg"><label id="vid2_label"></label></div>

                <div id="vid3"><img src="https://img.youtube.com/vi/2-QJYS9Vg7c/0.jpg"><label id="vid3_label"></label></div>
                
                <div id="vid4"><img src="https://img.youtube.com/vi/bzmWqZS1QSU/0.jpg"><label id="vid4_label"></label></div>
                

                

            </div>
            <script type="text/javascript">
                
                function changeVideo(event)
                {
                    
                    event = event || window.event;

                    var targetElement = event.target || event.srcElement;

                    // if (targetElement == "VIDEO") {
                    var src=targetElement.src;
                    src= src.split("/"); 
                    
                    src="https://www.youtube.com/embed/"+src[4]+"?autoplay=1";
                    
                    document.getElementById("mainVideo").src = src;

                    // }

                }
            </script>

            <script>
                function openNav() {
                    document.getElementById("mySidenav").style.width = "250px";
                    document.getElementById("main").style.marginLeft = "250px";
                }

                function closeNav() {
                    document.getElementById("mySidenav").style.width = "0";
                    document.getElementById("main").style.marginLeft = "0";
                }
            </script>

        </div>

    </center>


</body>
</html>