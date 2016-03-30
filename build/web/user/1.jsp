package user;

<%-- tpl:insert page="user_template.jsp" --%>
<%-- 
    Document   : user_home
    Created on : Jul 13, 2012, 11:35:05 PM
    Author     : Saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  session="false" errorPage="err.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME</title>
    </head>
    <body>
        <%! HttpSession session; %>
        <%
        session=request.getSession(false);
        if(session==null)
            {
            response.sendRedirect("/NATPOL/main_login.jsp");
            }
     else
       {
            session=request.getSession();
       out.println("Welcome user");

        }
        %>
    </body>
</html>
