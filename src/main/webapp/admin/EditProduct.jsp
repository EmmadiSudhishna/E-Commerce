<%@page import="java.util.List"%>
<%@page import="com.example.model.Categories"%>
<%@page import="com.example.model.Products"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="./AdminTitle.jsp"></jsp:include>

<title>Edit Products</title>

</head>

<body class="bg-light">


	<jsp:include page="AdminMenu.jsp" />


		<%
		String productCode = request.getParameter("productCode");
		Products product = new Products();
		product.setProductCode(Integer.parseInt(productCode));

		product = product.getProductByCode();
		%>

		<div class="container card border-success border-3  mt-4" style="background-color: #BFFC8B;  height: 400px; width: 1000px;">
			
				<h2 class="mb-4 text-center">Edit Product</h2>

				<form class="card-body" action="/EcommerceProject/UpdateProductServlet"
		method="post">
		

				<div class="row">
					<div class="col-sm-6">
						<label for="productCode" class="fw-bold">Product Code:</label> <input
							type="text" class="form-control" id="productCode"
							value="<%=product.getProductCode()%>" readonly name="productCode">
					</div>
					<br />

					<%
					Categories category = new Categories();
					List<String> categoryList = category.getAllCategoriesByName();
					System.out.println("categoryList=" + categoryList.size());
					%>

					<div class="col-sm-6">
						<label for="categoryName" class="fw-bold">Category Name</label> <select
							name="categoryName" class="form-control">
							<option value="<%=product.getCategoryName()%>"><%=product.getCategoryName()%></option>

							<%
							for (String categoryName : categoryList) {
								String option = "<option value='" + categoryName + "'>" + categoryName + "</option>";

								out.println(option);
							}
							%>
						</select>
					</div>
				</div>




				<div class="row">
					<div class="col-sm-6">
						<label for="productName" class="fw-bold">Product Name:</label> <input
							type="text" class="form-control" id="productName"
							value="<%=product.getProductName()%>" name="productName">
					</div>


					<div class="col-sm-6">
						<label for="description" class="fw-bold">Description:</label>
						<textarea rows="2" cols="50" class="form-control" id="description"
							name="description" value="<%=product.getDescription()%>"></textarea>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6">
						<label for="discount" class="fw-bold">Discount:</label> <input
							type="number" class="form-control" id="discount" name="discount"
							value="<%=product.getDiscount()%>">
					</div>


					<div class="col-sm-6">
						<label for="cost" class="fw-bold">Cost:</label> <input
							type="number" class="form-control" id="cost" name="cost"
							value="<%=product.getCost()%>">
					</div>
				</div>




				<div class="text-center  mt-3">
					


						<input type="submit" name="submit" class=" form-control btn btn-info" style="width: 150px"
							value="Update Product">
					</div>
				</div>
				<br>
			</div>
	</form>


</body>
</html>