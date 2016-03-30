<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<%@page  errorPage="../err.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
    </head>
    <body>
    

			<%!
        Connection c=null;
        PreparedStatement ps=null;
        PreparedStatement ps1=null;
        PreparedStatement ps2=null;
         String id=null;

    %>
    <%= request.getParameter("id") %>
    <%
    id=request.getParameter("id");
    c=db.DatabaseConnection.dbConnect("XE");
    c.setAutoCommit(false);
    ps=c.prepareStatement("DELETE FROM USER_PROFILE where USER_LOG_ID=?");
    ps.setString(1, id);
    ps1=c.prepareStatement("DELETE FROM USER_LOGIN where USER_LOG_ID=?");
    ps1.setString(1, id);
    ps2=c.prepareStatement("DELETE FROM USER_VOTING where ADMIN_ID=(SELECT USER_ADMIN_ID FROM USER_PROFILE where USER_LOG_ID=?)");
    ps2.setString(1, id);
    int i=ps2.executeUpdate();
    int j=ps1.executeUpdate();
    int k=ps.executeUpdate();
    
    
    if(i>0 & j>0 & k>0) c.commit();
    else c.rollback();
    //response.sendRedirect("veruser.jsp");
    out.println("<h1>User Rejected Sucessfully </h1>");

    %>
    
    
    
    
    
    </body>
</html>
