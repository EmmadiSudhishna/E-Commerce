<%@page import="java.util.List"%>
<%@page import="com.example.model.Categories"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="./AdminTitle.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">

<meta charset="ISO-8859-1">
<title>Edit Image</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<jsp:include page="AdminMenu.jsp" />

<body class="bg-light">

	<div class="container card border-success border-3 mt-4" style="background-color: #F2F3F4  ; ">
			<h2 class="mb-4 text-center">Edit Image</h2>
			
	<form class="card-body" action="/EcommerceProject/UploadImageServlet"
		method="post" enctype="multipart/form-data">
		
				<input type='hidden' name='tableName' value='<%=request.getParameter("tableName")%>'>
				<input type='hidden' name='setColName' value='<%=request.getParameter("setColName")%>'>
				<input type='hidden' name='whereColName' value='<%=request.getParameter("whereColName")%>'>
				<input type='hidden' name='conditionValue' value='<%=request.getParameter("conditionValue")%>'>		

			<div class="row">
				<div class="col-sm-6 fw-bold">
					<label>Upload Image</label>
					<input type="file" class="form-control" name="image1">
				</div>
				
			



			<div class='row mt-3'>
			<div class="col-sm-12 text-center">
				<button type="submit"  name="submit" class=" form-control btn  btn btn-outline-primary" style='width:150px' value='Upload'>Upload</button>
			</div>
			</div>
			<br/>

			
		
	</form>
	</div>
</body>
</html>