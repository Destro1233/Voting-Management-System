<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-tiles"
	prefix="tiles"%>
<html>
<head>
<title>EPOLL</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/themes/candidate_profile/candidate_template.css"
	type="text/css">
<script language="JavaScript"
	src="${pageContext.request.contextPath}/themes/candidate_profile/jquery.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/themes/candidate_profile/menu.css"
	type="text/css">
<script language="JavaScript"
	src="${pageContext.request.contextPath}/themes/user_profile/menu.js"></script>


</head>
<body>


<table width="100%" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td class="masterOrange"></td>
			<td rowspan="3" class="master_page_center">
			<center><OBJECT
				classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
				codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
				WIDTH=100% HEIGHT=200>
				<PARAM NAME=movie VALUE="anibanner2.swf">
				<PARAM NAME=menu VALUE=false>
				<PARAM NAME=quality VALUE=high>
				<PARAM NAME=wmode VALUE=opaque>
				<PARAM NAME=scale VALUE=noscale>
				<EMBED src=${pageContext.request.contextPath}/themes/flash/anibanner2.swf menu=false quality=high
					wmode=opaque scale=noscale WIDTH=100% HEIGHT=200
					TYPE="application/x-shockwave-flash"
					PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
				</EMBED> </OBJECT></center>
			<table width="100%">
				<tbody>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td>
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td class="menucell">
									<div id="menu" style="width:100%;">
									<ul class="menu" style="width:100%;">
										<li><a href="#"><span>Home</span></a></li>
										<li><a href="#"><span>Edit Profile</span></a></li>
										<li><a href="#"><span>Forum</span></a></li>
										<li><a href="#"><span>News</span></a></li>
										<li><a href="#"><span>Logout</span></a></li>
									</ul>
									</div>
									<a href="http://apycom.com/"></a></td>
									<td class="datacell"><tiles:insert attribute="bodyarea"></tiles:insert>

									</td>
								</tr>
							</tbody>
						</table>
						</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td class="masterOrange"></td>
		</tr>
		<tr>
			<td class="masterWhite"></td>
			<td class="masterWhite"></td>
		</tr>
		<tr>
			<td class="masterGreen"></td>
			<td class="masterGreen"></td>
		</tr>
	</tbody>
</table>









</body>
</html>
