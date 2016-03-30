<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page  session="false" %>

    <%! HttpSession session; String uid;%>
    <%session=request.getSession(false);
        if(session==null)
            {
            response.sendRedirect("../main_login.jsp");
            }
     else
       {
            session=request.getSession();
            uid=(String)session.getAttribute("uid");

            //session.setAttribute("userid","tester@gmail.com" );
            //usr.setdata((String)(session.getAttribute("uid")));
            //usr.getdata();
       //out.println("Welcome " + session.getAttribute("uid"));

}
       
        %>
        <html>
<head>
<!-- TemplateBeginEditable name="doctitle" -->
<title>EPOLL</title>
<!-- TemplateEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
<jsp:useBean id="candidate" scope="page" class="candidate.profiledata"/>
<jsp:setProperty name="candidate" property="*" />
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

td{text-align:left;color:#0000FF;border-color:#000000;}
</style>
<script src='scripts/gen_validatorv5.js' type='text/javascript'></script>
<script src='scripts/sfm_moveable_popup.js' type='text/javascript'></script>

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


<%candidate.setdata(uid);%>
<%candidate.getdata();%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:25%;"> <jsp:include page="candidate_left_panel.html"  flush="true"/></td>
    <td style="width:50%;" class="alignment">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr class="alignment">
    <td class="alignment"><jsp:include  page="header.html" flush="true"/> </td>
  </tr>
  <tr>
    <td class="alignment"> <jsp:include  page="candidate_menu.html" flush="true"/></td>
  </tr>
  <tr>
    <td><center>
        <div id='form1_errorloc' class='error_strings' style=''></div>
        <form name="form1" method="post" action="updateprofile.jsp">
            <br> <br>
        <table width="80%" border="1">
  <tr>
    <td width="180">NAME:</td>
    <td width="156">
      <%=candidate.getFname() %>
    </td>
  </tr>
  <tr>
    <td>ADDRESS:</td>
    <td><textarea name="address"><%=candidate.getAddress() %></textarea></td>
  </tr>
  <tr>
    <td>CITY:</td>
    <td><input type="text" name="city" value="<%=candidate.getCity() %>"></td>
  </tr>
  <tr>
    <td>STATE:</td>
    <td><input type="text" name="state" value="<%=candidate.getState() %>"></td>
  </tr>
 
  <tr>
    <td>PROMISES:</td>
    <td><textarea name="prom"><%=candidate.getProm() %></textarea></td>
  </tr>
  <tr>
    <td>SOCIAL WORK: </td>
    <td><textarea name="social"><%=candidate.getSocial() %></textarea></td>
  </tr>
  <tr>
    <td>REGION OF COMPAINING </td>
    <td><input type="text" name="region" value="<%=candidate.getRegion() %>"></td>
  </tr>
  <tr>
    <td>QUALIFICATION:</td>
    <td><input type="text" name="qual" value="<%=candidate.getQual() %>"></td>
  </tr>
  <tr>
    <td>EXPERIENCE:</td>
    <td><input type="text" name="exp" value="<%=candidate.getExp() %>"></td>
  </tr>
<tr>
    <td colspan="2" align="center" style="text-align:center" >
    <input type="submit" name="Submit" value="Save Changes" align="center">
    </td>
  </tr>
    </table>
    </form>
    <script type='text/javascript'>
// <![CDATA[
var form1Validator = new Validator("form1");

form1Validator.EnableOnPageErrorDisplay();
form1Validator.SetMessageDisplayPos("right");

form1Validator.EnableMsgsTogether();
form1Validator.addValidation("address","req","Please fill in address");
form1Validator.addValidation("address","maxlen=100","The length of the input for address should not exceed 100");
form1Validator.addValidation("city","req","Please fill in city");
form1Validator.addValidation("city","alpha_s","The input for city should be a valid alphabetic value");
form1Validator.addValidation("state","req","Please fill in state");
form1Validator.addValidation("state","alpha","The input for state should be a valid alphabetic value");
form1Validator.addValidation("prom","req","Please fill in prom");
form1Validator.addValidation("prom","maxlen=200","The length of the input for prom should not exceed 200");
form1Validator.addValidation("social","req","Please fill in social");
form1Validator.addValidation("social","maxlen=200","The length of the input for social should not exceed 200");
form1Validator.addValidation("region","req","Please fill in region");
form1Validator.addValidation("region","alpha_s","The input for region should be a valid alphabetic value");
form1Validator.addValidation("qual","req","Please fill in qual");
form1Validator.addValidation("qual","alnum","The input for qual should be a valid alpha-numeric value");
form1Validator.addValidation("exp","req","Please fill in exp");
form1Validator.addValidation("exp","alnum","The input for exp should be a valid numeric value");

// ]]>
</script>

    </center></td>
 
</table>

	</td>
    <td style="width:25%;"><jsp:include page="candidate_right_panel.html"  page="true"/> </td>
  </tr>


</body>
</html>
