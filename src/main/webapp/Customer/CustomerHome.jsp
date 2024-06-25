<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Products"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="../CustomerMenu.jsp" />

<style>
  /* Custom styling for pink heart icon */
  .heart-icon {
    color: #ff1493;
    transition: color 0.3s;
  }
  .cart-icon {
    color: #FFD700;
    transition: color 0.3s;
  }

  .star-icon {
    color: #17a2b8; 
    transition: color 0.3s;
  }
  
  /*hover effect*/
  .heart-icon:hover {
    color: #ff66b2; /* Lighter Pink Color Code on hover */
  }

  .cart-icon:hover {
    color: #ffc07b; /* Lighter Yellow Color Code on hover */
  }

  .star-icon:hover {
    color: #4da6ff; /* Lighter Blue Color Code on hover */
  }
  
</style>

</head>
<body>

		<%
		Products product = new Products();
		List<Products> productList=new ArrayList<Products>();  //empty product list
		
		String search = request.getParameter("search");
		if(search==null){  //without search
			
			productList = product.getAllProducts(null);
			System.out.print(productList);
		}else{ //with search
			System.out.print("search: " + search);
			productList = product.getAllProducts(search);
			
		}
		
		
		
		%>
		
	<div class="container mt-2">
	<h3 class="text-center">View Products</h3>
		<div class="row">
			<%
			int slno = 0;
			for (Products productOb : productList) {
			%>
			<div class="col-sm-3 mt-2">
				<div class="card"
					style="width: 90%; height: 90%; background-color: #f0f0f0;">
					<img src="../uploads/<%=productOb.getProductImage1()%>"
						class="img-centered mx-auto d-block" alt="Responsive image"
						style="width: 110px; height: 110px; object-fit: contain;">
					<div class="card-body style=" height: 90px; overflow:hidden;">
						<h3 class="card-title"
							style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%=productOb.getProductName()%></h3>
						<p class='card-text'><%=productOb.getDescription()%></p>
						<p class="card-text float-start">
							<Strong>Cost:</Strong><%=productOb.getCost()%></p>
					</div>
					<div class="card-footer">
						<a href='/EcommerceProject/AddtoWishListServlet?productCode=<%=productOb.getProductCode()%>' class="btn btn-sm  heart-icon" float-right"><i class="fas fa-heart fa-2x"></i></a>
						<a href='/EcommerceProject/AddToCartServlet?productCode=<%=productOb.getProductCode()%>' class="btn btn-sm cart-icon" float-end"><i class="fas fa-cart-plus fa-2x"></i></a>
						<a href='/EcommerceProject/Customer/Review.jsp?productCode=<%=productOb.getProductCode()%>' class="btn btn-sm star-icon"><i class="fas fa-star fa-2x"></i></a>
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