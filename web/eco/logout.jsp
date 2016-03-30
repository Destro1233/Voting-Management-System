<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
              <%! HttpSession session; %>
<%
 session= request.getSession(false);
 if(session==null)
     {

     response.sendRedirect("../index.jsp");

     }
 else
     {
     session=request.getSession();
     session.invalidate();

     }
 %>
        <title>EPOLL</title>
    </head>
    <body>
    <h1> You have been sucessfully log out...... </h1>

<%
response.setHeader("Pragma","no-cache"); // HTTP 1.0
     response.setHeader("Cache-Control","no-store"); // HTTP 1.1
     response.setDateHeader("Expires", 0);
%>
   <h3> <a href="../index.jsp">go back to website home page</a> </h3>
    
    
    
    
    </body>
</html>
