<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en"><head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Forum :: Topic</title>

        <!-- Bootstrap -->
        <link href="Forum%20%20%20Topic_files/bootstrap.css" rel="stylesheet">

        <!-- Custom -->
        <link href="Forum%20%20%20Topic_files/custom.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
          <![endif]-->

        <!-- fonts -->
        <link href="Forum%20%20%20Topic_files/css.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="Forum%20%20%20Topic_files/font-awesome.css">

        <!-- CSS STYLE-->
        <link rel="stylesheet" type="text/css" href="Forum%20%20%20Topic_files/style.css" media="screen">

        <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
        <link rel="stylesheet" type="text/css" href="Forum%20%20%20Topic_files/settings.css" media="screen">
        <script>
            function myCreateFunction(element, x) {
                var position;
                var greatGrandParent = element.parentNode.parentNode.parentNode;
                for (var i = 0; i < greatGrandParent.parentNode.children.length; i++) {
                    var elm = greatGrandParent.parentNode.children[i];
                    if (elm.isSameNode(greatGrandParent) === true) {
                        position = i;
                        break;
                    }
                }
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        /* var str = "<div class='post'><form action='#' class='form' method='post'>"
                         + "<div class='topwrap'>"
                         + "<div class='userinfo pull-left'>"
                         + "<div class='avatar'>"
                         + "<img src='Forum%20%20%20Topic_files/avatar4.jpg' alt=''>"
                         + "<div class='status red'>&nbsp;</div>"
                         + " </div>"
                         
                         + "<div class='icons'>"
                         + "<img src='Forum%20%20%20Topic_files/icon3.jpg' alt=''><img src='Forum%20%20%20Topic_files/icon4.jpg' alt=''><img src='Forum%20%20%20Topic_files/icon5.jpg' alt=''><img src='Forum%20%20%20Topic_files/icon6.jpg' alt=''>"
                         + "</div>"
                         + "</div>"
                         + "<div class='posttext pull-left'>"
                         + "<div class='textwraper'>"
                         + "<div class='postreply'>Post a Reply</div>"
                         + "<textarea name='reply' id='reply' placeholder='Type your message here'></textarea>"
                         + "</div>"
                         + "</div>"
                         + "<div class='clearfix'></div>"
                         + "</div>"
                         + "<div class='postinfobot'>"
                         
                         + "<div class='notechbox pull-left'>"
                         + "<input name='note' id='note' class='form-control' type='checkbox'>"
                         + "</div>"
                         
                         + "<div class='pull-left'>"
                         + "<label for='note'> Email me when some one post a reply</label>"
                         + "</div>"
                         
                         + "<div class='pull-right postreply'>"
                         + "<div class='pull-left smile'<a href='#'><i class='fa fa-smile-o'></i></a></div>"
                         + "<div class='pull-left'><button type='submit' class='btn btn-primary'>Post Reply</button></div>"
                         + "<div class='clearfix'></div>"
                         + "</div>"
                         
                         
                         + " <div class='clearfix'></div>"
                         + "</div>"
                         + "</form>"
                         + "</div>";*/
                        var temp = document.createElement('div');
                        temp.innerHTML = this.responseText;
                        var newNode = temp.firstChild;
                        greatGrandParent.parentNode.insertBefore(temp, greatGrandParent.parentNode.children[position + 1]);
                    }
                };
                xhttp.open("GET", "retriveComments.jsp?input=" + x + "&input1=content", true);
                xhttp.send();
            }
        </script>
    </head>
    <%
        String search= request.getParameter("search");
       // out.println(search);
        String driverName = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String dbName = "gnaathi";
        String userId = "root";
        String password = "";

        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

    %>


    <body class="topic">

        <div class="container-fluid">

            <!-- Slider -->
            <div class="tp-banner-container" style="display:none;overflow: visible;">
                <div class="tp-banner revslider-initialised tp-simpleresponsive" style="max-height: 278px; height: 278px;" id="revslider-591">
                    <ul style="display: block; overflow: hidden;width: 100%; height: 100%; max-height: none;">	
                        <!-- SLIDE  -->
                        <li data-transition="fade" data-slotamount="7" data-masterspeed="1500" style="width: 100%; height: 100%; overflow: hidden; visibility: visible; left: 0px; top: 0px; z-index: 20; opacity: 1;">
                            <!-- MAIN IMAGE -->
                            <div class="slotholder" style="width:100%;height:100%;"><div class="tp-bgimg defaultimg" data-lazyload="undefined" data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat" data-lazydone="undefined" data-src="images/slide.jpg" style="background-color: transparent; background-repeat: no-repeat; background-image: url(&quot;images/slide.jpg&quot;); background-size: cover; background-position: left top; width: 100%; height: 100%; opacity: 1; position: relative;"></div></div>
                            <!-- LAYERS -->
                        </li>
                    </ul>
                    <div class="tp-loader" style="display: none;"></div><div class="tp-bannertimer" style="visibility: hidden; width: 0%;"></div></div>
            </div>
            <!-- //Slider -->


            <div class="headernav">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-1 col-xs-3 col-sm-2 col-md-2 logo "><a href="index.jsp"><img src="Forum%20%20%20New%20topic_files/logo.jpg" alt=""></a></div>
                        <div class="col-lg-3 col-xs-9 col-sm-5 col-md-3 selecttopic">
                            <div class="dropdown">
                                <!--     <a data-toggle="dropdown" href="#">Borderlands 2</a> <b class="caret"></b>
                                     <ul class="dropdown-menu" role="menu">
                                         <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Borderlands 1</a></li>
                                         <li role="presentation"><a role="menuitem" tabindex="-2" href="#">Borderlands 2</a></li>
                                         <li role="presentation"><a role="menuitem" tabindex="-3" href="#">Borderlands 3</a></li>
     
                                     </ul>   -->
                            </div>
                        </div>
                        <div class="col-lg-4 search hidden-xs hidden-sm col-md-3">
                            <div class="wrap">

                                <form action="searchTopic.jsp" method="post" class="form">
                                    <div class="pull-left txt"><input class="form-control" placeholder="Search Topics" type="text"></div>
                                    <div class="pull-right"><button style="width:30px;height:30px;background-size: 100% 100%;background-image: url('images/search.png')" class="btn btn-default" type="button"></button></div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xs-12 col-sm-5 col-md-4 avt">
                            <div class="stnt pull-left">                            
                                <form action="new_topic.html.htm" method="post" class="form">
                                    <button class="btn btn-primary">Start New Topic</button>
                                </form>
                            </div>
                      <!--      <div class="env pull-left"><i class="fa fa-envelope"></i></div>

                            <div class="avatar pull-left dropdown">
                                <a data-toggle="dropdown" href="#"><img src="Forum%20%20%20Topic_files/avatar.jpg" alt=""></a> <b class="caret"></b>
                                <div class="status green">&nbsp;</div>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">My Profile</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-2" href="#">Inbox</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-3" href="#">Log Out</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-4" href="http://forum.azyrusthemes.com/04_new_account.html">Create account</a></li>
                                </ul>
                            </div> -->
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>



            <section class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 breadcrumbf">
                            <!--          <a  href="#">Borderlands 2</a> <span class="diviver">&gt;</span> <a href="#">General Discussion</a> <span class="diviver">&gt;</span> <a href="#">Topic Details  </a> -->
                        </div>
                    </div>
                </div>


                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-8">




                            <%   
                                //String ah="os";
                                
                                try {
                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                    statement = connection.createStatement();
                                    //out.println(search);
                                 //search string is passing to this file but sql statement is not run
                                  
                                   String sql = "SELECT * FROM post1 where title  like '%"+search+"%' " ;
                                //  String sql = "SELECT * FROM post1 where title='"+search+"'" ;
                                    resultSet = statement.executeQuery(sql);
                                    
                                   // PreparedStatement ps=connection.prepareStatement("SELECT * FROM post1 where title=?");
                                    
                                  //  ps.setString(1,search);
                                    
                                   // ResultSet rs=ps.executeQuery();
                                    while (  resultSet.next()) {
                            %>
                            <!-- POST -->
                            <div class="post">
                                <div class="topwrap">
                                    <div class="userinfo pull-left">
                                        <div class="avatar">
                                            <img src="Forum%20%20%20Topic_files/avatar2.jpg" alt="">
                                            <div class="status red">&nbsp;</div>
                                        </div> 

                                        <!--    <div class="icons">
                                                <img src="Forum%20%20%20Topic_files/icon3.jpg" alt=""><img src="Forum%20%20%20Topic_files/icon4.jpg" alt=""><img src="Forum%20%20%20Topic_files/icon5.jpg" alt=""><img src="Forum%20%20%20Topic_files/icon6.jpg" alt="">
                                            </div> --> <!-- that flags -->
                                    </div>
                                    <div class="posttext pull-left">
                                       <p><b><%=resultSet.getString("title")%></b></p>
                                        <p><%=resultSet.getString("content")%></p>
                                        <p><%=resultSet.getString("time")%></p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>                              
                                <div class="postinfobot">

                                    <div class="likeblock pull-left">
                                     <!--   <a href="#" class="up"><i class="fa fa-thumbs-o-up"></i>10</a>
                                        <a href="#" class="down"><i class="fa fa-thumbs-o-down"></i>1</a> -->

                                        <a onclick="myCreateFunction(this,<%=Integer.parseInt(resultSet.getString("post_id"))%>)">Comments</a>

                                    </div>
                                        <!--
                                    <div class="prev pull-left">                                        
                                        <a href="#"><i class="fa fa-reply"></i></a>
                                    </div>

                                    <div class="posted pull-left"><i class="fa fa-clock-o"></i> Posted on : 20 Nov @ 9:45am</div>

                                    <div class="next pull-right">                                        
                                        <a href="#"><i class="fa fa-share"></i></a>

                                        <a href="#"><i class="fa fa-flag"></i></a>
                                    </div> 
                                    -->
                                    <div class="clearfix"></div>
                                </div>
                            </div><!-- POST -->



                            <!--
                             <div class="post">
                                 <form action="#" class="form" method="post">
                                     <div class="topwrap">
                                         <div class="userinfo pull-left">
                                             <div class="avatar">
                                                 <img src="Forum%20%20%20Topic_files/avatar4.jpg" alt="">
                                                 <div class="status red">&nbsp;</div>
                                             </div>
 
                                             <div class="icons">
                                                 <img src="Forum%20%20%20Topic_files/icon3.jpg" alt=""><img src="Forum%20%20%20Topic_files/icon4.jpg" alt=""><img src="Forum%20%20%20Topic_files/icon5.jpg" alt=""><img src="Forum%20%20%20Topic_files/icon6.jpg" alt="">
                                             </div>
                                         </div>
                                         <div class="posttext pull-left">
                                             <div class="textwraper">
                                                 <div class="postreply">Post a Reply</div>
                                                 <textarea name="reply" id="reply" placeholder="Type your message here"></textarea>
                                             </div>
                                         </div>
                                         <div class="clearfix"></div>
                                     </div>                              
                                     <div class="postinfobot">
 
                                         <div class="notechbox pull-left">
                                             <input name="note" id="note" class="form-control" type="checkbox">
                                         </div>
 
                                         <div class="pull-left">
                                             <label for="note"> Email me when some one post a reply</label>
                                         </div>
 
                                         <div class="pull-right postreply">
                                             <div class="pull-left smile"><a href="#"><i class="fa fa-smile-o"></i></a></div>
                                             <div class="pull-left"><button type="submit" class="btn btn-primary">Post Reply</button></div>
                                             <div class="clearfix"></div>
                                         </div>
 
 
                                         <div class="clearfix"></div>
                                     </div>
                                 </form>
                             </div>-->
                            <%
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>

                        </div>
                        <div class="col-lg-4 col-md-4">

                            <!-- -->
                              <div class="sidebarblock">
                                <h3>Categories</h3>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <ul class="cats">
                                        <li><a href="viewCategory.jsp"> Cancers <span class="badge pull-right"></span></a></li>
                                        <li><a href="viewCategory2.jsp"> Kidney Deseases <span class="badge pull-right"></span></a></li>
                                        <li><a href="viewCategory3.jsp"> Social Deseases <span class="badge pull-right"></span></a></li>
                                        <li><a href="viewCategory4.jsp"> General Topics <span class="badge pull-right"></span></a></li>
                                        <li><a href="viewCategory5.jsp"> Health Tips<span class="badge pull-right"></span></a></li>
                                        <li><a href="viewCategory6.jsp"> Dengu <span class="badge pull-right"></span></a></li>
                                        <li><a href="viewCategory7.jsp"> Others <span class="badge pull-right"></span></a></li>
                                    </ul>
                                </div>
                            </div>

                            <!-- -->
                      <div class="sidebarblock">
                                <h3>Poll of the Week</h3>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <p>Which event do you like for this week?</p>
                                    <form action="#" method="post" class="form">
                                        <table class="poll">
                                            <tbody><tr>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                                                watch a movie and discuss 
                                                            </div>
                                                        </div>
                                                    </td>

                                                    <td class="chbox">
                                                        <div class="pull-right">
                                                            <form action="userLike.jsp" >

                                                                <div class="pull-right"><button type="submit" style="width:30px;height:30px;background-size: 100% 100%;background-image: url('images/hari.png')" class="btn btn-default" type="button"></button></div>

                                                            </form>



                                                        </div>

                                                        <input id="opt1" name="opt" value="1" type="radio">  
                                                        <label for="opt1"></label> 

                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar color2" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 63%">
                                                                Bana Session
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="chbox">
                                                        <form action="userLike1.jsp" >

                                                            <div class="pull-right"><button type="submit" style="width:30px;height:30px;background-size: 100% 100%;background-image: url('images/hari.png')" class="btn btn-default" type="button"></button></div>

                                                        </form>
                                                        <input id="opt2" name="opt" value="2" type="radio">  
                                                        <label for="opt2"></label>  
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar color3" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
                                                                meet celebrity
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="chbox">
                                                        <form action="userLike2.jsp" >

                                                            <div class="pull-right"><button type="submit" style="width:30px;height:30px;background-size: 100% 100%;background-image: url('images/hari.png')" class="btn btn-default" type="button"></button></div>

                                                        </form>
                                                        <input id="opt3" name="opt" value="3" checked="checked" type="radio">  
                                                        <label for="opt3"></label>  
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                    </form>
                                    <!--       <p class="smal">Voting ends on 19th of October</p> -->
                                </div>
                            </div>

                            <!-- -->
                          <div class="sidebarblock">
                                <h3>My Active Threads</h3>
                                <div class="divline"></div>
                                <div class="blocktxt">



                                    <%
                                        String myT = session.getAttribute("user_id").toString();

                                        //  String w="12";
                                        try {
                                            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                            statement = connection.createStatement();

                                            String sql = "SELECT title FROM post1   where user_id=" + myT;

                                            resultSet = statement.executeQuery(sql);
                                            // int countCancer = 10;
                                            while (resultSet.next()) {
                                    %>



                                    <a href="myThreads.jsp"><p><%=resultSet.getString("title")%></p></a>



                                    <%
                                            }

                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>

                                </div>
                                <!--     <div class="divline"></div>
                                     <div class="blocktxt">
                                         <a href="#">Who Wins in the Battle for Power on the Internet?</a>
                                     </div>
                                     <div class="divline"></div>
                                     <div class="blocktxt">
                                         <a href="#">Sony QX10: A Funky, Overpriced Lens Camera for Your Smartphone</a>
                                     </div>
                                     <div class="divline"></div>
                                     <div class="blocktxt">
                                         <a href="#">FedEx Simplifies Shipping for Small Businesses</a>
                                     </div>
                                     <div class="divline"></div>
                                     <div class="blocktxt">
                                         <a href="#">Loud and Brave: Saudi Women Set to Protest Driving Ban</a>
                                     </div>
                                 </div> -->


                            </div>
                    </div>
                </div>



                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="pull-left"><a href="#" class="prevnext"><i class="fa fa-angle-left"></i></a></div>
                            <div class="pull-left">
                                <!--            <ul class="paginationforum">
                                                <li class="hidden-xs"><a href="#">1</a></li>
                                                <li class="hidden-xs"><a href="#">2</a></li>
                                                <li class="hidden-xs"><a href="#">3</a></li>
                                                <li class="hidden-xs"><a href="#">4</a></li>
                                                <li><a href="#">5</a></li>
                                                <li><a href="#">6</a></li>
                                                <li><a href="#" class="active">7</a></li>
                                                <li><a href="#">8</a></li>
                                                <li class="hidden-xs"><a href="#">9</a></li>
                                                <li class="hidden-xs"><a href="#">10</a></li>
                                                <li class="hidden-xs hidden-md"><a href="#">11</a></li>
                                                <li class="hidden-xs hidden-md"><a href="#">12</a></li>
                                                <li class="hidden-xs hidden-sm hidden-md"><a href="#">13</a></li>
                                                <li><a href="#">1586</a></li>
                                            </ul> -->
                            </div>
                            <div class="pull-left"><a href="#" class="prevnext last"><i class="fa fa-angle-right"></i></a></div>
                            <div class="clearfix"></div>                        
                        </div>
                    </div>
                </div>

            </section>

            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-1 col-xs-3 col-sm-2 logo "><a href="#"><img src="Forum%20%20%20Topic_files/logo.jpg" alt=""></a></div>
                        <div class="col-lg-8 col-xs-9 col-sm-5 ">Copyrights,Gnathi.lk</div>
                        <div class="col-lg-3 col-xs-12 col-sm-5 sociconcent">
                            <ul class="socialicons">
                                <li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-cloud"></i></a></li>
                                <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>
        </div>

        <!-- get jQuery from the google apis -->
        <script type="text/javascript" src="Forum%20%20%20Topic_files/jquery_003.js"></script>

        <!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
        <script type="text/javascript" src="Forum%20%20%20Topic_files/jquery_002.js"></script>
        <script type="text/javascript" src="Forum%20%20%20Topic_files/jquery.js"></script>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="Forum%20%20%20Topic_files/bootstrap.js"></script>


        <!-- LOOK THE DOCUMENTATION FOR MORE INFORMATIONS -->
        <script type="text/javascript">

                                            var revapi;

                                            jQuery(document).ready(function () {
                                                "use strict";
                                                revapi = jQuery('.tp-banner').revolution(
                                                        {
                                                            delay: 15000,
                                                            startwidth: 1200,
                                                            startheight: 278,
                                                            hideThumbs: 10,
                                                            fullWidth: "on"
                                                        });

                                            });	//ready

        </script>

        <!-- END REVOLUTION SLIDER -->

    </body></html>
