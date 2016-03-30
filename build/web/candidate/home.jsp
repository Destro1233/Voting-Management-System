<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="../err.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
      // out.println("Welcome " + session.getAttribute("uid"));


       }
        %>
<html>

<head>
<!-- TemplateBeginEditable name="doctitle" -->
<title>EPOLL</title>
<!-- TemplateEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
<jsp:useBean id="candidate" scope="page" class="candidate.profiledata"/>
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
td{text-align:left;color:#0000FF;border-color:#000000;}

</style>



</head>

<body>


<%candidate.setdata(uid);%>
<%candidate.getdata();%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:25%;"> <jsp:include page="candidate_left_panel.html"  flush="true"/></td>
    <td style="width:50%;" class="alignment">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr class="alignment">
    <td class="alignment"><jsp:include  page="header.html" flush="true"/> </td>
  </tr>
  <tr>
    <td class="alignment"> <jsp:include  page="candidate_menu.html" flush="true"/></td>
  </tr>
   <tr>
    <td>
        <center>
            <br> <br>
        <table width="80%" border="1" class="tcolor" align="center" >

  <tr>
    <td>welcome</td>
    <td class="rwidth">&nbsp; <%=candidate.getFname() %></td>
  </tr>
  
  <tr>
    <td>voter id </td>
    <td class="rwidth">&nbsp;<%=candidate.getVid() %></td>
  </tr>
  <tr>
    <td class="lwidth">Date of birth </td>
    <td class="rwidth">&nbsp;<%= candidate.getDob() %></td>
  </tr>
  <tr>
    <td class="lwidth">Father's Name </td>
    <td class="rwidth">&nbsp;<%= candidate.getFfname() +" "+candidate.getFlname()  %></td>
  </tr>
  <tr>
    <td class="lwidth">Address</td>
    <td class="rwidth">&nbsp; <%=candidate.getAddress() %></td>
  </tr>
  <tr>
    <td class="lwidth">Political Party Name</td>
    <td class="rwidth">&nbsp;<%=candidate.getPname() %></td>
  </tr>
</table>

</center>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


	</td>


    <td style="width:25%;"><jsp:include page="candidate_right_panel.html"  page="true"/> </td>
  </tr>
</table>

</body>
</html>
