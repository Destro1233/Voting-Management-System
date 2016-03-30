<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
    
<html>
<head>
<title>EPOLL</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src='themes/admin/scripts/gen_validatorv5.js' type='text/javascript'></script>
<script src='themes/admin/scripts/sfm_moveable_popup.js' type='text/javascript'></script>

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
    <center>
<div id='login_errorloc' class='error_strings' style=''></div>
<form name="login" method="post" action="admin_log_chk.jsp" autocomplete="off">
    <table border="0" align="center" width="400" >
	<tbody>
		<tr>
			<td height="37" colspan="2">
			<center>LOGIN</center>
			</td>
		</tr>
		<tr>
			<td height="45" width="174">ENTER USERID:</td>
			<td height="45" width="228"><input type="text" name="id"
				size="20"></td>
		</tr>
		<tr>
			<td height="36" width="174">ENTER PASSWORD:</td>
			<td height="36" width="228"><input type="password"
				name="passwordtxt" size="20"></td>
		</tr>
		<tr>
			<td height="71" colspan="2">
			<center><input type="SUBMIT" name="SUBMIT" value="LOGIN"></center>
			</td>
		</tr>
	</tbody>
</table>
    </form>
    <script type='text/javascript'>
// <![CDATA[
var loginValidator = new Validator("login");

loginValidator.EnableOnPageErrorDisplay();
loginValidator.SetMessageDisplayPos("right");

loginValidator.EnableMsgsTogether();
loginValidator.addValidation("id","req","Please fill in id");
loginValidator.addValidation("id","alnum","The input for id should be a valid alpha-numeric value");
loginValidator.addValidation("id","maxlen=40","The length of the input for id should not exceed 40");
loginValidator.addValidation("passwordtxt","req","Please fill in passwordtxt");
loginValidator.addValidation("passwordtxt","alnum","The input for passwordtxt should be a valid alpha-numeric value");
loginValidator.addValidation("passwordtxt","minlen=4","The length of the input for passwordtxt should be at least 4.");

// ]]>
</script>


</center>


</body>
</html>
