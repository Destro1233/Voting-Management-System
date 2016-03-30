<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<%@page errorPage="../err.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCEPTED</title>
    </head>
    <body>
    <h1>CANDIDATE ACCEPTED</h1>
    
    <%!
        Connection c=null;
        PreparedStatement ps=null;

        
        String cid=null;

    %>
    
    <%
    cid=request.getParameter("cid");
    out.println(cid);
    c=db.DatabaseConnection.dbConnect("XE");
    c.setAutoCommit(false);
    ps=c.prepareStatement("UPDATE CAND_PROFILE SET VERIFIED=? where CAND_LOG_ID=?");
    ps.setInt(1, 1);
    ps.setString(2, cid);
    int i=ps.executeUpdate();
    if(i>0) c.commit();
    else c.rollback();

    //response.sendRedirect("veruser.jsp");

    %>

    
    
    </body>
</html>
