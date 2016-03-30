<%-- 
    Document   : cand_reg_chk
    Created on : Jul 13, 2012, 1:29:23 AM
    Author     : Saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  errorPage="../err.jsp" %>
<%@page  session="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
    <jsp:useBean id="cand" scope="page" class="registerbeans.candidatebean" />
    <jsp:setProperty name="cand" property="*" />
   <%!HttpSession session; %>

            <%
    //session=request.getSession(false);
    //if(session==null)
        {
       // response.sendRedirect("index.jsp");
        }
     // else
          {
        session= request.getSession();
        session.setMaxInactiveInterval(50);
          if(cand.insertValueInTables())
         {
          String uid=cand.getId();
          String name=cand.getFname();
          String table="c_login";
          String sender="supportNATPOL@gmail.com";
          String reciever=cand.getId();
          String idcol="CAND_LOG_ID";
          String message="Please use the following Credentials to login to the Website";
          
          mail.SendPassword sndmail = new mail.SendPassword();
          sndmail.sendMail(sender, reciever, message, table, idcol);


          String url="imageupload.jsp";
          session.setAttribute("profile","candidate");
          

           System.out.println(session.isNew()+session.getId()+request.getRemoteAddr()+request.getRemoteHost());
           System.out.println("uid"+cand.getId()+""+"name"+cand.getFname());
          session.setAttribute("uid",uid);
          session.setAttribute("uname",name);
          response.sendRedirect(url);
         
          }
          }
      %>

   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
    </head>
    <body>
       
   
    </body>
</html>
