<%-- 
    Document   : vir_tour
    Created on : Jan 15, 2017, 1:35:47 PM
    Author     : Shaii
--%>

<!DOCTYPE html>
<html>
<head>
	<title>Virtual Tours</title>
        
        <link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link rel="stylesheet" href="css/css_after_navigation.css">
        <link rel="stylesheet" href="css/css_vidgal_home.css">
        <link rel="stylesheet" href="css/gallery_header.css">
        <link rel="stylesheet" href="../css/home.css">
        
</head>

<body>
    
    <span style="color: #636568; font-size:30px; cursor:pointer" onclick="openNav()">&#9776; Video Navigation</span>

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="index.jsp">Video Gallery Home</a>
            <a href="cancer.jsp">Cancer</a>
            <a href="diabetes.jsp">Diabetes</a>
            <a href="std.jsp">STDs</a>
            <a href="kidney_dis.jsp">Kidney Diseases</a>
            <a href="dengue.jsp">Dengue</a>
            <a href="how_to.jsp">How to</a>
            <a href="firstaid.jsp">Tips and First Aid</a>
            <a href="religious.jsp">Religious</a>
            <a href="vir_tour.jsp">Virtual Tours</a>
            <a href="entertainment.jsp">Entertainment</a>
            
        </div>

<div class="head">
    
<center>
<h1>We bring the world to you. Why not enjoy the journey?</h1>
</center>
    
</div>


    <center>

        <div id="main">

            <iframe id="mainVideo" width="560" height="315" src="https://www.youtube.com/embed/Tph_ntIJQxk?autoplay=1" frameborder="0" allowfullscreen></iframe>
            
            <div id="myDiv" onclick="changeVideo(event)">

                <div id="vid1"><center><h6>Visit Paris in Virtual Reality</h6></center><img src="https://img.youtube.com/vi/Tph_ntIJQxk/0.jpg"><label id="vid1_label"></label></div>

                <div id="vid2"><center><h6>Queen Allows Tour of Buckingham Palace</h6></center><img src="https://img.youtube.com/vi/4wqMTdpBiLE/0.jpg"><label id="vid2_label"></label></div>

                <div id="vid2"><center><h6>360° Roller Coaster at Seoul Grand Park</h6></center><img src="https://img.youtube.com/vi/8lsB-P8nGSM/0.jpg"><label id="vid2_label"></label></div>

                <div id="vid2"><center><h6>360° Walking in New York</h6></center><img src="https://img.youtube.com/vi/f0-89v4Fk-M/0.jpg"><label id="vid2_label"></label></div>

                <div id="vid2"><center><h6>360° VR Going up to the top of the Eiffel Tower</h6></center><img src="https://img.youtube.com/vi/BuSGE1uQm9w/0.jpg"><label id="vid2_label"></label></div>

                
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

    
