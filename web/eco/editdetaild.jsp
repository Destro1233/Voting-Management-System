package eco;

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-tiles"
	prefix="tiles"%>
<tiles:insert definition="eco_template">
	<tiles:put name="bodyarea"
		value="/tilesContent/ECO_editdetaild_bodyarea.jsp" type="page"></tiles:put>
	<tiles:put name="documentTitle" value="ECO_editdetaild" direct="true"
		type="string"></tiles:put>
</tiles:insert>
