<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String method=request.getMethod();
    if(method.equals("POST")){
        System.out.println(request.getParameter("message"));
    }
    else if(method.equals("GET")){
        out.println("This is from server");
    }
%>

