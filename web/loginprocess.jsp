<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.LoginDao"%>  
<jsp:useBean id="obj" class="bean.User"/>  

<jsp:setProperty property="*" name="obj"/> 

<%  
//    checks the login validity
    boolean status = LoginDao.validate(obj,session);
    if (status) {    
        session.setAttribute("session", "TRUE");
        out.println(session.getAttribute("user_id"));
        
        if (session.getAttribute("user_type").equals(0)||session.getAttribute("user_type").equals(10)) {
            response.sendRedirect("adminpanel.jsp");
        } else if (session.getAttribute("user_type").equals(1)) {
            response.sendRedirect("userhome.jsp");
        }
        else if(session.getAttribute("user_type").equals(2)){
            response.sendRedirect("researcherhome.jsp");
        }
        else if(session.getAttribute("user_type").equals(3)){
            response.sendRedirect("elderlyhome.jsp");
        }
       
    } else {
        session.setAttribute("invalidlogin", "TRUE");
        RequestDispatcher rs = request.getRequestDispatcher("home.jsp");
        rs.forward(request, response);
    }
%>  


