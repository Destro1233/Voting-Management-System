<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@page  session="false" %>
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
<jsp:useBean id="usr" scope="page" class="user.ProfileData"  />
<%! HttpSession session; %>
        <%
        session=request.getSession(false);
        if(session==null)
            {
            response.sendRedirect("../index.jsp");
            }
     else
       {
            session=request.getSession();



        }
        %>
<script type="text/javascript">

    function PopupCenter(pageURL, title,w,h) {
var left = (screen.width/2)-(w/2);
var top = (screen.height/2)-(h/2);
var targetWin = window.open (pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
}
</script>
<script src='../themes/user_profile/scripts/votelogin/scripts/gen_validatorv5.js' type='text/javascript'></script>
<script src='../themes/user_profile/scripts/votelogin/scripts/sfm_moveable_popup.js' type='text/javascript'></script>


<style type='text/css'>
.error_strings
{
    font-family:Verdana;
    font-size:10px;
    color:#660000;
}
.sfm_float_error_box
{
    position:absolute;
    z-index:999;
    cursor:default;
    font-family:Verdana;
    font-size:10px;
    color:#660000;
    background-color:#ffff66;
    border-style:solid;
    border-width:1px;
    border-color:#660000;
}
.sfm_float_box_td
{
    padding:3px;
    cursor:default;
    font-family:Verdana;
    font-size:10px;
    color:#660000;
    background-color:#ffff66;
}
.sfm_close_box
{
    font-family:Verdana;
    font-size:10px;
    font-weight:bold;
    color:#ffffff;
    background-color:#660000;
    border-width:0px;
    text-align:center;
}
.sfm_cr_box
{
    font-family:Verdana;
    font-size:10px;
    color:#888888;
    border-style:solid;
    border-width:0px;
    border-color:#660000;
}
.sfm_cr_box a
{
    color:#888888;
}
</style>
</head>

<body style=" color:blue;">



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
    <td>&nbsp;
    <div id='form1_errorloc' class='error_strings' style=''></div>
<form name="form1" method="post" action="LoginChk.jsp" autocomplete="off">
<center>
  
  <table border="0" class="login_table">
	<tbody>
		<tr>
			<td colspan="2" height="42">
			<center class="style1">LOGIN TO VOTE:</center>
			</td>
		</tr>
		<tr>
			<td height="64" width="162"><span class="style1">USERNAME:</span></td>
			<td height="64" width="287"><input type="text"
				name="uname" size="20"></td>
		</tr>
		<tr>
			<td width="162" height="41"><span class="style1"> PASSWORD:</span></td>
			<td height="41" width="287"><input type="password"
				name="password" size="20"></td>
		</tr>
		
		<tr align="center">
<td height="76" colspan="2">
		      <input type="submit" name="Submit" value="Submit">
	      <a href="javascript:void(0);" onclick="PopupCenter('recoverpassword.jsp', 'PASSWORD RECOVERY',400,400);">FORGOT PASSWORD</a>       </td>
		</tr>
	</tbody>
</table>

<%
session=request.getSession(false);
if(session==null){out.println("");}
else
{
    session = request.getSession();
String status=(String)session.getAttribute("status");
if(status!=null) out.println(status);

}
%>
</center>
</form>
<script type='text/javascript'>
// <![CDATA[
var form1Validator = new Validator("form1");

form1Validator.EnableOnPageErrorDisplay();
form1Validator.SetMessageDisplayPos("right");

form1Validator.EnableMsgsTogether();
form1Validator.addValidation("uname","req","Please fill in uname");
form1Validator.addValidation("uname","maxlen=40","The length of the input for uname should not exceed 40");
form1Validator.addValidation("password","req","Please fill in password");
form1Validator.addValidation("password","maxlen=40","The length of the input for password should not exceed 40");
form1Validator.addValidation("password","minlen=4","The length of the input for password should be at least 4.");

// ]]>
</script>

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
