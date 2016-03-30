<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page  import="db.DatabaseConnection" %>
<%@page  errorPage="../err.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        <%! HttpSession session; 
        String userAdminId,cid;
        Connection c=null;
        PreparedStatement ps=null;
        PreparedStatement ps1=null;
        Long totalVote=0L;
        PreparedStatement ps2=null;
        PreparedStatement ps3=null;
        ResultSet rs=null;
        ResultSet rs1=null;
        %>
    <%
    session=request.getSession(false);
    if(session==null)
        {
        response.sendRedirect("../main_login.jsp");
        }
    else
        {
          session=request.getSession();

try{
             cid=request.getParameter("selected_vote");
             userAdminId=(String)session.getAttribute("userAdminId");
             //out.println(cid +" -"+userAdminId);
             c=DatabaseConnection.dbConnect("XE");
             c.setAutoCommit(false);
             
             //fetching total vote
             ps=c.prepareStatement("SELECT CAND_TOTAL_VOTE FROM CAND_REGIONAL_STATUS where CAND_LOG_ID_REGSTR=?");
             ps.setString(1,cid);
             rs=ps.executeQuery();
             if(rs.next())
             {
             totalVote=rs.getLong("CAND_TOTAL_VOTE");
             }

             
             ps1=c.prepareStatement("INSERT INTO VOTING VALUES(?,?,?)");
             ps1.setString(1,userAdminId);
             ps1.setString(2,cid);
             ps1.setString(3,VotingYear.VotingDate.getYear());



             ps2=c.prepareStatement("UPDATE CAND_REGIONAL_STATUS SET CAND_TOTAL_VOTE=? where CAND_LOG_ID_REGSTR=?");
             ps2.setLong(1,totalVote+1);
             ps2.setString(2,cid);
             int x,y;
             x=ps1.executeUpdate();
             y=ps2.executeUpdate();
             if(x >0 & y >0) c.commit();
             else
                 c.rollback();

    }
 


catch(SQLException e)
{
    e.printStackTrace();
}
catch(Exception e1)
{
    e1.printStackTrace();
}
finally
        {
    rs.close();
    ps.close();
    ps1.close();
    ps2.close();
    c.close();
   

    }
}
%>
<center>
 <%="<H1>YOU HAVE SUCESSFULLY CASTED THE VOTE </H1>" %><br><br>
 <a  href="home.jsp"> <h3> Go to home page </h3> </a>
    
    </center>
    
    </body>
</html>
