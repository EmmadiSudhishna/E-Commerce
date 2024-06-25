<%@page import="com.example.model.Ratings"%>
<%@page import="com.example.model.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Customerorders"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Orders History</title>
<jsp:include page="../Header.jsp" />
<jsp:include page="../CustomerNav.jsp" />

<script>
        function confirm_delete(orderId) {
            let ans = confirm("Want to Cancel this product?");
            if (ans) {
                window.location = "/EcommerceProject/UpdateCustomerOrderStatusServlet?orderId=" + orderId +"&orderStatus=Cancelled";
            }
        }
        
        
        function redirectToRating(productCode) {
            
            window.location = '/EcommerceProject/Customer/Rating.jsp?productCode=' + productCode;
        }

    </script>

</head>
<body>





	<%
	Customerorders corders = new Customerorders();

	int customerId = (int) session.getAttribute("customerId");
	List<Customerorders> cordersList = corders.getAllCustomerOrders();
	System.out.println("cordersList=" + cordersList.size());
	%>


	<div class="container-fluid mt-4">


		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>

		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Product Cancelled.
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Yup!</strong> Product not Cancelled.
		</div>
		<%
		}
		}
		%>


		<h2 class="text-center text-danger">
			<u>Orders History</u>
		</h2>
		<div class="table-responsive">
			<table class="table table-bordered table-secondary table-hover"
				id="table_id">

				<thead class="table-dark">
					<tr class="text-center">

						<th>Slno</th>
						<th>Order Id</th>
						<th>Customer Id</th>
						<th>Invoice Number</th>
						<th>Product Code</th>
						<th>Product Name</th>
						<th>Product Image</th>
						<th>Order Date</th>
						<th>Cost</th>
						<th>Discount Amount</th>
						<th>Qty</th>
						<th>Gst Amount</th>
						<th>Bill Amount</th>
						<th>Status</th>
						<th>Operation</th>
						<th>Operation</th>


					</tr>
				</thead>
				<tbody>
					<%
					int slno = 0;
					Products product = new Products();
					for (Customerorders cordersOb : cordersList) {

						slno++;
					%>
					<tr>
						<td><%=slno%></td>
						<td><%=cordersOb.getOrderId()%></td>
						<td class="text-center"><%=cordersOb.getCustomerId()%></td>
						<td><%=cordersOb.getInvoiceNumber()%></td>
						<td class="text-center"><%=cordersOb.getProductCode()%></td>
						<%
						System.out.println("pcode=" + cordersOb.getProductCode());
						product.setProductCode(cordersOb.getProductCode());
						product = product.getProductByCode();
						%>

						<td class="text-center"><%=product.getProductName()%></td>

						<td><img src='../uploads/<%=product.getProductImage1()%>'
							style='width: 60px; height: 50px' /></td>

						<td class="text-center"><%=cordersOb.getOrderDateTime()%></td>
						<td class="text-end"><%=cordersOb.getCost()%></td>
						<td class="text-end"><%=cordersOb.getDiscountAmount()%></td>
						<td class="text-end"><%=cordersOb.getQuantity()%></td>
						<td class="text-end"><%=cordersOb.getGstAmount()%></td>
						<td class="text-end"><%=cordersOb.getBillAmount()%></td>
						<td><%=cordersOb.getOrderStatus()%></td>



						<td>
							<%
							System.out.println("status= " + cordersOb.getOrderStatus().toString());
							if (cordersOb.getOrderStatus().toString().equalsIgnoreCase("pending")) {
							%> <input type="button" class="btn btn-sm btn-warning"
							value="Cancel"
							onclick="confirm_delete(<%=cordersOb.getOrderId()%>)" /> <%
 }
 %> &nbsp;
						</td>
						<td>
							<%
							Ratings rating = new Ratings();
							boolean found = rating.isRatingGiven(Integer.parseInt(session.getAttribute("customerId").toString()),
									cordersOb.getProductCode());
							if (found == false) {
							%> <a class="btn btn-sm btn-success"
							onclick="redirectToRating('<%=cordersOb.getProductCode()%>')">Rating</a>
						</td>
						<%
						}
						%>

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