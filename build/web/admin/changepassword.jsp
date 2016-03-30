<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="../err.jsp" %>
<%@page session="false" %>
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
<%! HttpSession session; String id; %>
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

<body>



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
    <td align="CENTER">
    <form method="get" action="change_password.jsp">
<table border="0" align="center" width="250" align="center" >
	<tbody>
		
		<tr>
			<td height="45" width="100"> USERID:</td>
			<td height="45" width="228">
                <h3><%=id %></h3>
            </td>
		</tr>
		<tr>
			<td height="36" width="100"> PASSWORD:</td>
			<td height="36" width="228"><input type="password"
				name="pwd" size="20"></td>
		</tr>
		<tr>
			<td height="71" colspan="2">
			<center><input type="SUBMIT" name="SUBMIT" value="CHANGE PASSWORD"></center>
			</td>
		</tr>
	</tbody>
</table>
    </form>


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
