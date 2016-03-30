<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
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
<%! HttpSession session; %>
        <%
        session=request.getSession(false);
        if(session==null)
            {
            response.sendRedirect("../main_login.jsp");
            }
     else
       {
            session=request.getSession();



        }
        %>


</head>

<body>
        <font color="blue">
        <h1><u>Help Page</u></h1>


       Q1.What if one doesnot have voter id card?<br>
   A1.one should first get it then register.<br><br>

   Q2.How can one get password?<br>
   A2.User will get password during registration through email.<br><br>

   Q3.How to get help while login?<br>
   A3.When you are logged in there are various menus in which there is a menu named help..click on it and get help.
<br><br>
   Q4.Can one change  password?<br>
   A4.Password cannot be changed but resetted.<br><br>

   Q5.Can one be able to see candidate details?<br>
   A5.User can see candidate basic details in candidate llst.<br><br>

   Q6.Who can vote here?<br>
   A6.Every one who want to vote, sshould first register as an valid user.Who will be then varified by the ECO.
   <br><br>
  </font>
  

  

    
</body>
</html>
