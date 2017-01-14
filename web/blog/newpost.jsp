

<%-- 
    Document   : newpost
    Created on : Nov 10, 2016, 12:51:23 PM
    Author     : Geeth
--%>
    <%@ page import="java.io.*"%>
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
    
        <form action="../posts" method="post"  >
                        <label style="font-size:20px;" >Title :</label>
                        <input class="form-control input-lg" style="font-size:20px;" type="text"  size="40" name="title" required/><br/><br/>
                      
                        <label style="font-size:20px;" for="body" >Body:</label>
                        
                        <%--for post plugins--%>
                        <br />

                        
                        <script src="nicEdit.js" type="text/javascript"></script>
                        <script type="text/javascript"> 
                            bkLib.onDomLoaded(function() {
	
                                new nicEditor({fullPanel : true}).panelInstance('area2');
	
                                                          });
                        </script>

                            <textarea class="form-control"  name="body" cols=85 rows=20 id="area2" ></textarea>

                           
                        <br>
                        <label style="font-size:20px;">Category :</label><select class="selectpicker" name="category">
                         <%
                         
                            String sql = "SELECT * FROM categories ";
                            Connection con = DB.getCon();
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                
                        %>
                        <option style="font-size:17px;"><%=rs.getString("category")%></option>
                            
                        <%
                            }
                            
                            %></select><br/><br/>
                            
                         
                       <br/>
                       <br/>
                       <button  type="submit" class="btn btn-primary btn-lg btn-block">SUBMIT</button>
                       
                    </form>

                           
                                </div>
                            </div>
                            </div></div>
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
                <div class="well">
                    <h4>Side Widget Well</h4>
                    <p style="font-size:17px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.</p>
                </div>
                </div>
                           
    </body>
    <script>
        $("#fileID").change(function(){
        filepath();
        });
        function filepath(){
            var fileInput = document.getElementById("fileID");
            var data = new FormData();
                jQuery.each(jQuery('#fileID')[0].files, function(i, file) {
                    data.append('file-'+i, file);
                });
            
            jQuery.ajax({
                url: '../../Gnaathi/posts',
                data: data,
                cache: false,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function(data){
                }
            });
        }
        </script>
</html>
