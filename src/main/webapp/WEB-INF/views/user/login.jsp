<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href='<c:url value="/layouts/homestyle.css"></c:url>'>
<link rel="stylesheet" href='<c:url value="/layouts/loginstyles.css"></c:url>'>
<meta charset="ISO-8859-1">
<title>Login</title>

</head>

<body>	
	<div class="container">
    <div class="login-form">
    	
        <form:form action="login.html" method="post" modelAttribute="accountUser">
            <div class="input-box">
                <i ></i>
                <label><strong>Username</strong></label>
                <form:input type="email" name="username" placeholder="Enter username"  path="id" />
            </div>
            <div class="input-box">
                <i ></i>
                <label><strong>Password</strong></label>
                <form:input type="password" name="password" placeholder="Enter password" path="pass" />
            </div>
            <div class="status"><p>${status}</p></div>
            <div class="btn-box">
                <form:button type="submit">Login</form:button>
            </div>
            <div class="cancel">
    		<button type="button">Cancel</button>
    		<span id="forgotpw">Forgot password</span>
   			</div>
        </form:form>        
    </div>
    
</div>
	
	
</body>
</html>