<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href='<c:url value="/layouts/homestyle.css"></c:url>'>
<link rel="stylesheet" href='<c:url value="/layouts/loginstyle.css"></c:url>'>
<meta charset="ISO-8859-1">
<title><decorator:title default="Master-layout"></decorator:title> </title>
</head>
<body>
	<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
	
	<decorator:body />
	
	<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
</body>
</html>