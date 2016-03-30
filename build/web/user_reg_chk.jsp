<%-- 
    Document   : user_reg_chk
    Created on : Jul 12, 2012, 3:45:31 PM
    Author     : Saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%@page  import="mail.SendPassword" %>
   <%@page  import="db.SetPassword" errorPage="err.jsp" %>



<html>
    <head>
        <title>EPOLL</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
    </head>
    <body>
        <jsp:useBean id="usr"  class="registerbeans.userregisterbean" scope="request"  />
    <jsp:setProperty name="usr" property="*" />
    
    <%!HttpSession session;    %>
    <%
    session=request.getSession(false);
    if(session==null)
        {
        response.sendRedirect("/NATPOL/index.jsp");
        } 
      else 
          { 
        session= request.getSession();
        session.setMaxInactiveInterval(100);
          if(usr.insertValueInTables())
         {
          String uid=usr.getId();
          String name=usr.getFname();
          String table="user_login";
          String sender="supportNATPOL@gmail.com";
          String reciever=usr.getId();
          String idcol="USER_LOG_ID";
          String message="Please use the following Credentials to login to the Website";
         
          mail.SendPassword sndpwd = new mail.SendPassword();
          sndpwd.sendMail(sender, reciever, message, table, idcol);
          
          
          
          String url="imageupload.jsp";

          session.setAttribute("uid",uid);
          session.setAttribute("profile","user");
          
           //System.out.println(session.isNew()+session.getId()+request.getRemoteAddr()+request.getRemoteHost());
           System.out.println("uid"+usr.getId()+""+"name"+usr.getFname());
          
          session.setAttribute("uname",name);

          response.sendRedirect(url);
          
          }
          }
      %>
       
    
 			
      
    

    </body>
</html>
