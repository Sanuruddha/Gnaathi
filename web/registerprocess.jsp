
<%@page import="bean.RegisterDao"%>
<%@page import="bean.Validator"%>

<jsp:useBean id="obj2" class="bean.User"/>  
<%
    int usertype = Integer.parseInt(request.getParameter("user_type"));
    String username = request.getParameter("user_name");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String repassword = request.getParameter("retype-password");
    if(Validator.checkDuplicateEmail(email)){
        response.sendRedirect("home.jsp?duplicateemail=true");
    }
    else if (Validator.validateAll(usertype, email, username, password, repassword)) {
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
    }
    else{
        response.sendRedirect("home.jsp?registersuccess=false");
    }

%>
