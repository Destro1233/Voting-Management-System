<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
    <%@page errorPage="/err.jsp" session="false"%>
    
    
<html>
<head>
<title>EPOLL</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<style type="text/css">
<!--
.style1 {color: #0000CC}
.style2 {color: #0000FF}
.style4 {color: #0000FF; font-family: Arial, Helvetica, sans-serif; }
td{
    text-align:left;
    vertical-align:middle;
    color: #0000FF;
    }

-->
</style>
<script src='themes/user_profile/scripts/gen_validatorv5.js' type='text/javascript'></script>
<script src='themes/user_profile/scripts/sfm_moveable_popup.js' type='text/javascript'></script>
<script language="javascript" type="text/javascript">

function popitup(url) {
	newwindow=window.open(url,'name','height=400,width=500');
	if (window.focus) {newwindow.focus()}
	return false;
}


</script>

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
<body>
    

<div id='user_errorloc' class='error_strings' style=''></div>
<form name="user" method="post"   action="user_reg_chk.jsp" autocomplete="off">
<center>
<table width="48%" border="0" align="center" cellpadding="3" cellspacing="4">
	<tbody>
		<tr>
                    <td colspan="2"><img alt="logo"  src="images/logo.jpg" width="621" height="155"></td>
	    </tr>
		<tr align="right">
		  <td colspan="2" style="text-align:right"><a href="index.jsp">HOME | </a><a href="help.jsp" onclick="return popitup('helpnew.html')">HELP</a></td>
	    </tr>
		<tr>
		  <td colspan="2"><h2><span class="style4">REGISTER YOUR DETAILS HERE: </span></h2></td>
	    </tr>
		<tr>
			<td width="96"><span class="style1">NAME:</span></td>
			<td width="416">
			<table border="0" cellspacing="3" width="100%">
				<tbody>
					<tr>
					<td></td>
					</tr>
				     <tr>
					   <td width="90" height="24"><input type="text" name="fname" size="15"
							maxlength="18"></td>
						<td width="91"><input type="text" name="mname" size="15"
							maxlength="7"></td>
						<td width="314"><input name="lname" type="text" size="15" maxlength="10"></td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td width="96"><span class="style2">LOGIN ID:</span></td>
			<td width="416">
			<table width="97%" border="0" cellspacing="5">
				<tbody>
					<tr>
						
					  <td width="459" colspan="2"><input name="id" type="text" value="" size="20"></td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td width="96"><span class="style2">GENDER:</span></td>
			<td width="416"><select size="0" name="gender">
              <option selected>M</option>
              <option>F</option>
            </select></td>
		</tr>
		<tr>
			<td width="96"><span class="style2">DATE OF BIRTH:</span></td>
		  <td width="416">
			<select name="date" size="1">
                <%! int i;%>
			  
			  <% for( i=1;i<=31;i++) {%>
              <option><%=i%></option>
			  <% } %>
			  </select>
            <select name="month" size="1">
              <% for( i=1;i<=12;i++) {%>
              <option><%=i%></option>
			  <% } %>
            </select>	
            <select name="year" size="0">
                <% for( i=1930;i<=(Integer.parseInt(VotingYear.VotingDate.getYear())-18);i++) {%>
              <option><%=i%></option>
			  <% } %>
            </select>
</td>
		</tr>
		<tr>
			<td width="96"><span class="style2">FATHER'S NAME:</span></td>
			<td width="416">
			<table width="100%" cellspacing="5">
				<tbody>
					<tr>
					  <td><input name="ffname" type="text" size="15" maxlength="18"> <input name="fmname" type="text" size="15" maxlength="18"> <input name="flname" type="text" size="15" maxlength="18"></td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td width="96"><span class="style2">ADDRESS:</span></td>
                        <td width="416"><textarea rows="10"  name="address" cols="40"></textarea></td>
		</tr>
		<tr>
		  <td><span class="style2">PIN CODE: </span></td>
		  <td><input name="pin" type="text" size="15" maxlength="18"></td>
	    </tr>
		<tr>
			<td width="96"><span class="style2">CITY:</span></td>
			<td width="416"><select name="city">
			  <option>Delhi</option>
			  <option>Mumbai</option>
			</select></td>
		</tr>
		<tr>
			<td width="96"><span class="style2">STATE:</span></td>
			<td width="416"><select name="state" size="0">
			  <option>Delhi</option>
			  <option>Andhra Pradesh</option>
                          <option>Arunachal Pradesh</option>
                          <option>Assam</option>
                          <option>Bihar</option>
                          <option>Chandigarh</option>
                          <option>Goa</option>
                          <option>Gujarat</option>
                          <option>Haryana</option>
                          <option>Himachal Pradesh</option>
                          <option>Jharkhand</option>
                          <option>Karnataka</option>
                          <option>Kerala</option>
                          <option>Madhya Pradesh</option>
                          <option>Maharashtra</option>
                          <option>Pondichery</option>
                          <option>Punjab</option>
                          <option>Rajasthan</option>
                          <option>Tamil Nadu</option>
                          <option>West Bengal</option>
			</select></td>
		</tr>
		<tr>
			<td width="96"><span class="style2">VOTER ID:</span></td>
			<td width="416"><input type="text" name="vid"
				maxlength="35"></td>
		</tr>
		
		<tr>
		  <td colspan="2">
			<table width="100%">
				<tbody>
					<tr>
					  <td><span class="style2">STATUS:</span></td>
					  <td><select name="status">
					    <option>Unmarried</option>
					    <option>Married</option>
					   
				      </select> </td>
					  <td width="5"></td>
				  </tr>
					<tr>
						<td width="110"></td>
						<td width="490"><input type="submit" name="submit"
							value="SUBMIT" onclick=verify("user")></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
	</tbody>
</table>
</center>

</form>
<script type='text/javascript'>
// <![CDATA[
var userValidator = new Validator("user");

userValidator.EnableOnPageErrorDisplay();
userValidator.SetMessageDisplayPos("right");

userValidator.EnableMsgsTogether();
userValidator.addValidation("fname","req","Please fill in fname");
userValidator.addValidation("fname","alpha","The input for fname should be a valid alphabetic value");
userValidator.addValidation("fname","maxlen=40","The length of the input for fname should not exceed 40");
userValidator.addValidation("mname","alpha","The input for mname should be a valid alphabetic value");
userValidator.addValidation("mname","maxlen=30","The length of the input for mname should not exceed 30");
userValidator.addValidation("lname","req","Please fill in lname");
userValidator.addValidation("lname","alpha","The input for lname should be a valid alphabetic value");
userValidator.addValidation("lname","maxlen=40","The length of the input for lname should not exceed 40");
userValidator.addValidation("id","req","Please fill in id");
userValidator.addValidation("id","email","The input for id should be a valid email value");
userValidator.addValidation("id","maxlen=40","The length of the input for id should not exceed 40");
userValidator.addValidation("ffname","req","Please fill in ffname");
userValidator.addValidation("ffname","alpha","The input for ffname should be a valid alphabetic value");
userValidator.addValidation("ffname","maxlen=40","The length of the input for ffname should not exceed 40");
userValidator.addValidation("fmname","alpha","The input for fmname should be a valid alphabetic value");
userValidator.addValidation("fmname","maxlen=30","The length of the input for fmname should not exceed 30");
userValidator.addValidation("flname","req","Please fill in flname");
userValidator.addValidation("flname","alpha","The input for flname should be a valid alphabetic value");
userValidator.addValidation("flname","maxlen=40","The length of the input for flname should not exceed 40");
userValidator.addValidation("address","req","Please fill in address");
userValidator.addValidation("address","maxlen=50","The length of the input for address should not exceed 50");
userValidator.addValidation("address","regexp=^[^!@#\\$%\\^\\*\\(\\)\\{\\}\\[\\]]*$","Please enter a valid input for address");
userValidator.addValidation("pin","req","Please fill in pin");
userValidator.addValidation("pin","numeric","The input for pin should be a valid numeric value");
userValidator.addValidation("pin","maxlen=6","The length of the input for pin should not exceed 6");
userValidator.addValidation("vid","req","Please fill in vid");
userValidator.addValidation("vid","alnum","The input for vid should be a valid alpha-numeric value");
userValidator.addValidation("vid","maxlen=40","The length of the input for vid should not exceed 40");

// ]]>
</script>

</body>
</html>
