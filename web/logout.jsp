<%@page import="bean.LogoutDao"%>  
<% 
    LogoutDao.logout((int)session.getAttribute("user_id"));
   session.setAttribute("session", "FALSE");
   session.invalidate();
   
%>
