<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
        <style>
        .alignment
        {
            text-align:left;
	vertical-align:top;

         }
         .style1 {
	color: #000099;
	font-family: Arial, Helvetica, sans-serif;
}
table
        {

            margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
        }
            </style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/themes/general/menu.css"
	type="text/css">
<script language="JavaScript"
	src="${pageContext.request.contextPath}/themes/general/jquery.js"></script>
<script language="JavaScript"
	src="${pageContext.request.contextPath}/themes/general/menu.js"></script>
    </head>
    <body onload="init();">
    <div id="loading" style="position:absolute; width:100%; text-align:center; top:300px;">
<img src="images/loading.gif" border=0></div>
<script>
 var ld=(document.all);
  var ns4=document.layers;
 var ns6=document.getElementById&&!document.all;
 var ie4=document.all;
  if (ns4)
 	ld=document.loading;
 else if (ns6)
 	ld=document.getElementById("loading").style;
 else if (ie4)
 	ld=document.all.loading.style;
  function init()
 {
 if(ns4){ld.visibility="hidden";}
 else if (ns6||ie4) ld.display="none";
 }

</script>


   <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td width="25%"> <jsp:include page="leftpanel.html"  flush="true"/> </td>
    <td width="50%" class="alignment">
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
        <tr class="alignment">
            <td class="alignment" height="200"> <jsp:include page="header.html" flush="true"/></td>
        </tr>
        <tr class="alignment">
            <td class="alignment"> <jsp:include  page="main_menu.html" flush="true"/></td>
        </tr>
        <tr>
            <td  > <jsp:include  page="polling_dates_sub.jsp" flush="true"/></td>
        </tr>
        <tr>
            <td  align="center" valign="bottom" style="height:200px;"><jsp:include  page="main_footer.html" flush="true"/></td>
        </tr>
      </table>
	</td>
    <td width="25%"><jsp:include  page="rightpanel.html" flush="true"/> </td>
  </tr>
</table>




    </body>
</html>
