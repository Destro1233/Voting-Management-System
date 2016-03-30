<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<%@page errorPage="err.jsp" %>
<%@page   session="false" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
    </head>
    <body>
        <%!
        String id=null;
        String pwd=null;
        HttpSession session;


        %>
        <%
        id=request.getParameter("id");
        pwd=request.getParameter("passwordtxt");
        if(db.Login.loginChk(id, pwd, "XE", "ADMIN_LOGIN", "ID","PSWD"))
            {
            session=request.getSession();
            session.setAttribute("id",id);
            session.setMaxInactiveInterval(1000);
            response.sendRedirect("admin/home.jsp");
            }
        else
            {
                      RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                      rd.include(request,response);
                      out.println("<center><h2>Invalid user id or password.</h2> </center>");
            }
        
        %>
    
    
    
    
    
    </body>
</html>
