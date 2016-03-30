<%-- 
    Document   : eco_reg_chk
    Created on : Jul 13, 2012, 1:29:45 AM
    Author     : Saurabh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  errorPage="err.jsp" %>
<%@page  session="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
    


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
    </head>
    <body>
        <jsp:useBean id="eco" scope="page" class="registerbeans.ecoregister" />
    <jsp:setProperty name="eco" property="*" />
     <%!HttpSession session;    %>

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
          if(eco.insertValueInTables())
         {
          String uid=eco.getId();
          String name=eco.getFname();
          String table="eco_login";
          String sender="supportNATPOL@gmail.com";
          String reciever=eco.getId();
          String idcol="ECO_LOG_ID";
          String message="Plz use the following Credentials to login to the Website";
          mail.SendPassword sndpwd = new mail.SendPassword();
          
          sndpwd.sendMail(sender, reciever, message, table, idcol);
          


          String url="imageupload.jsp";
          session.setAttribute("profile","eco");
          //response.setHeader("id", uid);

           //System.out.println(session.isNew()+session.getId()+request.getRemoteAddr()+request.getRemoteHost());
           //System.out.println("uid"+eco.getId()+""+"name"+eco.getFname());
          session.setAttribute("uid",uid);
          session.setAttribute("uname",name);
          response.sendRedirect(url);
          //response.setHeader("uname", "Saurabh");
          }
          }
      %>

  
    <%
      if(eco.insertValueInTables())
          response.sendRedirect("regsucess.jsp");
       else
           response.sendRedirect("eco_registration.jsp");
     %>
    </body>
</html>
