<%--
Document   :regucess
    Created on : Jul 13, 2012, 1:05:53 AM
    Author     : Saurabh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%@page errorPage="/err.jsp"  session="false"  import="db.SetPassword,java.rmi.server.UID"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLLl</title>
    </head>
    <body style=" color:blue;">
        
        <%!HttpSession session; %>
        
        <%

          session=request.getSession(false);
      
          if(session==null)
              {
             
              response.sendRedirect("/NATPOL/index.jsp");
              }
          else
              {
                 session = request.getSession();
                 out.println("<center>");
                 out.println("<h1>"+session.getAttribute("uname")+"</h1>");
                 out.println("<h3>You have been sucesssfully registered...</h3>");
                 out.println("<h3> Please check your mail for the password...</h3>");
                  session.invalidate();
                  out.println("<h4><a href="+"index.jsp"+"> Click to go to home page</h4> ");
    
                    out.println("</center>");
              }
              
         %>
 
        <b> </b>
        
   </body>
</html>
