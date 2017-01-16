

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
     
    <body>
        <div class="col-md-8">
             <div class="well" >
        <div class="panel panel-info">
        <div class="panel-heading"><h2 style="font-size:45px;  "><center>Write Your Article</center></h2>
        </div>
        <div class="panel-body">
             <form action="../editpost?post_id=<%=request.getParameter("post_id")%>" method="post"  >
                      <%
                           // Object post_id=session.getAttribute("post_id");
                            
                           // int x=Integer.parseInt(post_id+"");
                           // int x=4;
                            String var =request.getParameter("post_id");
                            String sql = "SELECT post_id,title,body,category,posted FROM posts where post_id= "+ var;
                            Connection con = DB.getCon();
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                

                        %>
                        
                        
                              
                            
                             <label style="font-size:20px;">Title :</label>
                              <input class="form-control input-lg" style="font-size:20px;" type="text"  size="40" name="title" value="<%=rs.getString("title")%>"  required/><br/>
                     
                        <label style="font-size:20px;" for="body">Body:</label>
                        <br />

                        
                        <script src="nicEdit.js" type="text/javascript"></script>
                        <script type="text/javascript"> 
                            bkLib.onDomLoaded(function() {
	
                                new nicEditor({fullPanel : true}).panelInstance('area2');
	
                                                          });
                        </script>
                            <textarea class="form-control"  name="body" cols=85 rows=20 id="area2" ><%=rs.getString("body")%></textarea>
                           
                        
                        <br/><br/>
                        <label style="font-size:20px;">Category :</label><select name="category" >
                         <option selected style="font-size:17px;"> <%=rs.getString("category")%></option>
                            <%
                         
                            String sql1 = "SELECT * FROM categories ";
                            Connection con1 = DB.getCon();
                            Statement stmt1 = con1.createStatement();
                            ResultSet rs1 = stmt1.executeQuery(sql1);
                            while (rs1.next()) {
                                
                        %>
                         
                        <option style="font-size:17px;"><%=rs1.getString("category")%></option>
                            
                        <%
                            }
                            
                            %></select>
                        
                        
                           
                        <%
                            }

                        %><br/><br/>
                  
                       <button  type="submit" class="btn btn-primary btn-lg btn-block">SUBMIT</button>
                       
                    </form>
                        </div></div></div></div>
                        
                               <div class="col-md-4">
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
                
                </div>
    </body>
</html>
