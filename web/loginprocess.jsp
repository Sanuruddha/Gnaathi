<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.LoginDao"%>  
<jsp:useBean id="obj" class="bean.User"/>  

<jsp:setProperty property="*" name="obj"/> 

<%  
//    checks the login validity
    boolean status = LoginDao.validate(obj,session);
    if (status) {    
        out.println(session.getAttribute("user_id"));
        if (session.getAttribute("user_type").equals(0)) {
            RequestDispatcher rs = request.getRequestDispatcher("adminpanel.jsp");
            rs.forward(request, response);
        } else if (session.getAttribute("user_type").equals(1)) {
            RequestDispatcher rs = request.getRequestDispatcher("userhome.jsp");
            rs.forward(request, response);
        }

    } else {
        session.setAttribute("invalidlogin", "TRUE");
        RequestDispatcher rs = request.getRequestDispatcher("home.jsp");
        rs.forward(request, response);
    }
%>  


