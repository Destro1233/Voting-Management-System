<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
    <%@page session="false" errorPage="err.jsp" %>
<html>
<head>
<title>EPOLL</title>


<style type="text/css">
<!--
.style1 {color: #0000FF}
-->
table
        {

            margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
        }

        body
        {

            margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
        }
</style>
<SCRIPT TYPE="text/javascript">
function PopupCenter(pageURL, title,w,h) {
var left = (screen.width/2)-(w/2);
var top = (screen.height/2)-(h/2);
var targetWin = window.open (pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
}
</SCRIPT>
<script src='themes/login/scripts/gen_validatorv5.js' type='text/javascript'></script>
<script src='themes/login/scripts/sfm_moveable_popup.js' type='text/javascript'></script>

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
<body style=" color:blue;" >
<div id='form1_errorloc' class='error_strings' style=''></div>

<form name="form1" method="post" action="LoginChk.jsp" autocomplete="off">
<center>
  <img src="images/logo.jpg" width="450" height="152">
  <table border="0" class="login_table" width="450" height="450">
	<tbody>
		<tr>
			<td colspan="2" height="42">
			<center class="style1">LOGIN:</center>
            <br>
                <%!HttpSession session;String status; %>
<%
session=request.getSession(false);
if(session==null){status="";}
else
{
  session = request.getSession();
  
 status=(String)session.getAttribute("err");
 if(status!=null){
 out.println("<center><h3>"+status+"</h3></center>");
}
}
%>
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
		<tr>
		  <td height="41">&nbsp;</td>
		  <td height="41"><p>
		    <select name="profile" id="profile">
		    <option value="1">user</option>
		    <option value="2">candidate</option>
		    <option value="3">eco</option>
		    </select>
	      </p></td>
	    </tr>
		<tr align="center">
<td height="76" colspan="2">
		      <input type="submit" name="Submit" value="Submit" javascript:self.close();>
	      <a href="javascript:void(0);" onclick="PopupCenter('recoverpassword.jsp', 'PASSWORD RECOVERY',400,400);">FORGOT PASSWORD</a>        </td>
		</tr>
	</tbody>
</table>

</center>
</form>

<script type='text/javascript'>
// <![CDATA[
var form1Validator = new Validator("form1");

form1Validator.EnableOnPageErrorDisplay();
form1Validator.SetMessageDisplayPos("right");

form1Validator.EnableMsgsTogether();
form1Validator.addValidation("uname","req","Please fill in uname");
form1Validator.addValidation("uname","email","The input for uname should be a valid email value");
form1Validator.addValidation("uname","maxlen=30","The length of the input for uname should not exceed 30");
form1Validator.addValidation("password","req","Please fill in password");
form1Validator.addValidation("password","alnum","The input for password should be a valid alpha-numeric value");
form1Validator.addValidation("password","minlen=4","The length of the input for password should be at least 4.");

// ]]>
</script>




</body>
</html>