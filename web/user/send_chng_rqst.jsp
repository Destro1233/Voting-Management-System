<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%@page session="false"  import="mail.SendMail" %>
   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <%! HttpSession session; %>
       <%
 session= request.getSession(false);
 if(session==null)
     {
     System.out.println("Page reached");
     response.sendRedirect("../index.jsp");

     }
 else
     {
     session=request.getSession();
  String to,from,subject,message;
 to=(String)session.getAttribute("to");
 from=(String)session.getAttribute("uid");
 subject=request.getParameter("subject");
 message=request.getParameter("message");
mail.SendMail sndmail = new mail.SendMail();
 sndmail.sendMail(from, to, subject, message);
 response.sendRedirect("mailsucess.jsp");

}
 %>
    </head>
    <body>
 
 
    
    
    
    </body>
</html>
