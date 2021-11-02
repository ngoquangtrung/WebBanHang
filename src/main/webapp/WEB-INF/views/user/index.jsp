<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Tai khoan</title>
<body>
<p>This index page</p>
<p>${account.size() }</p>
<c:forEach var="i" items="${account}">
<p>${i.getId() }</p>
<p>${i.getPass() }</p>
</c:forEach>

</body>
