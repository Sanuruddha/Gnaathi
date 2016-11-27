<% 
    if(session.getAttribute("session")!=null){
        if(session.getAttribute("session").equals("FALSE"))
            response.sendRedirect("home.jsp");
            
    }
    else{
        response.sendRedirect("home.jsp");
    }
%>
