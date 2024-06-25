<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <jsp:include page="Header.jsp" />
    <jsp:include page="Title.jsp" />
 
  
 
</head>
<body>
	

<%
    session.invalidate();
%>

<center class="mt-4">
 
<h1 style="color: green;">You have been successfully logged out</h1>



<button type="button"
			class="btn btn-outline-danger float-left"><a href="index.jsp">Back to Index page</button>
			</center>
</body>
</html>
