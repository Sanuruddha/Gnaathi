<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String id = request.getParameter("userId");
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
    <body>
        <div id="main">
            <div id="gnathiphoto" style="width:100%;background-color: blue;height:150px">
                
                 
            </div>
            <div id="raw2" style="width:100%;height:70px">
                <div id="logo" style="background-color: purple;margin-left: 10;width:15%;height:70px;display:inline-block">
                         <input type="image" src="images/glogo.png" style="margin-left: 55"> 
                </div>
                <div id="searchTopic" style="width:35%;background-color:yellow;height:70px;display:inline-block">
                    <form action="rcat.jsp">
                       <input type="text" name="topic" placeholder="Search Topics"> 
                        <input type="submit"  value="submit"/> 
                    </form>
                </div>

                <div id="Home" style="width:15%;background-color: maroon;height:70px;display:inline-block">

                </div>





                <div id="newTopic" style="width:33%;position:right;height:70px;display:inline-block">
                    <form action="valid1" >
                        user name: <input type="text" name="user" >
                        password:<input type="text" name="password" >
                        <input type="submit" value="login to add post"/>
                    </form>
                </div>
            </div>
            <div id="content" style="background-color:red ;display: inline-block">
                <div id="column1"  style="width:65%;height:400px;position: absolute;top:265px;margin: 0;padding: 0;display:inline-block">
                    <h2 align="center"><font><strong> Gnathi forum </strong></font></h2>
                    <table align="left" style=margin-left:45; cellpadding="20" cellspacing="20" border="0" id="myTable" >
                        <col width="700">
                            
                            <col width="10">
                                <col width="10">
                                    <tr>
                                    </tr>
                                    <tr bgcolor="A52A2A">
                                    <td><b>content</b></td>
                                    <td><b>likes</b></td>
                                    <td><b>replies</b></td>
                                    </tr>
                                    <%    try {
                                            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                            statement = connection.createStatement();

                                            String sql = "SELECT * FROM post1 ";

                                            resultSet = statement.executeQuery(sql);

                                            while (resultSet.next()) {
                                    %>
                                    <tr bgcolor="#E6E6FA">
                                    <td><%=resultSet.getString("content")%></td>
                                    <td><input type="image" src="images/like.png" name="image" width="20" height="30"> </td>
                                    <td>
                                        <script>
                                            var i = 0;
                                            var array = [];
                                            function myCreateFunction(element) {
                                                var x = element.value;
                                                var k;
                                                var check = 0;
                                                for (k = 0; k < array.length; k++) {
                                                    if (array[k] == x) {
                                                        check++;
                                                    }
                                                }
                                                if (check == 0) {
                                                    array[i] = x;
                                                    i++;
                                                    // alert(array[0]);
                                                    //array.sort();
                                                    array.sort(function (a, b) {
                                                        return a - b
                                                    });
                                                    // alert(array[0]);
                                                    var j;
                                                    for (j = 0; j < array.length; j++) {
                                                        if (array[j] == x) {
                                                            var a = parseInt(x) + parseInt(j) + parseInt(2);
                                                            // alert(a);
                                                            var table = document.getElementById("myTable");
                                                            var row = table.insertRow(a);
                                                            var cell1 = row.insertCell(0);
                                                            var xhttp = new XMLHttpRequest();
                                                            xhttp.onreadystatechange = function () {
                                                                if (this.readyState == 4 && this.status == 200) {
                                                                    //document.getElementById("demo").innerHTML =
                                                                    // alert(x);
                                                                    cell1.innerHTML = this.responseText;
                                                                    //   eval(document.getElementById("ajaxeddatasubmit").innerHTML);
                                                                }
                                                            };
                                                            xhttp.open("GET", "retriveComments.jsp?input=" + x + "&input1=content", true);
                                                            xhttp.send();
                                                        }
                                                    }
                                                }
                                            }
                                        </script>
                                    <button onclick="myCreateFunction(this)"  value="<%=Integer.parseInt(resultSet.getString("post_id"))%>">comments </button>
                                    </td>
                                    </tr> 
                                    <%
                                            }

                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                    </table>
                                    </div>
                                    <div id="column2" style="position:absolute;right :0%;width:35%;height:400px;display:inline-block">
                                        <div id="category" style="width:85%;height:133px">
                                            <table align="right" style=margin-right:70px;margin-top:150px; cellpadding="6" cellspacing="0" border="0">
                                                <col width="200">
                                                    <tr>
                                                    </tr>
                                                    <tr bgcolor="#A52A2A">
                                                    <td><b> categories </b></td>
                                                    <tr bgcolor="F8F8FF">
                                                    <tr><td><b><a href="rcat.jsp" >cat1</a> </b></td></tr>
                                                    <tr><td><b>cat2</b></td></tr>
                                                    <tr><td><b>cat3</b></td> </tr> 
                                                    <tr><td><b>podi kaiywaruwak gahamu</b> </td></tr>
                                            </table>
                                        </div>
                                        <div id="polls" style="width:100%;height:133px">
                                            <table align="center" style=margin-right:105px;margin-top:270px; cellpadding="5" cellspacing="0" border="0">
                                                <col width="200">
                                                    <tr>
                                                    </tr>
                                                    <td><b> poll of the week  </b></td>
                                                    <tr bgcolor="#A52A2A">
                                                    <td><b>what event do you like for this weekend? </b></td>
                                                    <tr bgcolor="F8F8FF">
                                                    <tr><td><b>bana session</b></td><td><input type="image" src="images/hari.png" name="image" width="20" height="30"></td></tr>
                                                    <tr><td><b> visit temple</b></td><td><input type="image" src="images/hari.png" name="image" width="20" height="30"></td></tr>
                                                    <tr><td><b> online lecture </b></td> <td><input type="image" src="images/hari.png" name="image" width="20" height="30"></td></tr>  
                                                    <tr><td><b> watch movie and discuss the meanning </b></td> <td><input type="image" src="images/hari.png" name="image" width="20" height="30"></td></tr>  
                                            </table>
                                        </div>
                                        <div id="myThreds" style="width:100%;height:133px">
                                            <table align="right"  style=margin-right:90px;margin-top:300px; cellpadding="5" cellspacing="0" border="0">
                                                <col width="200">
                                                    <tr>
                                                    </tr>
                                                    <tr bgcolor="#A52A2A">
                                                    <td><b> my active threada </b></td>
                                                    <tr bgcolor="F8F8FF">
                                                    <tr><td><b><a href="rcat.jsp" >mama match blanawa</a> </b></td></tr>
                                                    <tr><td><b>treat1</b></td></tr>
                                                    <tr><td><b>my active threda</b></td> </tr>  
                                            </table>
                                        </div>
                                    </div>
                                    </div>
                                    </div>
                                    </body>
                                    </html>
