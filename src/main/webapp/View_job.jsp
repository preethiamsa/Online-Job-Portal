<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ page import="com.dao.job_dao" %>
<%@ page import="com.DB.db_connection" %>
<%@ page import="com.entity.Jobs" %>
<%@page language="java" import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="component/all_css.jsp" %>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="component/navbar.jsp" %>
<div class="text-center mt-4">
<h1>All Jobs</h1>
<c:if test="${not empty msg }">
<div class="alert alert-info" role="alert">
${msg}
</div>
<c:remove var="msg" />
</c:if>

<% job_dao jd = new job_dao(db_connection.getcon());
List<Jobs> list = jd.getAllJobs();
for(Jobs j:list)
{ %>
	<div class="container mt-3">
	<div class="row">
	<div class="col-md-12">
	<div class="card">
	<div class="card-body">

	<h6><%=j.getTitle() %></h6>
	<p><%=j.getDescription() %></p>
	<div class="form-row">
	<div class="form-group col-md-3">
	<input type="text" class="form-control" value="Location:<%=j.getLocation() %>" readonly>
	</div>
	<div class="form-group col-md-3">
	<input type="text" class="form-control" value="Category:<%=j.getCategory() %>" readonly>
	</div>
	<div class="form-group col-md-3">
	<input type="text" class="form-control" value="Status:<%=j.getStatus() %>" readonly>
	</div>
	</div>
	<h6>Published Date :<%=j.getPublish_date() %> </h6>
	<div class="text-center">
	<a href="edit_job.jsp?id=<%=j.getId() %>" class="btn btn-sm bg-success text-white">Edit</a>
	<a href="delete?id=<%=j.getId() %>" class="btn btn-sm bg-danger text-white">Delete</a>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%} %>
	
</div>

</body>
</html>