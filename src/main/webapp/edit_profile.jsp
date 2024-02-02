<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="component/all_css.jsp" %>
</head>
<body>
<c:if test="${empty userobj }">
<c:redirect url="login.jsp" ></c:redirect>
</c:if>
<%@include file="component/navbar.jsp" %>
<div class="container-fluid">
<div class="row p-4">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<div class="text-center">
<i class="fa fa-user-plus fa-2x" aria-hidden="true" ></i>
<h5>Edit Profile</h5>
</div>
<form action="update_profile" method="post">
<input type="hidden" name="id" value="${userobj.id} ">
<div class="form-group">
<label for="name">Full Name :</label>
<input type="text" class="form-control" required="required" 
placeholder="Enter your name" name="name" value="${userobj.name }">
</div>
<div class="form-group">
<label for="qual">Enter Qualification :</label>
<input type="text" class="form-control" required="required" 
placeholder="Enter Qualification" name="qual" value="${userobj.qualification }">
</div>
<div class="form-group">
<label for="mail">Email :</label>
<input type="email" class="form-control" required="required" 
placeholder="Enter your mail" name="email" value="${userobj.email }">
</div>
<div class="form-group">
<label for="pw">Password :</label>
<input type="password" class="form-control" required="required" 
placeholder="Enter your password" name="pw" value="${userobj.password }">
</div>
<button type="submit" class="btn btn-primary body-pill btn-block">Update</button>
</body>
</html>