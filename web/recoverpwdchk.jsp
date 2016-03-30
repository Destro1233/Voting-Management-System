<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page session="false" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
    </head>
    <body style="color:blue;">
    <jsp:useBean id="pwdchk" scope="page" class="recovery.PswdRecovery" />
    <jsp:setProperty name="pwdchk" property="*" />
    
    <%

 if( pwdchk.recoverPassword()>0){

    out.print("<h2>pwd recovered</h2>");
}
 else
     { String url="NATPOL/recoverpassword.jsp";

         RequestDispatcher rd = request.getRequestDispatcher(url);
                      rd.include(request,response);
    out.print("Id does not exist");
 }

    %>
    
    </body>
</html>
