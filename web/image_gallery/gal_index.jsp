<!DOCTYPE html>

<html>

<head>

	<title>Image Gallery</title>

	 <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" href="css/css_vidgal_home.css">
        <link rel="stylesheet" href="css/gallery_header.css">
        <link rel="stylesheet" href="../css/userhome.css">


         <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/slicebox.css" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" />
        <script type="text/javascript" src="js/modernizr.custom.46884.js"></script>
        <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-7243260-2']);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();

        </script>

        
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





    <ul id="sb-slider" class="sb-slider">

                    <li>
                        <a href="http://www.flickr.com/photos/strupler/2969141180" target="_blank">
                        <center>
                        <img src="images/Piritha/image1.jpg" height="424px" width="640px" alt="image1">
                        </center>
                        </a>
                        <div class="sb-description">
                            <h3><center>Pirith Ceromony</center></h3>
                        </div>
                    </li>

                    <li>
                        <a href="http://www.flickr.com/photos/strupler/2969141180" target="_blank">
                        <center>
                        <img src="images/Piritha/image2.jpg" height="424px" width="640px" alt="image1">
                        </center>
                        </a>
                        <div class="sb-description">
                            <h3><center>Pirith Ceromony</center></h3>
                        </div>
                    </li>

                    <li>
                        <a href="http://www.flickr.com/photos/strupler/2969141180" target="_blank">
                        <center>
                        <img src="images/Piritha/image3.jpg" height="424px" width="640px" alt="image1">
                        </center>
                        </a>
                        <div class="sb-description">
                            <h3><center>Pirith Ceromony</center></h3>
                        </div>
                    </li>

                    <li>
                        <a href="http://www.flickr.com/photos/strupler/2969141180" target="_blank">
                        <center>
                        <img src="images/Piritha/image4.jpg" height="424px" width="640px" alt="image1">
                        </center>
                        </a>
                        <div class="sb-description">
                            <h3><center>Pirith Ceromony</center></h3>
                        </div>
                    </li>

                    <li>
                        <a href="http://www.flickr.com/photos/strupler/2969141180" target="_blank">
                        <center>
                        <img src="images/Piritha/image5.jpg" height="424px" width="640px" alt="image1">
                        </center>
                        </a>
                        <div class="sb-description">
                            <h3><center>Pirith Ceromony</center></h3>
                        </div>
                    </li>

                    <li>
                        <a href="http://www.flickr.com/photos/strupler/2969141180" target="_blank">
                        <center>
                        <img src="images/Piritha/image6.jpg" height="424px" width="640px" alt="image1">
                        </center>
                        </a>
                        <div class="sb-description">
                            <h3><center>Pirith Ceromony</center></h3>
                        </div>
                    </li>

                    <li>
                        <a href="http://www.flickr.com/photos/strupler/2969141180" target="_blank">
                        <center>
                        <img src="images/Piritha/image7.jpg" height="424px" width="640px" alt="image1">
                        </center>
                        </a>
                        <div class="sb-description">
                            <h3><center>Pirith Ceromony</center></h3>
                        </div>
                    </li>

                    <li>
                        <a href="http://www.flickr.com/photos/strupler/2969141180" target="_blank">
                        <center>
                        <img src="images/Piritha/image8.jpg" height="424px" width="640px" alt="image1">
                        </center>
                        </a>
                        <div class="sb-description">
                            <h3><center>Pirith Ceromony</center></h3>
                        </div>
                    </li>

                    

                </ul>

                <div id="shadow" class="shadow"></div>

                <div id="nav-arrows" class="nav-arrows">
                    <a href="#">Next</a>
                    <a href="#">Previous</a>
                </div>

                <div id="nav-options" class="nav-options">
                    <span id="navPlay">Play</span>
                    <span id="navPause">Pause</span>
                </div>

            </div><!-- /wrapper -->



        </div>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery.slicebox.js"></script>
        <script type="text/javascript">
            $(function () {

                var Page = (function () {

                    var $navArrows = $('#nav-arrows').hide(),
                            $navOptions = $('#nav-options').hide(),
                            $shadow = $('#shadow').hide(),
                            slicebox = $('#sb-slider').slicebox({
                        onReady: function () {

                            $navArrows.show();
                            $navOptions.show();
                            $shadow.show();

                        },
                        orientation: 'h',
                        cuboidsCount: 3
                    }),
                            init = function () {

                                initEvents();

                            },
                            initEvents = function () {

                                // add navigation events
                                $navArrows.children(':first').on('click', function () {

                                    slicebox.next();
                                    return false;

                                });

                                $navArrows.children(':last').on('click', function () {

                                    slicebox.previous();
                                    return false;

                                });

                                $('#navPlay').on('click', function () {

                                    slicebox.play();
                                    return false;

                                });

                                $('#navPause').on('click', function () {

                                    slicebox.pause();
                                    return false;

                                });

                            };

                    return {init: init};

                })();

                Page.init();

            });
        </script>
        
    </body>
</html>	


</body>

</html>