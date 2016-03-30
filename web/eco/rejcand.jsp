<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<%@page errorPage="../err.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%! HttpSession session; %>
    <%
   /* session= request.getSession(false);
 if(session==null)
     {
     
     response.sendRedirect("../main_login.jsp");

     }
 else
     {
     session=request.getSession();
     }
  */
    %>
    <%!
        Connection c=null;
        PreparedStatement ps=null;
        PreparedStatement ps1=null;
        PreparedStatement ps2=null;
        PreparedStatement ps3=null;

         String id=null;

    %>
   
    <%
    id=request.getParameter("cid");
    c=db.DatabaseConnection.dbConnect("XE");
    c.setAutoCommit(false);
    ps=c.prepareStatement("DELETE FROM CAND_PROFILE where CAND_LOG_ID=?");
    ps.setString(1, id);
    ps1=c.prepareStatement("DELETE FROM C_LOGIN where CAND_LOG_ID=?");
    ps1.setString(1, id);
    ps2=c.prepareStatement("DELETE FROM CAND_REGIONAL_STATUS where CAND_LOG_ID_REGSTR=?");
    ps2.setString(1, id);
    ps3=c.prepareStatement("DELETE FROM CAND_RECORD where CAND_LOG_ID=?");
    ps3.setString(1, id);
    int i=ps2.executeUpdate();
    int j=ps1.executeUpdate();
    int k=ps.executeUpdate();
    int l= ps3.executeUpdate();


    if(i>0 & j>0 & k>0 & l>0){ c.commit(); out.println("<H1>CANDIDATE REJECTED SUCESSFULLY</H1>");}
    else{ c.rollback(); out.println("<H1>CANDIDATE  WAS NOT REJECTED SUCESSFULLY</H1>");}
    //response.sendRedirect("vercandidate.jsp");

    %>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> EPOLL</title>
    </head>
    <body>
    
      


    
    
    
    </body>
</html>
