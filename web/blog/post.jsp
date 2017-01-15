
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.geeth.DB"%>


<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
    <style>
        #c1{
        
        border: 3px solid black;
        margin-top: 50px;
        margin-right: 420px;
        margin-left: 90px;
        padding: 30px 30px 50px 30px;
        }
        #new-post{
        
        border: 3px solid black;
        position: absolute;
        top: 53px;
        left: 27px;
        padding: 30px 30px 50px 30px;
        width :250px ;
        height:600px;
        }
        #add-comment{
        
        border: 3px solid black;
        margin-right: 420px;
        margin-left: 90px;
        padding: 0px 30px 50px 30px;
        }
        #comment{
        
        border: 3px solid black;
        margin-right: 420px;
        margin-left: 90px;
        padding: 0px 30px 50px 30px;
        }
         a.c2:link, a.c2:visited {
        background-color:rgb(255, 95, 0);
        color: white;
        padding: 14px 25px;
        text-align: center; 
        text-decoration: none;
        display: inline-block;
        }

        a.c2:hover, a.c2:active {
        background-color: rgb(255, 190, 0);
        }
        label{display: block}
         td.t1{
            width:50px;
        }
         td.t2{
            width:60px;
        }
        td.t3{
            align:left;
            width:120px;
        }
        td.t4{
            width:10px;
        }
    </style>
   
    <body>
        <div class="container">
             <div class="row">
         <div class="col-md-8">
             <br><br>
              <div class="panel panel-default">
                   <div class="panel-body">
          <artical>
                        <%
                           // Object post_id=session.getAttribute("post_id");
                            
                           // int x=Integer.parseInt(post_id+"");
                           // int x=4;
                            String var =request.getParameter("post_id");
                            String sql = "SELECT post_id,title,body ,posted FROM posts where post_id= "+ var;
                            Connection con = DB.getCon();
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                

                        %>
                        
                        
                              
                            <h2 style="font-size:35px;"><%=rs.getString("title")%></h2>
                            <p style="font-size:20px;"><%=rs.getString("body")%></p>
                            
                           
                        <%
                            }

                        %>
                        
                       
</div>

                    </artical>
                    </div>
                        <div class="well">
                      <br><div class="panel panel-info">
                            
                                 <div class="panel-heading"><h2 >Comments</h2></div>
                                <br>
                                  <%
                           
                           
                            String comments = "SELECT * FROM comments  Where post_id= "+ var;
                            Statement s = con.createStatement();
                            ResultSet rs1 = s.executeQuery(comments);
                            while (rs1.next()) {
                                

                        %><div class="panel panel-default">
                            <div class="panel-body">
                        <table>
                           <tr align="left">
                                <td class="t1" ><img src="face.png"  width="30" height="30" ></td>
                                <td class="t2"><p style="font-size:18px; color: rgb(60, 82, 255);"><%= rs1.getString("name")%> </p> </td>
                                <td class="t4">:</td>
                             <td class="t3"><p style="font-size:18px;" ><%=rs1.getString("comment")%></p></td>
                           </tr></table>
                            
                           </div></div>
                        <%
                            }

                        %>
                        </div>
                                  
                                  
                              </div>
                      
                      <br>
     
                       <% if(session.getAttribute("user_id")!=null){ %>
                      <div class="well">
                          <div class="panel panel-info">
                          <div class="panel-heading"><h2 >Post a new comment</h2></div>
                          <div class="panel-body">
                          <form action="../AddComment" method="post">
                              <div>
                                  <label>Email Address</label><input ="text"  class="form-control"  name="email" />
                              </div>
                              
                              <div>
                                  <label>Name </label><input ="text"  class="form-control"  name="name"/>
                              </div>
                              
                              <div>
                                  <label>Comment </label><textarea  class="form-control"  name="comment"></textarea>
                              </div>
                              <input type="hidden" name="var" value="<% out.print(var);%>" /> 
                              <input type="submit" name="submit" value="Submit" /> 
                              </form></div></div></div>
                              <%}%>
                              
                       </div>  
                              
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
                              
                              
                              </div>
                              </div>
                        
    </body>
</html>
