<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page  session="false" import="java.sql.*"  errorPage="../err.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <STYLE>

            th{
                width:30%;
                text-align:left
                }
            td{
               width:70%;
               text-align:left;
               }
            }
        </STYLE>
    </head>
    <body text="#0033CC"">
    <%!
    Connection c=null;
        PreparedStatement ps=null;
        PreparedStatement ps1=null;
        Statement st=null;
        ResultSet rs=null;
        ResultSet rs1=null;
        String fname,mname,lname,name;
        String party;
        String promise;
        String socialwork;
        String qualification;
        String crime;
        String imageName=null;
        String imagepath="../images/profile/candidate/";
        String id;

    %>
    <%
         id= request.getParameter("id");
             try
                 {
          c=db.DatabaseConnection.dbConnect("XE");
          ps=c.prepareStatement("SELECT CAND_PROMISES,CAND_SOCIAL_WORK,CAND_QUAL,CAND_CRIME_RECORD FROM CAND_RECORD WHERE CAND_LOG_ID=?");
          ps.setString(1, id);
          rs=ps.executeQuery();
          if(rs.next())
            {
            
            promise=rs.getString("CAND_PROMISES");
            socialwork=rs.getString("CAND_SOCIAL_WORK");
            qualification=rs.getString("CAND_QUAL");
            crime=rs.getString("CAND_CRIME_RECORD");
            }
          ps1=c.prepareStatement("SELECT CAND_FNAME,CAND_MNAME,CAND_LNAME,POL_NAME,CAND_PHOTO FROM CAND_PROFILE WHERE CAND_LOG_ID=?");
          ps1.setString(1, id);
          rs1=ps1.executeQuery();
          if(rs1.next())
            {
             fname=rs1.getString("CAND_FNAME");
             mname=rs1.getString("CAND_MNAME");
             lname=rs1.getString("CAND_LNAME");
             party=rs1.getString("POL_NAME");
             imagepath=imagepath+rs1.getString("CAND_PHOTO");

             if(mname==null)
                    {
                      name= fname+" "+lname;
                    }
                 else
                    {
                       name=fname+" "+mname+" "+lname;
                     }
              }
 }
             catch(SQLException e)
                     {
                 e.getStackTrace();
                 }
         finally
                 {
             
             ps.close();
             rs.close();
             c.close();
             }

       %>
    <h1><CENTER> Candidate Details</CENTER> </h1>
    
    <table width="500"  border="1" cellspacing="0" cellpadding="5" align="center" >
  <tr>
    <th scope="row">PHOTOGRAPH</th>
    <td><img src="<%= imagepath%>" width="100" height="100" alt="<%=name %>"/>
        
    </td>
  </tr>
  <tr>
    <th scope="row">NAME</th>
    <td> <%=name %></td>
  </tr>
  <tr>
    <th scope="row">POLITICAL PARTY</th>
    <td><%=party %></td>
  </tr>
  <tr>
    <th scope="row">QUALIFICATION</th>
    <td ><%=qualification %></td>
  </tr>
  <tr>
    <th scope="row">PROMISE</th>
    <td style="overflow:auto ;display:block ;float:none; max-height:200px;"><%= promise%></td>
  </tr>
  <tr>
    <th scope="row">SOCIAL WORK</th>
    <td style="overflow:auto ;display:block ;float:none; max-height:200px;"><%=socialwork%></td>
  </tr>
  <tr>
    <th scope="row">CRIME RECORD</th>
    <td style="overflow:auto ;display:block ;float:none; max-height:200px;"><%= crime %></td>
  </tr>

</table>

    <% imagepath="../images/profile/candidate/"; %>
    
    </body>
</html>
