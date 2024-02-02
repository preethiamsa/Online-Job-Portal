<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ page import="com.dao.job_dao" %>
<%@ page import="com.DB.db_connection" %>
<%@ page import="com.entity.Jobs" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Jobs</title>
<%@include file="component/all_css.jsp" %>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="component/navbar.jsp" %>
<div class="container-fluid">
<div class="row p-4">
<div class="col-md-10 offset-md-1">
<div class="card">
<div class="card-body">
<div class="text-center">
<% 
int id = Integer.parseInt(request.getParameter("id"));
job_dao jd = new job_dao(db_connection.getcon()) ;
Jobs j = jd.getJobById(id);
%>
<h1>Edit Jobs</h1>
</div>
<form action="update" method="post">
<input type="hidden" value="<%=j.getId() %>" name="id" >
  <div class="form-group">
    <label for="exampleFormControlInput1">Enter Title</label>
    <input type="text" value="<%=j.getTitle() %>" class="form-control" name="title" id="exampleFormControlInput1" placeholder="Enter Title">
  </div>
  <div class="form-row">
  <div class="form-group col-md-4">
    <label for="exampleFormControlSelect1">Location</label>
    <select class="form-control custom-select" name="location" id="exampleFormControlSelect1">
      <option value="<%=j.getLocation()%>"><%=j.getLocation() %></option>
      <option value="Bangalore">Bangalore</option>
      <option value="Chennai">Chennai</option>
      <option value="Coimbatore">Coimbatore</option>
      <option value="Kolkata">Kolkata</option>
    </select>
  </div>
  <div class="form-group col-md-4">
    <label for="exampleFormControlSelect1">Category</label>
    <select class="form-control custom-select" name="category" id="exampleFormControlSelect1">
      <option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>
      <option value="IT">IT</option>
      <option value="Developer">Developer</option>
      <option value="Banking">Banking</option>
      <option value="Teacher">Teacher</option>
        <option value="HR">HR</option>
    </select>
  </div>
  <div class="form-group col-md-4">
    <label for="exampleFormControlSelect1">Status</label>
    <select class="form-control" name="status" id="exampleFormControlSelect1">
      <option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
      <option class="Active" value="Active">Active</option>
      <option class="Inactive" value="InActive">InActive</option>
    </select>
  </div>
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Description</label>
    <textarea class="form-control" name="desc" id="exampleFormControlTextarea1" rows="6"><%=j.getDescription() %></textarea>
  </div>
  <button class="btn btn-primary body-pill col-md-2 offset-md-9">Update Job</button>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>