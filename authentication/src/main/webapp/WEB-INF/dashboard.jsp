<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/style.css" />
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
	<div>
		<h1>Welcome, <c:out value="${userLoggedIn.userName}"></c:out>!</h1>
	</div>
	<div>
		<p>This is your dashboard. Nothing to see here yet.</p>
	</div>
	<div>
	<a href="/logout">logout</a>
	</div>
</body>
</html>