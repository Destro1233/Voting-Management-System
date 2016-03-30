<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
        <style>
        .alignment
        {
            text-align:left;
	vertical-align:top;

         }
         .table_background {

	background-image: url('../images/emblem.png');
	background-repeat: no-repeat;
	background-position: center;
	
}
table
        {

            margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
        }
        body
        {
            margin:0;
            padding:0;
            color:blue;
            
            }



         
            </style>
            <link rel="stylesheet"
	href="${pageContext.request.contextPath}/themes/master.css"
	type="text/css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/themes/general/menu.css"
	type="text/css">
<script language="JavaScript"
	src="${pageContext.request.contextPath}/themes/general/jquery.js"></script>
<script language="JavaScript"
	src="${pageContext.request.contextPath}/themes/general/menu.js"></script>
    </head>
    <body>


   <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="max-height:900px;">
  <tr>
      <td width="25%"> <jsp:include page="leftpanel.html"  flush="true"/> </td>
    <td width="50%" class="alignment">
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" class=" table_background" >
        <tr class="alignment">
            <td class="alignment" height="200"> <jsp:include page="header.html" flush="true"/></td>
        </tr>
        <tr class="alignment">
            <td class="alignment"> <jsp:include  page="main_menu.html" flush="true"/></td>
        </tr>
        <tr>
            
          <td align="center" height="100" >
               <font color="BLUE" size="6"><u>ABOUT US</u></font>


               </td>
        </tr>
        <tr height="100" >
							<td style="overflow:auto ;display:block ;float:none; padding-left:20px; padding-right:20px;">
							<font color="BLUE" SIZE="4">VMS.com is a system which enables all citizens to cast
								their vote online so that they need not to visit the booth to
								cast their votes. It is also beneficial for those citizens who
								are unable to cast their vote as they live out of their home
								town.
								</font>

							</td>
							</tr>
							<tr height="50">
							<td style="padding-left:20px; padding-right:20px;" >
						<font color="BLUE" SIZE="4">	It is highly secured system through which citizens can
								vote fearlessly. It also creates and manages polling and
								election details.
								</font>


							</td>
							</tr>
							<tr height="50">
							<td style="padding-left:20px; padding-right:20px;">
						<font color="BLUE" SIZE="4">It is more efficient than Management of Polling Station
								as it reduces the complexity and cost. It provides hassle free
								environment to voters for practicing their right to vote just by
								casting their votes online.</font>


							</td>
							</tr>
							<tr height="100">
							<td  style="padding-left:20px; padding-right:20px;">
					<font color="BLUE" SIZE="4">It also spreads the general awareness among the citizens
								and tells them why they must exercise their votes in the welfare
								of the country. This is done by spreading information about the
								causes and effects of people practicing their votes. It also
								aware the general public on what measures they should take while
								choosing a candidate to their representative in legislative
								assembly. </font>

							</td>
							</tr>
							<tr height="100">
							<td style="padding-left:20px; padding-right:20px;">
					<<font color="BLUE" SIZE="4">India, officially the Republic of India, is a country in
								Asia It is a parliamentary republic and operates under a
								multi-party system. There are six recognizednational parties
								Indian National Congress (INC) and Bhartiya Janata Party (BJP),
								and more than 40 regional parties It is the seventh-largest
								country by geographical area, the second-most populous. country,
								and the most populous democracy in the world. India is a
								federal.constitutional republic with a parliamentary system
								consisting of 28 states and seven union territories. India is
								the most populous democracy in the world. That?s why voting is
								an ultimate essence of Indians. </font>

							</td>
							</tr>
							<tr height="100">
							<td  style="padding-left:20px; padding-right:20px;">
			<font color="BLUE" SIZE="4">
								Modern political science
								has questioned whether  citizens have
								sufficient political information to cast meaningful votes. A
								series of studies coming out of the University of Michigan in the
								1950s and 1960s argued that voters lack a basic understanding of
								current issues, the liberal conservativeideological dimension, and the
								relative idealogical dilemma. So epoll.com provides
								the information about the candidates so that it would be easy
								for voter to vote to right candidate.
								</font>

							</td>
							</tr>
							<tr height="100">
							<td  style="padding-left:20px; padding-right:20px;">
						<font COLOR="BLUE" SIZE="4">In a voting system generally different types of votes can
								be there one includes <i>multiple vote</i> in which voter can
								vote for any subset of the alternatives. But this is not allowed
								in epoll system.A user can select only 1 candidate for vote.

								</font>
							</td>
							</tr>
							<tr height="50">
							<td style="padding-left:20px; padding-right:20px;">

								<font color="BLUE" SIZE="4">In politics voter fatigue is the
										apathy that the electorate can experience when they are
										required to vote too often. This problem can never happen when
										there is epolling system.
										</font>

							</td>
							</tr>
                   <tr>
            <td  align="center" valign="bottom" style="height:20px"><jsp:include  page="main_footer.html" flush="true"/></td>
        </tr>
      </table>
	</td>
    <td width="25%" ><jsp:include  page="rightpanel.html" flush="true"/> </td>
  </tr>
</table>



    </body>
</html>
