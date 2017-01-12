<%-- 
    Document   : search
    Created on : Jan 11, 2017, 6:40:46 AM
    Author     : Geeth
--%>

<%@page import="com.geeth.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

   <head>
        <head>
       <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Blog Home - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/blog-home.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>
    </head>
    <style>
        #post{
        
        border: 3px solid black;
        margin-top: 50px;
        margin-right: 200px;
        margin-left: 380px;
        padding: 30px 30px 50px 30px;
        }
        #new-post{
        
        border: 3px solid black;
        position: absolute;
        top: 50px;
        left: 27px;
        padding: 30px 30px 50px 30px;
        width :230px ;
        height:600px;
        }
         a.c1:link, a.c1:visited {
        background-color:rgb(255, 95, 0);
        color: white;
        padding: 14px 25px;
        text-align: center; 
        text-decoration: none;
        display: inline-block;
        }

        a.c1:hover, a.c1:active {
        background-color: rgb(255, 190, 0);
        }
    
    </style>
    <body>
   


 <!-- Page Content -->
    <div class="container">

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-8">

                    <br/></br>
                <p><%//out.println(pages);%></p>
                         <%
                           
                            String word = request.getParameter("search");
                            
                            String sql = "SELECT post_id,user_id,user_name,title,LEFT(body,300) AS body ,category,posted FROM posts WHERE title like  '%"+word+"%' ";
                            Connection con = DB.getCon();
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                int id=rs.getInt("post_id");
                                

                        %>
                        
                        
                           <table>   
                            <h2><%=rs.getString("title")%></h2>
                            </h2>
                            <p style="font-size:20px;" class="lead">
                             by <%=rs.getString("user_name")%>
                             </p>
                            <p style="font-size:20px;"><span class="glyphicon glyphicon-time"></span> Posted on <%=rs.getString("posted")%></p>
                            <p style="font-size:20px;">Category : <%=rs.getString("category")%></p> 
                           
                            <hr>
                            <img class="img-responsive" src="http://placehold.it/900x300" alt="">
                             <hr>
                            
                            <p style="font-size:20px;"><%=rs.getString("body")%></p>
                            
                          <th style="width: 90%"><a class="btn btn-primary" href="post.jsp?post_id=<%=id%>">Read More <span class="glyphicon glyphicon-chevron-right"></span></a></th>
                          
        
                        <% if(session.getAttribute("user_id")!=null){
                               String user_id=session.getAttribute("user_id").toString();
                               if(user_id.equals(rs.getString("user_id"))){
                           %>
                            <th style="width: 10%"><a style="font-size:20px;" href="epost.jsp?post_id=<%=id%>" ><button class="btn btn-primary">Edit <span class="glyphicon glyphicon-pencil"></span></button></a></th>
                            <form action="../deletepost" method="post">
                                <input type="hidden" name="post_id" value="<%=rs.getString("post_id")%>">
                                <th><button class="btn btn-primary"style="font-size:14px; "type="submit">Delete  <span class="glyphicon glyphicon-trash"></span></button></th>
                                
                                </form>
                            
                                <br/>
                                
                               
                           <%}}%> 
                          
                           </table>
                            <hr>
                            <br/><br/><br/><br/>
                            
                        <%
                            }

                        %>
                        

                

            </div>

            <!-- Blog Sidebar Widgets Column -->
            <div class="col-md-4">
                <br><br>
                <!-- new post -->
                 <div class="well">
                <% if(session.getAttribute("user_id")!=null){ %>
                <center>
                            <h2>If You Want To Add New Post</h2>
                           </artical>
                           <a  href="newpost.jsp" ><button type="button" class="btn btn-warning btn-lg">NEW POST</button></a><br>
                          </center>
                           <br>
                               <%}%>
                               </div>
                <!-- Blog Search Well -->
                <div class="well">
                    <h4>Blog Search</h4>
                    <div class="input-group">
                         <form action="search.jsp" method="post"  >
                        <table>
                        <th><input type="text" name="search" class="form-control"><span class="input-group-btn"></th>
                            <th><button class="btn btn-default" type="submit">
                                <span class="glyphicon glyphicon-search"></span>
                        </button>
                                </th></table></form>
                        
                        </span>
                    </div>
                    <!-- /.input-group -->
                </div>

                <!-- Blog Categories Well -->
                <div class="well">
                    <h4>Blog Categories</h4>
                    <div class="row">
                        <div  style="font-size:17px;" class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="catpost.jsp?category='Ayurwedic'">Ayurwedic</a>
                                </li>
                                <li><a href="catpost.jsp?category='Diseses'">Diseses</a>
                                </li>
                                <li><a href="catpost.jsp?category='Medicine'">Medicine</a>
                                </li>
                                <li><a href="catpost.jsp?category='sports'" >Sports</a>
                                </li>
                                <li><a href="catpost.jsp?category='Healthcare'">Healthcare</a>
                                </li>
                                <li><a href="catpost.jsp?category='Culture'">Culture</a>
                                </li>
                            </ul>
                        </div>
                       
                        <!-- /.col-lg-6 -->
                    </div>
                    <!-- /.row -->
                </div>

                <!-- Side Widget Well -->
                <div class="well">
                    <h4>Side Widget Well</h4>
                    <p style="font-size:17px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.</p>
                </div>

            </div>

        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>                 