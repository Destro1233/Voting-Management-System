<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page session="false"  errorPage="../err.jsp"%>
<%@page import="db.Login" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Check</title>
    </head>
    <body>

        <%! HttpSession session; int i; String url;  int status; int votestatus;  %>
        <%
        session=request.getSession(false);
        if(session==null)
            {
            response.sendRedirect("../main_login.jsp");


            }
        else
            {
            String uid = request.getParameter("uname");
            String pwd = request.getParameter("password");
            String state = PollingStatus.UserState.StateFind(uid);
            status = PollingStatus.Status.pollingstatus(state);
            votestatus=PollingStatus.UserVote.castedVoteStatus(uid);
            System.out.print("UserLoginChk- Status "+status);
            session=request.getSession();
        
        if(db.Login.loginChk(uid, pwd, "XE","USER_VOTING","ADMIN_ID","PASSWORD"))
            {
             
            if(status==1 && votestatus==0)
                {
            session.setAttribute("userAdminId", uid);
            session.setAttribute("state",state);
            System.out.print("UserLoginChk- State "+state);
            response.sendRedirect("givevote.jsp");
            }
            else if(status==1 && votestatus==1)
            {
                response.sendRedirect("voted.jsp");
                }
         else if(status==0)
            {
                      
                      String url="vote_login.jsp";
                      
                      session.setAttribute("status","NO VOTING IS GOING ON IN YOUR REGION");
                      
                      // RequestDispatcher rd = request.getRequestDispatcher(url);
                      response.sendRedirect(url);
                      //rd.include(request,response);

                      //out.println("NO VOTING IS GOING ON IN YOUR REGION");
            }
            }
        else
            {
                      
                      String url="vote_login.jsp";
                  
                      session.setAttribute("status","INVALID USER ID OR PASSWORD");
                      response.sendRedirect(url);
                      //RequestDispatcher rd = request.getRequestDispatcher(url);
                     // rd.include(request,response);
                      //out.println("Invalid uid or pwd");
            }
        
        
        

        }
        %>

    
    
    
    
    </body>
</html>
