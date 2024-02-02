<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ page import="com.dao.job_dao" %>
<%@ page import="com.DB.db_connection" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/all_css.jsp" %>

</head>
<body>
<%@include file="component/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-12">
<% 
int id = Integer.parseInt(request.getParameter("id"));
job_dao jd = new job_dao(db_connection.getcon()) ;
Jobs j = jd.getJobById(id);
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
</div>
</div>
</div>
</div>
</div>
</body>
</html>