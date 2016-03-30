<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body  style=" color:blue;">
    <h1>USER ACCEPTED</h1>
    <%!
        Connection c=null;
        PreparedStatement ps=null;
        
        String id=null;

    %>
    
    <%
    id=request.getParameter("id");
    c=db.DatabaseConnection.dbConnect("XE");
    c.setAutoCommit(false);
    ps=c.prepareStatement("UPDATE USER_PROFILE SET VERIFIED=? where USER_LOG_ID=?");
    ps.setInt(1, 1);
    ps.setString(2, id);
    int i=ps.executeUpdate();
    if(i>0) c.commit();
    else c.rollback();
    
    %>
    
        
    </body>
</html>
