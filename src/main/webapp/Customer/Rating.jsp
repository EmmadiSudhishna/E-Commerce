<%@page import="com.example.model.Products"%>
<%@page import="com.example.model.Customerorders"%>
<%@page import="com.example.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Rating</title>
<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="../CustomerNav.jsp" />

<style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .card {
            border: 3px solid #007bff;
            border-radius: 25px;
        }

        .card-header {
            background-color: #007bff;
            color: dark;
            border-radius: 20px 20px 0 0;
        }

        .product-image {
            width: 100px;
            height: 90px;
        }

        .rating-select {
            width: 100%;
        }
    </style>

</head>
<body>
	<%
	String productCode = request.getParameter("productCode");
	Products product = new Products();
	product.setProductCode(Integer.parseInt(productCode));
	product = product.getProductByCode();
	%>

	<div class="container mt-4">
		<div class="card border-primary border-3 p-4"
			style="background-color: #c1ecc1; width: 100%">
			<form action="/EcommerceProject/AddRatingServlet" method="post">
			<h2 class="card-header text-center" style="background-color: orange;">
				<i class="fas fa-thumbs-up"></i> USERS RATINGS
			</h2><br/>
			<div class="row mt-2">
				<!-- Product Image Section -->
				<div class="col-md-12 text-center">
					<label for="name" class="fw-bold">Product Image:</label> <img
						src='../uploads/<%=product.getProductImage1()%>'
						style='width: 100px; height: 90px' />
				</div>
				
				 
				
				
				<!-- Product Details Section -->
				<div class="col-md-6">
				<input type="hidden" name="productCode" value="<%=product.getProductCode()%>">
					<label for="name" class="fw-bold">Product Code:</label> <span><%=product.getProductCode()%></span><br/><br/>

					<label for='productName' class="fw-bold">Product Name:</label> <span><%=product.getProductName()%></span><br/><br/>

					<div class="col-md-6 mb-2">
						
							<label for="rating" class="fw-bold">Ratings:</label> <select
								class="form-control" id="rating" name="rating">
								<option value=""></option>
								<!-- Using the HTML entities -->
								<option value="5">&#128516;&#128516;&#128516;&#128516;&#128516;</option>
								<!--  excellent -->
								<option value="4">&#128522;&#128522;&#128522;&#128522;</option>
								<!-- good -->
								<option value="3">&#128528;&#128528;&#128528;</option>
								<!-- average -->
								<option value="2">&#128533;&#128533;</option>
								<!--  bad -->
								<option value="1">&#128542;</option>
								<!-- terrible -->
							</select>
						</div>
						<label for='comments' class="fw-bold">Comments:</label>
						<textarea class="form-control" rows="4" cols="10"
							placeholder="Write a Review" name="comments"></textarea>
					</div>
				</div>

				<br />
				<div class="text-center mt-3">
					<button type="submit" class="btn btn-outline-info">+
						RATING</button>
				</div>
			</div>
		</div>
</body>
</html>