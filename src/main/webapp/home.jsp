<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.job_dao" %>
<%@ page import="com.DB.db_connection" %>
<%@ page import="com.entity.Jobs" %>
<%@page language="java" import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Jobs</title>
<%@include file="component/all_css.jsp" %>

</head>
<body>
<%@include file="component/navbar.jsp" %>
<c:if test="${empty userobj }">
<c:redirect url="login.jsp" ></c:redirect>
</c:if>
<div class="container">
<div class="row">
<div class="col-md-12">
<h5 class="text-center text-primary">All Jobs</h5>
<c:if test="${not empty msg }">
<h4 class="text-center text-danger">${msg}</h4>
<c:remove var="msg" />
</c:if>
<div class="card">
<div class="card-body">
<form class="form-inline" action="more_view.jsp" method="get">
<div class="form-group col-md-5 mt-1">
<h5>Location</h5>
</div>
<div class="form-group col-md-4 mt-1">
<h5>Category</h5>
</div>
<div class="form-group col-md-5">
<select class="form-control custom-select" name="location" id="exampleFormControlSelect1">
      <option selected value="location">Choose...</option>
      <option value="Bangalore">Bangalore</option>
      <option value="Chennai">Chennai</option>
      <option value="Coimbatore">Coimbatore</option>
      <option value="Kolkata">Kolkata</option>
    </select>
</div>
<div class="form-group col-md-5">
 <select class="form-control custom-select" name="category" id="exampleFormControlSelect1">
      <option selected value="category" >Choose...</option>
      <option value="IT">IT</option>
      <option value="Developer">Developer</option>
      <option value="Banking">Banking</option>
      <option value="Teacher">Teacher</option>
        <option value="HR">HR</option>
    </select>
</div>
<button class="btn btn-success">Submit</button>
</form>
</div>
</div>
<%
job_dao jd = new job_dao(db_connection.getcon());
List<Jobs> list = jd.getAllJobsForUser();
for(Jobs j : list){
%>
<div class="card mt-2">
<div class="card-body">
<div class="text-center text-primary">
<i class="far fa-clipboard fa-2x"></i>
</div>

<h6><%=j.getTitle() %></h6>
<%
if(j.getDescription().length()>0&& j.getDescription().length() < 120){
%>
<p><%=j.getDescription() %></p>
<%
} else{
	%>
	<p><%=j.getDescription().substring(0,120) %>...</p>
	
<% 	
}
 %>
 <br>
 <div class="form-row">
  <div class="form-group col-md-3">
 <input type="text" class="form-control form-control-sm"
  value="Location: <%=j.getLocation() %>" readonly>
 </div>
 <div class="form-group col-md-3">
 <input type="text" class="form-control form-control-sm"
  value="Category: <%=j.getCategory() %>" readonly>
 </div>
 
 </div>
 <h6>
 Publish Date:
 <%=j.getPublish_date().toString() %>
 </h6>
 <div class="text-center">
 <a href="one_view.jsp?id=<%=j.getId() %>"
 class="btn btn-sm bg-success text-white">View More</a>
 </div>
</div>
</div>
<%}
%>
</div>
</div>

</div>
</body>
</html>