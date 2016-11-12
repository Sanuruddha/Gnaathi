<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String method=request.getMethod();
    if(method.equals("POST")){
        System.out.println(request.getParameter("message"));
    }
    else if(method.equals("GET")){
        out.println("This is from server");
    }
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
