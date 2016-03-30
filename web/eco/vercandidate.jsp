<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
    <style>

body
        {

            margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
        }
        table
        {

            margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
        }
        .alignment
        {
            text-align:left;
	vertical-align:top;

         }


</style>
<SCRIPT type="text/javascript">
   window.history.forward();
    function noBack() { window.history.forward(); }
    function PopupCenter(pageURL, title,w,h) {
var left = (screen.width/2)-(w/2);
var top = (screen.height/2)-(h/2);
var targetWin = window.open (pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
}

</SCRIPT>

<%! HttpSession session; %>
     <%
        session=request.getSession(false);
        if(session==null)
            {
            response.sendRedirect("../main_login.jsp");
            }
     else
       {
            session=request.getSession();



        }
        %>


</head>

<body>


<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:25%;"> <jsp:include page="eco_left_panel.html" /></td>
    <td style="width:50%;" class="alignment">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr class="alignment">
    <td class="alignment"><jsp:include  page="header.html"/> </td>
  </tr>
  <tr>
    <td class="alignment"> <jsp:include  page="eco_menu.html"/></td>
  </tr>
  <tr>
    <td align="center">&nbsp;
    <%! public String uname,cid; public int nRows;
    public String fname,mname,lname,name;
    public String party;
    public String urlLink;
    public String state="Delhi";

%>
        <%
        Connection c=null;
        PreparedStatement ps=null;
        ResultSet rs=null;

        try
        {
        c=db.DatabaseConnection.dbConnect("XE");

        ps=c.prepareStatement("select CAND_LOG_ID,CAND_FNAME,CAND_MNAME,CAND_LNAME,POL_NAME from CAND_PROFILE where CAND_STATE=? AND VERIFIED=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
         ps.setString(1, state);
         ps.setInt(2, 0);
        //st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        //rs=st.executeQuery("select * from user_profile");
         rs=ps.executeQuery();

       rs.last();
        nRows=rs.getRow();
       rs.relative(-nRows);


        %>

        <table border="1" cellpadding="5" cellspacing="0" align="center">
           <tr><th>NAME</th> <th>PARTY</th><th>DETAILS</th> <th>ACCEPT</th> <th>REJECT</th></tr>
           <%
              while(rs.next())
               {
                cid=rs.getString("CAND_LOG_ID");
                fname=rs.getString("CAND_FNAME");
                mname=rs.getString("CAND_MNAME");
                lname=rs.getString("CAND_LNAME");
                party=rs.getString("POL_NAME");
                if(mname==null)
                    {
                    name=fname+" "+lname;
                    }
                else
                    {
                    name=fname+" "+mname+" "+lname;
                    }

             %>
             <tr>
                 <td>
                     <%=name %>
                 </td>
                 <td>
                     <%=party %>
                 </td>
                 <td>
                     <a href="javascript:void(0);" onclick="PopupCenter('cmoredetails.jsp?cid=<%=cid %>', 'Candidate details',575,500);">MORE DETAILS</a>
                 </td>
                 <td>
                     <a href="javascript:void(0);" onclick="PopupCenter('accand.jsp?cid=<%=cid %>', 'ACCEPT',575,500);">ACCEPT</a>
                 </td>
                 <td>
                     <a href="javascript:void(0);" onclick="PopupCenter('rejcand.jsp?cid=<%=cid %>', 'REJECT',575,500);">REJECT</a>
                 </td>
             </tr>
             <%
             }
             }
        finally
                {
            rs.close();
            ps.close();
            c.close();
            rs=null;
            ps=null;
            c=null;

            }
             %>
        </table>


    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


	</td>
    <td style="width:25%;"><jsp:include page="eco_right_panel.html"  page="true"/> </td>
  </tr>
</table>

</body>
</html>
