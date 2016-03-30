<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
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
  <%@page  session="false" %>

<%! HttpSession session; String uid; %>
        <%
        session=request.getSession(false);
        if(session==null)
            {
            response.sendRedirect("../login.jsp");
            }
     else
       {
            session=request.getSession();
            uid=(String)session.getAttribute("id");

            

       }
        %>


</head>

<body>



<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:25%;"> <jsp:include page="admin_left_panel.html"  flush="true"/></td>
    <td style="width:50%;" class="alignment">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr class="alignment">
    <td class="alignment"><jsp:include  page="header.html" flush="true"/> </td>
  </tr>
  <tr class="alignment">
    <td class="alignment"> <jsp:include  page="admin_menu.html" flush="true"/></td>
  </tr>
  <tr>
    <td style="color:blue">Welcome Admin
        <center> <img src="../images/welcome1.gif" width="298" height="299" alt="welcome1"/>
        </center>
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
