<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

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
      // out.println("Welcome " + session.getAttribute("uid"));

}

        %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <jsp:useBean id="eco" scope="page" class="eco.profiledata"/>
<jsp:setProperty name="eco" property="*" />
        <title>EPOLL</title>
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

<%eco.setdata(uid);%>
<%eco.getdata();%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:25%;"> <jsp:include page="eco_left_panel.html" /></td>
    <td style="width:50%;" class="alignment">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr class="alignment">
    <td class="alignment"><jsp:include  page="header.html"/> </td>
  </tr>
  <tr>
    <td class="alignment"> <jsp:include  page="eco_menu.html"/></td>
  </tr>
  <tr>
    <td><center>
        <div id='form1_errorloc' class='error_strings' style=''></div>
        <form name="form1" method="post" action="updateprofile.jsp">
            <br>
                <br>
        <table width="352" border="1">
  <tr>
    <td width="180">NAME:</td>
    <td width="156">
      <%=eco.getFname() %>
    </td>
  </tr>
  <tr>
    <td>ADDRESS:</td>
    <td><textarea name="address"><%=eco.getAddress() %></textarea></td>
  </tr>
  <tr>
    <td>CITY:</td>
    <td><input type="text" name="city" value="<%=eco.getCity() %>"></td>
  </tr>
  <tr>
    <td>STATE:</td>
    <td><input type="text" name="state" value="<%=eco.getState() %>"></td>
  </tr>

   <td>PIN:</td>
    <td><input type="text" name="pin" value="<%=eco.getPin() %>"></td>
  </tr>
   <td>STATUS:</td>
    <td><input type="text" name="status" value="<%=eco.getStatus() %>"></td>
  </tr>

<tr>
    <td colspan="2" align="center" style="text-align:center">
    <input type="submit" name="Submit" value="Save Changes">

    </td>
  </tr>

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
form1Validator.addValidation("pin","req","Please fill in pin");
form1Validator.addValidation("pin","numeric","The input for pin should be a valid numeric value");
form1Validator.addValidation("pin","maxlen=6","The length of the input for pin should not exceed 6");
form1Validator.addValidation("status","req","Please fill in status");
form1Validator.addValidation("status","alpha","The input for status should be a valid alphabetic value");

// ]]>
</script>
    </table>
    </center>
    </td>
</table>


	</td>
    <td style="width:25%;"><jsp:include page="eco_right_panel.html"  page="true"/> </td>
  </tr>
</table>

</body>
</html>
