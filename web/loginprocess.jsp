
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.LoginDao"%>  
<jsp:useBean id="obj" class="bean.User"/>  

<jsp:setProperty property="*" name="obj"/> 

<%
    boolean status= LoginDao.validate(obj);
    if (status){
        session.setAttribute("session", "TRUE");
        session.setAttribute("user",obj);
        if(obj.getUserType()==0){
            RequestDispatcher rs=request.getRequestDispatcher("adminpanel.php");
            rs.forward(request, response);
        }
        
%>
<jsp:forward page="userhome.jsp"></jsp:forward>
<%
} else {
session.setAttribute("invalidlogin","TRUE");
}
%>  
<jsp:forward page="home.jsp"/>

