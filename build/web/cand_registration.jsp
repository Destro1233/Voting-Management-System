<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>EPOLL</title>
<script src='themes/candidate_profile/scripts/gen_validatorv5.js' type='text/javascript'></script>
<script src='themes/candidate_profile/scripts/sfm_moveable_popup.js' type='text/javascript'></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<style type="text/css">
<!--
.style1 {color: #0000CC}
.style2 {color: #0000FF}
.style4 {color: #0000FF; font-family: Arial, Helvetica, sans-serif; }
-->
td {text-align:left; color:#0000FF;}
</style>
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
<script language="javascript" type="text/javascript">

function popitup(url) {
	newwindow=window.open(url,'name','height=400,width=500');
	if (window.focus) {newwindow.focus()}
	return false;
}


</script>

<script language="JavaScript"
	src="${pageContext.request.contextPath}/themes/candidate_profile/validatecandidate.js"></script>
</head>
<body>
<div id='candidate_errorloc' class='error_strings' style=''></div>
<form name="candidate" method="post" action="cand_reg_chk.jsp" autocomplete="off" >
<center>
<table width="48%" border="0" align="center" cellpadding="3" cellspacing="4">
	<tbody>
		<tr>
		  <td colspan="2"><img src="images/logo.jpg" width="621" height="155"></td>
	    </tr>
		<tr align="right" valign="middle">
		  <td colspan="2" align="right" style="text-align:right"><a href="index.jsp">HOME | </a><a href="help.jsp" onclick="return popitup('helpnew.html')">HELP</a></td>
	    </tr>
		<tr>
		  <td colspan="2"><h2><span class="style4">REGISTER YOUR DETAILS HERE: </span></h2></td>
	    </tr>
		<tr>
			<td width="148"><span class="style1">NAME:</span></td>
			<td width="463">
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
			<td width="148"><span class="style2">LOGIN ID:</span></td>
			<td width="463">
			<table width="97%" border="0" cellspacing="5">
				<tbody>
					<tr>
						
					  <td width="459" collspan="2" ><input name="id" type="text" value="" size="20"></td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
		  <td><span class="style2">VOTER ID </span></td>
		  <td><input name="vid" type="text" size="20" maxlength="20"></td>
	    </tr>
		<tr>
			<td width="148"><span class="style2">GENDER:</span></td>
			<td width="463"><select size="0" name="gender">
              <option selected>M</option>
              <option>F</option>
            </select></td>
		</tr>
		<tr>
			<td width="148"><span class="style2">DATE OF BIRTH:</span></td>
			<td width="463">
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
			<td width="148"><span class="style2">FATHER'S NAME:</span></td>
			<td width="463">
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
			<td width="148"><span class="style2">ADDRESS:</span></td>
			<td width="463"><textarea name="address" cols="40"></textarea></td>
		</tr>
		<tr>
		  <td><span class="style2">PIN CODE: </span></td>
		  <td><input name="pin" type="text" size="15" maxlength="18"></td>
	    </tr>
		<tr>
			<td width="148"><span class="style2">CITY:</span></td>
			<td width="463"><select name="city">
			  <option>Delhi</option>
			  <option>Mumbai</option>
			</select></td>
		</tr>
		<tr>
			<td width="148"><span class="style2">STATE:</span></td>
			<td width="463"><select name="state" size="0">
			  <option>Delhi</option>
			  <option>Mumbai</option>
		    </select></td>
		</tr>
		<tr>
		  <td><span class="style2">QUALIFICATION:</span></td>
		  <td><input type="text" name="qual"></td>
	    </tr>
		<tr>
			<td width="148"><span class="style2">EXPERIENCE:</span></td>
			<td width="463"><input type="text" name="exp"
				maxlength="35"></td>
		</tr>
		<tr>
		  <td><span class="style2">CRIME RECORD: </span></td>
		  <td><textarea name="crimerec"></textarea></td>
	    </tr>
		<tr>
		  <td><span class="style2">SOCIAL WORK</span></td>
		  <td><textarea name="social"></textarea></td>
	    </tr>
		<tr>
		  <td>REGION OF COMPAINING </td>
		  <td><input type="text" name="region"></td>
	    </tr>
		<tr>
		  <td><span class="style2">PROMISES:</span></td>
		  <td><textarea name="prom"></textarea></td>
		</tr>
		<tr>
		  <td><span class="style2">NAME OF POLITICAL PARTY: </span></td>
		  <td><input name="polname" type="text"></td>
	    </tr>
		
		<tr>
		  <td colspan="2">
			<table width="100%">
				<tbody>
				
					<tr>
					  <td><span class="style2">STATUS:</span></td>
					  <td><input type="text" name="status"></td>
					  <td width="5"></td>
				  </tr>
					<tr>
						<td width="150"></td>
						<td width="450"><input type="submit" name="submit"
							value="SUBMIT"></td>
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
var candidateValidator = new Validator("candidate");

candidateValidator.EnableOnPageErrorDisplay();
candidateValidator.SetMessageDisplayPos("right");

candidateValidator.EnableMsgsTogether();
candidateValidator.addValidation("fname","req","Please fill in fname");
candidateValidator.addValidation("fname","alpha_s","The input for fname should be a valid alphabetic value");
candidateValidator.addValidation("fname","maxlen=40","The length of the input for fname should not exceed 40");
candidateValidator.addValidation("mname","alpha","The input for mname should be a valid alphabetic value");
candidateValidator.addValidation("mname","maxlen=30","The length of the input for mname should not exceed 30");
candidateValidator.addValidation("lname","req","Please fill in lname");
candidateValidator.addValidation("lname","alpha","The input for lname should be a valid alphabetic value");
candidateValidator.addValidation("lname","maxlen=40","The length of the input for lname should not exceed 40");
candidateValidator.addValidation("id","req","Please fill in id");
candidateValidator.addValidation("id","email","The input for id should be a valid email value");
candidateValidator.addValidation("id","maxlen=40","The length of the input for id should not exceed 40");
candidateValidator.addValidation("vid","req","Please fill in vid");
candidateValidator.addValidation("vid","alnum","The input for vid should be a valid alpha-numeric value");
candidateValidator.addValidation("vid","maxlen=40","The length of the input for vid should not exceed 40");
candidateValidator.addValidation("ffname","req","Please fill in ffname");
candidateValidator.addValidation("ffname","alpha","The input for ffname should be a valid alphabetic value");
candidateValidator.addValidation("ffname","maxlen=40","The length of the input for ffname should not exceed 40");
candidateValidator.addValidation("fmname","alpha","The input for fmname should be a valid alphabetic value");
candidateValidator.addValidation("fmname","maxlen=30","The length of the input for fmname should not exceed 30");
candidateValidator.addValidation("flname","req","Please fill in flname");
candidateValidator.addValidation("flname","alpha","The input for flname should be a valid alphabetic value");
candidateValidator.addValidation("flname","maxlen=40","The length of the input for flname should not exceed 40");
candidateValidator.addValidation("address","req","Please fill in address");
candidateValidator.addValidation("address","maxlen=100","The length of the input for address should not exceed 100");
candidateValidator.addValidation("address","minlen=5","The length of the input for address should be at least 5.");
candidateValidator.addValidation("address","regexp=^[^!@#\\$%\\^&\\*\\(\\)\\{\\}\\[\\]\"\"\\?~\\+=]*$","Please enter a valid input for address");
candidateValidator.addValidation("pin","req","Please fill in pin");
candidateValidator.addValidation("pin","numeric","The input for pin should be a valid numeric value");
candidateValidator.addValidation("pin","maxlen=6","The length of the input for pin should not exceed 6");
candidateValidator.addValidation("qual","req","Please fill in qual");
candidateValidator.addValidation("qual","alnum_s","The input for qual should be a valid alpha-numeric value");
candidateValidator.addValidation("qual","maxlen=100","The length of the input for qual should not exceed 100");
candidateValidator.addValidation("exp","req","Please fill in exp");
candidateValidator.addValidation("exp","alnum_s","The input for exp should be a valid alpha-numeric value");
candidateValidator.addValidation("exp","maxlen=100","The length of the input for exp should not exceed 100");
candidateValidator.addValidation("crimerec","req","Please fill in crimerec");
candidateValidator.addValidation("crimerec","regexp=^[^!@#\\$%\\^&\\*\\{\\}\\[\\]]*$","Please enter a valid input for crimerec");
candidateValidator.addValidation("social","maxlen=100","The length of the input for social should not exceed 100");
candidateValidator.addValidation("region","req","Please fill in region");
candidateValidator.addValidation("region","alpha","The input for region should be a valid alphabetic value");
candidateValidator.addValidation("region","maxlen=30","The length of the input for region should not exceed 30");
candidateValidator.addValidation("prom","req","Please fill in prom");
candidateValidator.addValidation("prom","maxlen=300","The length of the input for prom should not exceed 300");
candidateValidator.addValidation("prom","alnum_s","Please enter a valid input for prom");
candidateValidator.addValidation("polname","req","Please fill in polname");
candidateValidator.addValidation("polname","alnum_s","The input for polname should be a valid alpha-numeric value");
candidateValidator.addValidation("polname","maxlen=40","The length of the input for polname should not exceed 40");
candidateValidator.addValidation("status","req","Please fill in status");
candidateValidator.addValidation("status","alpha_s","The input for status should be a valid alphabetic value");
candidateValidator.addValidation("status","maxlen=40","The length of the input for status should not exceed 40");

// ]]>
</script>

</body>
</html>
