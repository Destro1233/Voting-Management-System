

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page  import="user.CandDetails,java.sql.*,javax.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! public String uname; public int nRows; %>
        <%
        Connection c=null;
        PreparedStatement ps=null;
        Statement st=null;
        ResultSet rs=null;

        try
        {
        c=db.DatabaseConnection.dbConnect("XE");
        st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        rs=st.executeQuery("select * from user_profile");

       rs.last();
        nRows=rs.getRow();
       rs.relative(-nRows);


        %>
        
        <table border="1" cellpadding="5" cellspacing="0">
           <tr><th>Name</th> </tr>
           <% 
              while(rs.next())
               {
                uname=rs.getString(1);
               
             %>
             <tr>
                 <td>
                     <%=uname %>
                 </td>
             </tr>
             <%
             }
             }
        finally
                {
            rs.close();
            c.close();

            }
             %>
        </table>
    </body>
</html>
