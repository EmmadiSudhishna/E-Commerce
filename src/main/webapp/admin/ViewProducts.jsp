<%@page import="java.util.List"%>
<%@page import="com.example.model.Products"%>
<%@ page
	import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.util.List, com.example.model.Categories"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
 <jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="./AdminTitle.jsp"></jsp:include>
<title>View Products</title>



<script>
        function confirm_delete(productCode) {
            let ans = confirm("Want to delete this record?");
            if (ans) {
                window.location = "/EcommerceProject/DeleteProduct?productCode=" + productCode;
            }
        }
    </script>

</head>
<body>
	<jsp:include page="./AdminMenu.jsp" />
	<%
	Products product = new Products();
	List<Products> productList = product.getAllProducts(null);
	System.out.println(productList);
	%>

	<div class="container mt-3">

		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>

		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Product updated.
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Yup!</strong> Product not updated.
		</div>
		<%
		}
		}
		%>



		<h2 class="text-center"><u>View Products</u></h2>
		<div class="container mt-3">
			<div class="table-responsive">
			
				<table class="table table-bordered table-success table-hover"
					id="table_id">
					<thead class="table-dark">
						<tr>

							<th>Action</th>
							<th>Action</th>
							<th>Slno</th>
							<th>ProductCode</th>
							<th>CategoryName</th>
							<th>ProductName</th>
							<th>Description</th>
							<th>Discount</th>
							<th>Cost</th>
							<th>ProductImage1</th>
							<th>ProductImage2</th>
							<th>ProductImage3</th>
						</tr>
					</thead>
					<tbody>
						<%
				int slno = 0;
				for (Products productOb : productList) {

					slno++;
				%>
						<% System.out.println("Description: " + productOb.getDescription()); %>

						<tr>
							<!--   <td><a
						href="/EcommerceProject/DeleteProductproductCode=<%=productOb.getProductCode()%>"
						class="btn btn-danger">Delete</a></td>-->


							<td>
								<button class='btn btn-sm btn-outline-danger'
									onclick="confirm_delete(<%=productOb.getProductCode()%>)">Delete</button>
							</td>
							<td><a
								href="/EcommerceProject/admin/EditProduct.jsp?productCode=<%=productOb.getProductCode()%>"
								class='btn btn-sm btn-outline-info'>Edit</a></td>

							<td><%=slno%></td>
							<td><%=productOb.getProductCode()%></td>
							<td><%=productOb.getCategoryName()%></td>
							<td><%=productOb.getProductName()%></td>
							<td><%=productOb.getDescription()%></td>
							<td><%=productOb.getDiscount()%></td>
							<td><%=productOb.getCost()%></td>


							<td><a
								href='EditImage.jsp?tableName=products&setColName=productImage1&whereColName=productCode&conditionValue=<%=productOb.getProductCode()%>&colName=productImage1'>
									<img src='../uploads/<%=productOb.getProductImage1()%>'
									style='width: 100px; height: 100px' />
							</a></td>

							<td><a
								href='EditImage.jsp?tableName=products&setColName=productImage2&whereColName=productCode&conditionValue=<%=productOb.getProductCode()%>&colName=productImage2'>
									<img src='../uploads/<%=productOb.getProductImage2()%>'
									style='width: 100px; height: 100px'>
							</a></td>

							<td><a
								href='EditImage.jsp?tableName=products&setColName=productImage3&whereColName=productCode&conditionValue=<%=productOb.getProductCode()%>&colName=productImage3'>

									<img src='../uploads/<%=productOb.getProductImage3()%>'
									style='width: 100px; height: 100px'>
							</a></td>
						</tr>

						<%
						}
						%>
					</tbody>
				</table>
			
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
			
			$('#success_id').slideUp(3000);
		});
	</script>
</body>
</html>
