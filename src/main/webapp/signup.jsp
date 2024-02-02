<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/all_css.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>
<div class="container-fluid">
<div class="row p-4">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<form action="add_user" method="post">
<div class="text-center">
<h1>Register</h1>
</div>
<c:if test="${not empty msg }">
<div class="alert alert-info" role="alert">
${msg}
</div>
<c:remove var="msg" />
</c:if>
<div class="form-group">
<label for="name">Full Name :</label>
<input type="text" class="form-control" required="required" placeholder="Enter your name" name="name">
</div>
<div class="form-group">
<label for="qual">Enter Qualification :</label>
<input type="text" class="form-control" required="required" placeholder="Enter Qualification" name="qual">
</div>
<div class="form-group">
<label for="mail">Email :</label>
<input type="email" class="form-control" required="required" placeholder="Enter your mail" name="email">
</div>
<div class="form-group">
<label for="pw">Password :</label>
<input type="password" class="form-control" required="required" placeholder="Enter your password" name="pw">
</div>
<button class="btn btn-primary body-pill btn-block">SignUp</button>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>