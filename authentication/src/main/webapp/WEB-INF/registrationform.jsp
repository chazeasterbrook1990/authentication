<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/style.css" />

<title>Registration Form</title>
</head>
<body>
	<div>
		<h1>Welcome</h1>
	</div>
	<div>
		<p>Join our growing community</p>
	</div>
	<div>
		<h2>Register</h2>
	</div>
	<div>
		<form:form action="/register" method="POST" modelAttribute="newUser">
			<div>
				<form:label path="userName">User Name: </form:label>
				<form:errors path="userName"></form:errors>
				<form:input path="userName"></form:input>
			</div>
			<div>
				<form:label path="email">Email: </form:label>
				<form:errors path="email"></form:errors>
				<form:input path="email"></form:input>
			</div>
			<div>
				<form:label path="password">Password: </form:label>
				<form:errors path="password"></form:errors>
				<form:input path="password"></form:input>
			</div>
			<div>
				<form:label path="confirm" class="form-group">Confirm PW: </form:label>
				<form:errors path="confirm"></form:errors>
				<form:input path="confirm"></form:input>
			</div>
			<input type="submit" value="Submit"/>
		</form:form>
	</div>
	<div>
		<h2>Login</h2>
	</div>
	<div>
		<form:form action="/login" method="POST" modelAttribute="newLogin">
			<div>
				<form:label path="email">Email: </form:label>
				<form:errors path="email"></form:errors>
				<form:input path="email"></form:input>
			</div>
			<div>
				<form:label path="password">Password: </form:label>
				<form:errors path="password"></form:errors>
				<form:input path="password"></form:input>
			</div>
			<input type="submit" value="Submit"/>
		</form:form>
	</div>
</body>
</html>