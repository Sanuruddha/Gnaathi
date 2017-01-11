
<%@page import="bean.RegisterDao"%>

<jsp:useBean id="obj2" class="bean.User"/>  
<%
    obj2.setUserType(Integer.parseInt(request.getParameter("user_type")));
    obj2.setUserName(request.getParameter("user_name"));
    obj2.setPassword(request.getParameter("password"));
    obj2.setEmail(request.getParameter("email"));
    
    boolean status = RegisterDao.register(obj2);
    if (status) {
        response.sendRedirect("home.jsp?loginpage=true&registersuccess=true");
    } else {
        response.sendRedirect("home.jsp?registersuccess=false");
    }
%>
