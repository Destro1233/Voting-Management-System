<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page  session="false" import="java.sql.*"  errorPage="../err.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
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
        
        ResultSet rs=null;
        
        String fname,mname,lname,name;
        String address;
        String city;
        String state;
        String status;
        Long pin;
        String imageName=null;
        String imagepath="../images/profile/user/";
        String id;

    %>
    <%
         id=request.getParameter("id");
         //    id="gyanesh19@gmail.com" ;
     try
                 {
          c=db.DatabaseConnection.dbConnect("XE");
         
          ps=c.prepareStatement("SELECT USER_FNAME,USER_MNAME,USER_LNAME,USER_ADDRESS,USER_CITY,USER_STATE,USER_PIN,USER_PHOTO FROM USER_PROFILE WHERE USER_LOG_ID=?");
          ps.setString(1, id);
          rs=ps.executeQuery();
          if(rs.next())
            {
             fname=rs.getString("USER_FNAME");
             mname=rs.getString("USER_MNAME");
             lname=rs.getString("USER_LNAME");
             address=rs.getString("USER_ADDRESS");
             city=rs.getString("USER_CITY");
             state=rs.getString("USER_STATE");
             pin=rs.getLong("USER_PIN");
             imagepath=imagepath+rs.getString("USER_PHOTO");

             if(mname==null)
                    {
                      name= fname+" "+lname;
                    }
                 else
                    {
                       name=fname+" "+mname+" "+lname;
                     }
             System.out.println(fname+address+lname);
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
    <h1><CENTER> User Details</CENTER> </h1>
    
    <table width="500"  border="1" cellspacing="0" cellpadding="5" align="center" >
  <tr>
    <th scope="row">PHOTOGRAPH</th>
    <td><img src="<%= imagepath%>" width="100" height="100" alt="Saurabh"/>
        
    </td>
  </tr>
  <tr>
    <th scope="row">NAME</th>
    <td> <%=fname%></td>
  </tr>
  <tr>
    <th scope="row">ADDRESS</th>
    <td><%=address%></td>
  </tr>
  <tr>
    <th scope="row">CITY</th>
    <td ><%=city%></td>
  </tr>
  <tr>
    <th scope="row">STATE</th>
    <td style="overflow:auto ;display:block ;float:none; max-height:200px;"><%=state%></td>
  </tr>
  <tr>
    <th scope="row">PIN</th>
    <td style="overflow:auto ;display:block ;float:none; max-height:200px;"><%=pin%></td>
  </tr>
 

</table>

    <% imagepath="../images/profile/user/"; %>
    
    </body>
</html>
