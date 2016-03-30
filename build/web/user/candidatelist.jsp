
<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@page  session="false"  import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- TemplateBeginEditable name="doctitle" -->
<title>EPOLL</title>
<!-- TemplateEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->

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
        <SCRIPT type="text/javascript">
   window.history.forward();
    function noBack() { window.history.forward(); }
    function PopupCenter(pageURL, title,w,h) {
var left = (screen.width/2)-(w/2);
var top = (screen.height/2)-(h/2);
var targetWin = window.open (pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
}

</SCRIPT>

<jsp:useBean id="usr" scope="page" class="user.ProfileData"  />
</head>

<body onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
     


<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:25%;"> <jsp:include page="user_left_panel.html"  flush="true"/></td>
    <td style="width:50%;" class="alignment">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr class="alignment">
    <td class="alignment"><jsp:include  page="header.html" flush="true"/> </td>
  </tr>
  <tr>
    <td class="alignment"> <jsp:include  page="user_menu.html" flush="true"/></td>
  </tr>
  <tr>
    <td style="overflow:auto ;display:block ;float:none; max-height:500px;padding-top:20px;" align="center" >
<%! public String uname,cid; public int nRows;
    public String fname,mname,lname,name;
    public String party;
    public String urlLink;
    public String state="Delhi";

%>
        <%
        Connection c=null;
        PreparedStatement ps=null;
        Statement st=null;
        ResultSet rs=null;

        try
        {
        c=db.DatabaseConnection.dbConnect("XE");

        ps=c.prepareStatement("select CAND_LOG_ID,CAND_FNAME,CAND_MNAME,CAND_LNAME,POL_NAME from CAND_PROFILE where CAND_STATE=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
         ps.setString(1, state);
        //st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        //rs=st.executeQuery("select * from user_profile");
         rs=ps.executeQuery();

       rs.last();
        nRows=rs.getRow();
       rs.relative(-nRows);


        %>

        <table border="1" cellpadding="5" cellspacing="0" align="center">
           <tr><th>NAME</th> <th>PARTY</th><th>DETAILS</th></tr>
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
                     <a href="javascript:void(0);" onclick="PopupCenter('moredetails.jsp?id=<%=cid %>', 'Candidate details',575,500);">MORE DETAILS</a>
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
        
        </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


	</td>
    <td style="width:25%;"><jsp:include page="user_right_panel.html"  page="true"/> </td>
  </tr>
</table>

</body>
</html>
