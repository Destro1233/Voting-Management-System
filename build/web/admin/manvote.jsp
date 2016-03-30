<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="../err.jsp" %>
<%@page  import="java.sql.*" %>
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
<%! HttpSession session; String id; Connection c =null;
    PreparedStatement ps=null;
    PreparedStatement ps1=null;
    PreparedStatement ps2=null;
    ResultSet rs=null;
    ResultSet rs1=null;
    int nRows;
    String states;
    int status;
%>
        <%
        session=request.getSession(false);
        if(session==null)
            {
            response.sendRedirect("../login.jsp");
            }
     else
       {
            session=request.getSession();
            id=(String)session.getAttribute("id");


        }
        %>
       

</head>

<body style=" color:blue;">



<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:25%;"> <jsp:include page="admin_left_panel.html"  flush="true"/></td>
    <td style="width:50%;" class="alignment">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr class="alignment">
    <td class="alignment"><jsp:include  page="header.html" flush="true"/> </td>
  </tr>
  <tr>
    <td class="alignment"> <jsp:include  page="admin_menu.html" flush="true"/></td>
  </tr>
  <tr>
    <td align="center">
        <%
        c=db.DatabaseConnection.dbConnect("XE");
        ps=c.prepareStatement("SELECT * FROM VOTING_STATUS",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        rs=ps.executeQuery();
        rs.last();
        nRows=rs.getRow();
       rs.relative(-nRows);
        %>
    
<br> <br>
    <form method="" action="manvote.jsp">
<table width="50%"  border="1" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="40%" >SELECT STATE</td>
    <td width="60%" >
        <select name="states" id="states" >
        <% while(rs.next())
            {
            states=rs.getString("STATE");
            status=rs.getInt("POLlING_STATUS");
            %>
            <option value="<%=states %>"> <%=states %></option>
            <%  } %>
            </select><INPUT type="submit" value="Go" name=chkstatus>
    </td>
  </tr>
  <%
  String start=request.getParameter("start");
  String stop = request.getParameter("stop");
  String chkstatus=request.getParameter("chkstatus");
  if(start==null && stop ==null && chkstatus==null){}
    else  {
  %>
  <tr>
      <td>
          CURRENT STATUS
      </td>
      <td>

<%           

               ps2=c.prepareStatement("SELECT POLLING_STATUS FROM VOTING_STATUS where STATE=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                ps2.setString(1,request.getParameter("states"));
                rs1=ps2.executeQuery();
                if(rs1.next()){
                int i=rs1.getInt("POLLING_STATUS");
                System.out.println(i);
                if(i==0) out.print("Polling Started");
                 else out.print("Polling Stopped");
                              }
    
%>
      </td>
  </tr>
  <% } %>
  <tr>
    <td align="center" collspan="1" ><input name="start" type="submit" value="START">
        <input name="stop" type="submit" value="STOP"></td>
  </tr>
</table>
</form>
<%
String startButton =request.getParameter("start");
String stopButton = request.getParameter("stop");
if(startButton!=null)
    {
    out.println("Start button. ");
    ps1=c.prepareStatement("UPDATE VOTING_STATUS SET POLLING_STATUS=1 where STATE=?");
    ps1.setString(1,request.getParameter("states"));
    System.out.println(request.getParameter("states"));
    ps1.executeUpdate();
    c.commit();
    out.println("Polling Started. ");
    Integer a = mail.VoteMail.MailAll(request.getParameter("states"));
    if (a==1)
        out.println("Mail Sent to everyone. ");
    else
        out.println("Error - Mail not sent.");

    }
else if(stopButton!=null)
    {
    out.println("Stop button");
    ps1=c.prepareStatement("UPDATE VOTING_STATUS SET POLLING_STATUS=0 where STATE=?");
    System.out.println(request.getParameter("states"));
    ps1.setString(1,request.getParameter("states"));
    ps1.executeUpdate();
    c.commit();
    out.println("Polling Stoped");

    }
%>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


	</td>
    <td style="width:25%;"><jsp:include page="admin_right_panel.html"  page="true"/> </td>
  </tr>
</table>

</body>
</html>
