<%@page import="bean.LogoutDao"%>  
<% 
    
    if(session.getAttribute("session")!=null){
        LogoutDao.logout(Integer.parseInt(session.getAttribute("user_id").toString()));
        session.setAttribute("session", "FALSE");
    }
   session.invalidate();
   response.sendRedirect("home.jsp");
   
%>
