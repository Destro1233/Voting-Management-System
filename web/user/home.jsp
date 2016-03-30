<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@page  session="false"  %>
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
.lwidth
{
width:30%;
}
.rwidth
{
width:70%
}
.tcolor
{
color:#0000FF;
}
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

<jsp:useBean id="usr"  class="user.ProfileData"   scope="page" />

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
            //session.setAttribute("userid","tester@gmail.com" );
            usr.setdata((String)(session.getAttribute("uid")));
            usr.getdata();
       //out.println("Welcome " + session.getAttribute("uid"));
       

       }
        %>
        <SCRIPT type="text/javascript">
   window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
    
</head>

<body oncontextmenu="return false;" onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
     

<table width="100%"  border="0" cellspacing="0" cellpadding="0" >
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
    <td>
        <br><br>
        <table width="90%" border="1" class="tcolor" align="center" >

  <tr>
    <td>welcome</td>
    <td class="rwidth">&nbsp; <%=usr.getFname()+" "+usr.getLname() %></td>
  </tr>
  <tr>
    <td>voter id </td>
    <td class="rwidth">&nbsp;<%=usr.getVid() %></td>
  </tr>
  <tr>
    <td class="lwidth">Date of birth </td>
    <td class="rwidth"><%=usr.getDate()%></td>
  </tr>
  <tr>
    <td class="lwidth">Father's Name </td>
    <td class="rwidth">&nbsp;<%=usr.getFfname() +" "+usr.getFlname()  %></td>
  </tr>
  <tr>
    <td class="lwidth">Address</td>
    <td class="rwidth">&nbsp; <%=usr.getAddress() %></td>
  </tr>
  <tr>
    <td class="lwidth">Status</td>
    <td class="rwidth">&nbsp;<%=usr.getStatus() %></td>
  </tr>
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
