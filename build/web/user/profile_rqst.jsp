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
         tr {   border-bottom: 1px dashed #BDBDBD;

   }
 .th{ background-color:#BDBDBD;
 	
	 font-weight:bold;
	 font-size:125%;
	  }




</style>
<script src='../themes/user_profile/scripts/profile_request/scripts/gen_validatorv5.js' type='text/javascript'></script>
<script src='../themes/user_profile/scripts/profile_request/scripts/sfm_moveable_popup.js' type='text/javascript'></script>

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
<SCRIPT type="text/javascript">
   window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>

<%! HttpSession session; %>
    <%
    session= request.getSession(false);
 if(session==null)
     {
     System.out.println("Page reached");
     response.sendRedirect("../main_login.jsp");

     }
 else
     {
     session=request.getSession();
     session.setAttribute("to","admin@epoll.com");


     }
    %>


</head>

<body onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
    
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
    <td>
       
    
		  <h1 class="title">Compose Mail to Change Profile </h1>
			
<div id='profile_req_errorloc' class='error_strings' style=''></div>
			<form name="profile_req" method="post" action="send_chng_rqst.jsp">
			<table border="0"  width="100%" style="border :4px solid #000000">
  <tr><!-- Row 1 -->

     <td class="th" colspan="3"><b><u>Mail</u></b></td><!-- Col 1 -->
     <td></td><!-- Col 2 -->
  </tr>
  <tr><!-- Row 2 -->
     <td class="th">To</td><!-- Col 1 -->
     <td><input type="text" name="to" value="<%="admin@epoll.com" %>" maxlength="30" style="width:200px;" disabled="true"></td><!-- Col 2 -->
  </tr>

  <tr><!-- Row 4 -->

     <td class="th">Subject</td><!-- Col 1 -->
     <td><input type="text" name="subject" value="" maxlength="30" style="width:200px;"></td><!-- Col 2 -->
  </tr>
  <tr><!-- Row 5 -->
     <td valign="top" class="th">Message</td>
     <!-- Col 1 -->
     <td><textarea name="message" rows="10" cols="30"></textarea></td><!-- Col 2 -->

  </tr>



  <tr>&nbsp&nbsp</tr>
  <tr class="th"><!-- Row 25 -->

     <td><input type="SUBMIT" name="SUBMIT" value="SUBMIT"></td><!-- Col 1 -->
     <td><input type="reset"></td><!-- Col 2 -->
	 <td><input type="button" value="Cancel"></td>
  </tr>
</table>
</form>
<script type='text/javascript'>
// <![CDATA[
var profile_reqValidator = new Validator("profile_req");

profile_reqValidator.EnableOnPageErrorDisplay();
profile_reqValidator.SetMessageDisplayPos("right");

profile_reqValidator.EnableMsgsTogether();
profile_reqValidator.addValidation("subject","req","Please fill in subject");
profile_reqValidator.addValidation("message","req","Please fill in message");

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
