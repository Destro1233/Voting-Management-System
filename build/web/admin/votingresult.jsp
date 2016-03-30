<%-- 
    Document   : votingresult
    Created on : Apr 25, 2013, 10:03:29 PM
    Author     : Saurabh
--%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="../err.jsp" %>
<%@page  import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- TemplateBeginEditable name="doctitle" -->
<title>VMS</title>
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
<%! HttpSession session; String id; Connection c=null;
    PreparedStatement ps=null,ps1=null,ps2=null;
    ResultSet rs=null,rs1=null,rs2=null;
    int nRows,status,sprocess=0;
    String states,states1,name,vcount,fname,lname,mname,party;
%>
        <%
        session=request.getSession(false);
        if(session==null)
            {
            response.sendRedirect("../login.jsp");
            }
     else
       {
            session=request.getSession();
            id=(String)session.getAttribute("id");


        }
        %>


</head>

<body style=" color:blue;">



<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:25%;"> <jsp:include page="admin_left_panel.html"  flush="true"/></td>
    <td style="width:50%;" class="alignment">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr class="alignment">
    <td class="alignment"><jsp:include  page="header.html" flush="true"/> </td>
  </tr>
  <tr>
    <td class="alignment"> <jsp:include  page="admin_menu.html" flush="true"/></td>
  </tr>
  <tr>
    <td align="center">
        <%
        try{

        c=db.DatabaseConnection.dbConnect("XE");
        ps=c.prepareStatement("SELECT * FROM VOTING_STATUS",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        rs=ps.executeQuery();
        rs.last();
        nRows=rs.getRow();
        rs.relative(-nRows);
        %>

<br> <br>
    <form method="" action="votingresult.jsp">
<table width="50%"  border="1" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="40%" >SELECT STATE</td>
    <td width="60%" >
        <select name="states" id="states" >
        <% while(rs.next())
            {
            states=rs.getString("STATE");
            status=rs.getInt("POLlING_STATUS");
            %>
            <option value="<%=states %>"> <%=states %></option>
            <%  }  %>
            </select>
    </td>
  </tr>
  <%
  String start=request.getParameter("result");
  if(start==null){}
  else
  {
  %>
  <tr>
      <td>
          CURRENT STATUS
      </td>
      <td>

<%
                ps1=c.prepareStatement("SELECT POLLING_STATUS FROM VOTING_STATUS where STATE=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                ps1.setString(1,request.getParameter("states"));
                rs1=ps1.executeQuery();
                rs1.last();
                nRows=rs1.getRow();
                rs1.relative(-nRows);
                if(rs1.next()){
                int i=rs1.getInt("POLLING_STATUS");
                if(i==1) {
                    out.print("Voting is still going on.");
                    sprocess=0;
                    }
                else {
                    sprocess = 1;
                    out.println("Result Are Below :-");
                }

                    }

%>
      </td>
  </tr>
  <%
  }
  %>
  <tr>
    <td align="center" colspan="1"  ><input name="result" type="submit" value="Result">
        </td>
  </tr>
</table>
</form>
<%
if(sprocess == 1)
    {
    states1 = request.getParameter("states");
    ps2 = c.prepareStatement("select cand_regional_status.cand_total_vote" +
    " ,cand_profile.cand_fname ,cand_profile.cand_mname ,cand_profile.cand_lname " +
    " ,cand_profile.pol_name "+
    " from cand_regional_status inner join cand_profile  "+
    " on cand_regional_status.cand_log_id_regstr = cand_profile.cand_log_id  "+
    " where cand_profile.cand_state = '"+ states1 +"' and cand_profile.verified=1 ",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    System.out.println("voteresult:- Query Executed State Name- "+ states1);
    rs2 = ps2.executeQuery();
    rs2.last(); 
    nRows=rs2.getRow();
    rs2.relative(-nRows);
    }
%>
    <%
    if (rs2!=null){
        System.out.println("voteresult:- Printing Table");
    %>
    &nbsp;
    <table width="75%"  border="1" cellspacing="0" cellpadding="0" align="center">
           <tr><th>Candidate Name</th> <th>Candidate Party</th> <th>Vote Count</th></tr>

           <%
          
              while(rs2.next())
               {
                vcount = rs2.getString("CAND_TOTAL_VOTE");
                fname=rs2.getString("CAND_FNAME");
                mname=rs2.getString("CAND_MNAME");
                lname=rs2.getString("CAND_LNAME");
                party=rs2.getString("POL_NAME");
                if(mname==null)
                    {
                    name=fname+" "+lname;
                    }
                else
                    {
                    name=fname+" "+mname+" "+lname;
                    }
             %>
             <tr>
                 <td>
                     <%=name%>
                 </td>
                 <td>
                     <%=party%>
                 </td>
                 <td>
                     <%=vcount%>
                 </td>
             </tr>
             <%
             }
             %>
            
        </table>
             <%
             }
             }catch(Exception e)
                     {
                     System.out.println(e);
                     e.printStackTrace();
                     }
             finally{
                if(rs!=null)
                rs.close();
                if(rs1!=null)
                rs1.close();
                if(rs2!=null)
                rs2.close();
                if(ps!=null)
                ps.close();
                if(ps1!=null)
                ps1.close();
                if(ps2!=null)
                ps2.close();
                if(c!=null)
                c.close();
            }
            %>
     </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

	</td>
    <td style="width:25%;"><jsp:include page="admin_right_panel.html"  page="true"/> </td>
  </tr>
</table>

</body>
</html>
