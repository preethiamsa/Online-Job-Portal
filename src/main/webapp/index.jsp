<%@ page import="com.DB.db_connection" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Portal</title>
<%@include file="component/all_css.jsp" %>
<style>
.heading{
width:100%;
height:80vh;
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<div class="container-fluid heading" >
<h1 class="text-center pt-5">Online Job Portal</h1>
</div>
<%@include file="component/footer.jsp" %>
</body>
</html>