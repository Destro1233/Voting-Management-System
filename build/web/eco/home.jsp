<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%@page  session="false" %>

<%! HttpSession session; String uid; %>
        <%
        session=request.getSession(false);
        if(session==null)
            {
            response.sendRedirect("../main_login.jsp");
            }
     else
       {
            session=request.getSession();
            uid=(String)session.getAttribute("uid");

            //session.setAttribute("userid","tester@gmail.com" );
            //usr.setdata((String)(session.getAttribute("uid")));
            //usr.getdata();
       //out.println("Welcome " + session.getAttribute("uid"));


       }
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
        <jsp:useBean id="eco" scope="page" class="eco.profiledata"/>
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

td{ color:#0000FF;border-color:#000000;}
</style>



</head>

<body>

<%eco.setdata(uid);%>
<%eco.getdata();%>
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
    <td align="center">
        <br>
            <br>
        <table width="60%" border="1" class="tcolor" align="center" >

  <tr>
    <td>welcome</td>
    <td class="rwidth">&nbsp; <%=eco.getFname() %></td>
  </tr>
  <tr>
    <td>voter id </td>
    <td class="rwidth">&nbsp;<%=eco.getVid() %></td>
  </tr>
  <tr>
    <td class="lwidth">Date of birth </td>
    <td class="rwidth">&nbsp;<%=eco.getDob() %></td>
  </tr>
  <tr>
    <td class="lwidth">Father's Name </td>
    <td class="rwidth">&nbsp;<%=eco.getFfname() +" "+eco.getFlname()  %></td>
  </tr>
  <tr>
    <td class="lwidth">Address</td>
    <td class="rwidth">&nbsp; <%=eco.getAddress() %></td>
  </tr>
  <tr>
    <td class="lwidth">Status</td>
    <td class="rwidth">&nbsp;<%=eco.getStatus() %></td>
  </tr>
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
