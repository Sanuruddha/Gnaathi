<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
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
            //String name1 = request.getParameter("user");
            String name0 = session.getAttribute("user_name").toString();
            String name1 = session.getAttribute("user_id").toString();
            String name2 = request.getParameter("post_id");
            String name3 = request.getParameter("content");
              DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
        Date dateobj = new Date();
        String name5 = df.format(dateobj);

          //  String name0 = request.getParameter("trick");

            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/gnaathi", "root", "");
                Statement st = con.createStatement();
                
                    st.executeUpdate("insert into comment1 (user_name,post_id,user_id,content,time) values('" + name0 + "','" + name2 + "','" + name1 + "','" + name3 + "','" + name5 + "')");
                    out.println("comment inserted");
                
            } catch (Exception e) {
                out.println(e);
            } finally {

                // out.println(name0);
                RequestDispatcher rd1 = request.getRequestDispatcher("forum.jsp");
                rd1.forward(request, response);
                out.println("belive your self");

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
