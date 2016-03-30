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



<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:25%;"> <jsp:include page="candidate_left_panel.html"  flush="true"/></td>
    <td style="width:50%;" class="alignment">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr class="alignment">
    <td class="alignment"><jsp:include  page="header.html" flush="true"/> </td>
  </tr>
  <tr>
    <td class="alignment"> <jsp:include  page="candidate_menu.html" flush="true"/></td>
  </tr>
  <tr >
    <td style="color:red"  >
   <h1><u>BJP wins Purnia assembly seat in Bihar</u></h1>
						<div class="re" style="min-height:220px; color:blue">
																		<p>PURNIA: The Bharatiya Janata Party (BJP), an alliance partner in Bihar's ruling government, has bagged victory in the bypoll to the Purnia assembly constituency. BJP's Ms Kiran Keshri has won by defeating Ramcharitra Yadav, LJP-supported Congress rival, by a margin of 23,665 votes. </p>
<p>Ms Kiran had secured 53,732 votes against Yadav's 30,067 votes. The CPI-M nominee Mr Amit Sarkarhas bagged 17,113 votes. The other contestants-Islamuddin got 1554 votes, Om Prakash Bhagat received 898 votes and Krishna Kumar Jha got 508 votes. </p>
<p>The June-25 bypoll was needed after Ms Kiran Keshri's husband and senior party MLA Raj Kishore Keshri was stabbed to death by a teacher Rupam Pathak here. After the victory of Kiran Keshri, BJP has successfully managed to maintain its tally in the state assembly to 91. </p>
<p>Seven candidates were in the fray for the by-elections. It was for the first bypoll after the Nitish Kumar-led National Democratic Alliance (NDA) had won the state assembly polls last year.</p>
						</div> 
         <h1><u>Mamta takes oath as West Bengal CM</u></h1>

<div class="re" style="color:blue"><p>KOLKATA: Trinamool Congress head Mamata Banerjee has taken oath as the first woman chief minister of the state. Ms Banerjee is the first non-Marxist to come to power in 34 years. She took the oath of office and secrecy by Governor MK Narayanan at the Raj Bhawan here at 1.01 pm today. </p>
</div>
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


	</td>
    <td style="width:25%;"><jsp:include page="candidate_right_panel.html"  page="true"/> </td>
  </tr>
</table>

</body>
</html>
