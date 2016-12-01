<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>title of page</title>
    </head>
    <body>
        <h1>Hello World!</h1>





        <%
              //  out.println(8000000);
            String name1 = request.getParameter("user");
            String name2 = request.getParameter("post_id");
            String name3 = request.getParameter("content");

            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/kushan", "root", "");
                Statement st = con.createStatement();

                st.executeUpdate("insert into comment1 (post_id,user_id,content) values('" + name2 + "','" + name1 + "','" + name3 + "')");
                out.println("comment inserted");
            } catch (Exception e) {
                out.println(e);
            } finally {
                out.println("belive your self");
                //   out.println(name1);

            }
        %>
        <form action="retrive2.jsp">

            
            <input type="submit" value="Home page"/>
        </form>
        <form action="retriveComments.jsp">

            <input type="submit" value="View Comments"/>
        </form>
    </body>
</html>
