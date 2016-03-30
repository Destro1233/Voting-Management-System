<html>
<head>
<title>Error Page </title>
<style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body>
<%@page isErrorPage="true" import="java.io.*"%>
<table width="300%" border="0" align="center">
  <tr>
    <td><span class="style1">Extremly sorry for the in availability of the requested page</span></td>
  </tr>
  <tr>
    <td>  <%=exception%>
</td>
  </tr>
</table>



</body>
</html>