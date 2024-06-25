<%@page import="com.example.model.WishList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Products"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="../CustomerNav.jsp" />

</head>
<body>

	<%
	WishList wishlist = new WishList();
	
	List<Products> ListProducts = wishlist.getAllWishListProductsByCustomerId ((int)session.getAttribute("customerId"));
	System.out.print(ListProducts.size());
	%>

	<div class="container mt-2">
		<h3 class="text-center">View Products</h3>
		<div class="row">
			<%
			int slno = 0;
			for (Products productOb : ListProducts) {
			%>

			<div class="col-sm-4 mt-2">
				<div class="card"
					style="width: 18rem; height: 90%; background-color: #f0f0f0;">
					<img src="../uploads/<%=productOb.getProductImage1()%>"
						class="img-centered mx-auto d-block" alt="not found"
						style="width: 100px; height: 150px; object-fit: contain;">
					<div class="card-body style="height: 80px; overflow:hidden;">
						<h3 class="card-title"
							style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%=productOb.getProductName()%></h3>
						<p class='card-text'><%=productOb.getDescription()%></p>
						<p class="card-text float-start">
							<Strong>Cost:</Strong><%=productOb.getCost()%></p>
					</div>
					<div class="card-footer">
						<a
							href='/EcommerceProject/AddtoWishListServlet?productCode=<%=productOb.getProductCode()%>'
							class="btn btn-sm btn-primary float-start">AddCart</a> <a
							href='/EcommerceProject/DeleteWishlistItemServlet?productCode=<%=productOb.getProductCode()%>'
							class="btn btn-sm btn-danger float-end">Delete</a>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
	</div>


</body>
</html>