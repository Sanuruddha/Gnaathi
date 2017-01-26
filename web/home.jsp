<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gnaathi</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/error.css">
        <script src="js/jquery-3.1.1.js"></script>
        <script  type="text/javascript" src="js/home.js"></script>

    </head>
    <body style="position: relative;height: 100vh;">

        <!-- register form -->

        <div id="registerform-container">
            <%@include file="includes/registerform.html"%>
        </div>
        <%
            if (request.getParameter("registersuccess") != null)
                if (request.getParameter("registersuccess").equals("false")) {
        %>
        <script>
            $("#myNav").width("100%");
        </script>
        <%}%>
        <div id="login-form-container">
            <%@include file="includes/loginform.html"%>
        </div>
        <%
            if (request.getParameter("loginpage") != null)
                if (request.getParameter("loginpage").equals("true")) {
        %>
        <script>
            $("#login-form").width("100%");
        </script>
        <%}%>

        <!-- header-->
        <%@include file="includes/header-home.html"%>

        <!--error message unsuccessful login-->
        <%@include file="includes/error.html"%>


        <%if (session.getAttribute("invalidlogin") != null) {
                if (session.getAttribute("invalidlogin").equals("TRUE")) {
        %>
        <script>$("#login-error").css("display", "block");</script>
        <%}
            }%>

        <!--***************-->

        <!--error message email error-->
        <%@include file="includes/emailerror.html"%>
        <%if (request.getParameter("duplicateemail") != null) {
                if (request.getParameter("duplicateemail").equals("true")) {
        %>
        <script>$("#email-error").css("display", "block");</script>
        <%}
            }%>    

        <!--***************-->

        <!--successfully registered message-->

        <%@include file="includes/success.html"%>
        <%if (request.getParameter("registersuccess") != null) {
                if (request.getParameter("registersuccess").equals("true")) {
        %>
        <script>$(".success").css("display", "block");</script>
        <%}
            }%>

        <!--***************-->

        <div id="body">
            <%@include file="includes/leftcolumn-home.html"%>


            <%@include file="includes/middlecolumn-home.html"%>


            <%@include file="includes/rightcolumn-home.html"%>

        </div>

    </body>
</html>

