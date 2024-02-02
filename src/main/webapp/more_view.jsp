<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ page import="com.dao.job_dao" %>
<%@ page import="com.DB.db_connection" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="component/all_css.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="component/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-12">
<h5 class="text-center text-primary">All Jobs</h5>
<%
String loc = request.getParameter("location");
String cat = request.getParameter("category");
String msg = "";
job_dao jd = new job_dao(db_connection.getcon());
List<Jobs> list = null;

if("location".equals(loc)&&"category".equals(cat)){
	list = new ArrayList<Jobs>();
	msg = "Job Not Available";
	
}
else if("location".equals(loc) || "category".equals(cat)){
	list = jd.getJobsOrLC(loc,cat);
}else{
	list = jd.getJobsAndLC(loc,cat);
}
if(list.isEmpty()){
	%>
	<h4 class="text-center text-danger">Job Not Available</h4>
<% 
}

if(list != null){
for(Jobs j : list){
%>
<div class="card mt-5">
<div class="card-body">
<div class="text-center text-primary">
<i class="far fa-clipboard fa-2x"></i>
</div>
<h6><%=j.getTitle() %></h6>
<p><%=j.getDescription() %></p>
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
 <a href="one_view.jsp?id=<%=j.getId() %>" class="btn btn-sm bg-success text-white">View More</a>
 </div>
</div>
</div>
<% 
}
}else {
%>
<h4 class="text-center text-danger"><%=msg %></h4>
<% 
}
%>
</div>
</div>
</div>
</body>
</html>