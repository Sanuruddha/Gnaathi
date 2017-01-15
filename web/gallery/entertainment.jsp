<!DOCTYPE html>
<html>
    
<head>
    
    <title>Entertainment</title>
        
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
            <a href="vir_tour.jsp">Virtual Tours</a>
            <a href="religious.jsp">Religious</a>
            <a href="entertainment.jsp">Entertainment</a>
        </div>
        
<div class="head">
    
<center>
<h1>Happy people do not have the best of everything.<br>
They make the best of everything. </h1>
</center>

</div>


 <center>

        <div id="main">

            <iframe id="mainVideo" width="560" height="315" src="https://www.youtube.com/embed/Ql3sIB76R1s?autoplay=1" frameborder="0" allowfullscreen></iframe>
            
            <div id="myDiv" onclick="changeVideo(event)">

                <div id="vid1"><center><h6>Invisible Rope Prank</h6></center><img src="https://img.youtube.com/vi/nS8nPigov0g/0.jpg"><label id="vid1_label"></label></div>

                <div id="vid2"><center><h6>SELFIE PRANK - The Chainsmokers PARODY</h6></center><img src="https://img.youtube.com/vi/gdnAiiKSBog/0.jpg"><label id="vid2_label"></label></div>

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
 