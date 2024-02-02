<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="component/all_css.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>
<div class="container-fluid">
<div class="row p-5">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">

<div class="text-center">
<i class="fa-sharp fa-solid fa-user"></i>
<h3>Login</h3>
</div>
<c:if test="${not empty msg }">
<h4 class="text-center text-danger">${msg}</h4>
<c:remove var="msg" />
</c:if>
<form action="login" method="post">
<div class="form-group">
<label for="email">Email : </label>
<input type="email" placeholder="Enter Your mail id" class="form-control" required="required" name="email">
</div>
<div class="form-group">
<label for="password">Password : </label>
<input type="password" placeholder="Enter Your password" class="form-control" required="required" name="password">
</div>
<button class="btn btn-primary body-pill btn-block">Login</button>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>