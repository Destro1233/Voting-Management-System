<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/themes/general/menu.css"
	type="text/css">
<script language="JavaScript"
	src="${pageContext.request.contextPath}/themes/general/jquery.js"></script>
<script language="JavaScript"
	src="${pageContext.request.contextPath}/themes/general/menu.js"></script>
    <style>
        body {
font-family: Optima, "Optima ExtraBlack";

margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
}
        .alignment
        {
            text-align:right;
	vertical-align:top;

         }
        .style1 {
	color: #125460;
	
}
.menu_background {

	background-image: url('images/menu_background.gif');
	

}

       table
        {

            margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
        }
    </style>

</head>

<body >
<table width="100%"  border="0" cellspacing="0" cellpadding="0" >
  <tr>
      <td width="25%"> <jsp:include page="leftpanel.html"  flush="true"/> </td>
    <td width="50%" class="alignment">
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
        <tr class="alignment">
            <td class="alignment" height="200"> <jsp:include page="header_logo.html" flush="true"/></td>
        </tr>
        <tr   align="left" valign="top" >
            <td  align="left" valign="top" > <jsp:include  page="main_menu.html" flush="true"/></td>
        </tr>
        <tr>
          <td  >content</td>
        </tr>
        <tr>
            <td  align="center" valign="bottom"><jsp:include  page="main_footer.html" flush="true"/></td>
        </tr>
      </table>
	</td>
    <td width="25%"><jsp:include  page="rightpanel.html" flush="true"/> </td>
  </tr>
</table>

</body>
</html>
