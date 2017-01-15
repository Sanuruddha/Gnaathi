<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String input = request.getParameter("input");

    //  String input1 = request.getParameter("input1");
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "gnaathi";
    String userId = "root";
    String password = "";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        System.out.println("1st try is not working");
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<h2 align="center"></h2>
<table align="right"  style=margin-left:20px; cellpadding="6" cellspacing="5" border="0">
    <tr>

    </tr>
    <tr bgcolor="#A52A2A">



        <!--  <td><b> user id </b></td>
          <td><b> replies </b></td>
          <td><b> Like </b></td> -->
    </tr>
    <%
        try {

            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();

            String sql = "SELECT * FROM comment1 where( post_id=" + (String) input + ")ORDER BY `comment_id` ASC; ";

            // String sql1 = "SELECT content FROM post1 where( post_id="+(String)input+");";
            // out.println(resultSet.getString(sql1));
            //  resultSet = statement.executeQuery(sql1);
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
    %>


    <!-- POST -->
    <div class="post">
        <form action="#" class="form" method="post">
            <div class="topwrap">
                <div class="userinfo pull-left">
                    <div class="avatar">
                        <img src="Forum%20%20%20Topic_files/avatar4.jpg" alt="">
                        <div class="status red">&nbsp;</div>
                         <p> <%=resultSet.getString("user_name")%> </p>
                    </div>

                    <!--     <div class="icons">
                           <img src="Forum%20%20%20Topic_files/icon3.jpg" alt=""><img src="Forum%20%20%20Topic_files/icon4.jpg" alt=""><img src="Forum%20%20%20Topic_files/icon5.jpg" alt=""><img src="Forum%20%20%20Topic_files/icon6.jpg" alt="">
                       </div> -->
                </div>
                <div class="posttext pull-left">
                    <div class="textwraper">
                        <!--   <div class="postreply">Post a Reply</div> -->
                        <label name="reply" id="reply" placeholder="Type your message here"><%=resultSet.getString("content")%></label>
                        <p>  <%=resultSet.getString("time")%> </p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>                              
            <div class="postinfobot">

             <!--   <div class="notechbox pull-left">
                    <input name="note" id="note" class="form-control" type="checkbox">
                </div> -->

                <!--      <div class="pull-left">
                          <label for="note"> Email me when some one post a reply</label>
                      </div> 
          
                      <div class="pull-right postreply">
                          <div class="pull-left smile"><a href="#"><i class="fa fa-smile-o"></i></a></div>
                          <div class="pull-left"><button type="submit" class="btn btn-primary">Post Reply</button></div>
                          <div class="clearfix"></div>
                      </div> -->


                <div class="clearfix"></div>
            </div>
        </form>
    </div><!-- POST -->


    <%
        }%>




</tr>

</table>
<%
    if (session.getAttribute("session").equals("TRUE")) {%>
<form action="addComment.jsp">
    <!--    <input type="text" name="user"  placeholder="user id"> -->

    <!--   <input id="name0" type="text" name="trick"  ng-hide=""hidden="true"   value="1"/>  -->

    <input id="name2" type="text" name="post_id"  ng-hide=""hidden="true"   value="<%=Integer.parseInt(input)%>"/>
    <input type="text" name="content" placeholder="write a comment"> 
    <input type="submit"  value="submit"/> 
</form>
<%}%>

<%
    } catch (Exception e) {
        e.printStackTrace();
       // out.print("enter post_id what post's comment do you want to see");
       out.println("login to add comments");
    } finally {
        //out.println(input1);
        // out.println(Integer.parseInt(input) +1);
    }
%>










