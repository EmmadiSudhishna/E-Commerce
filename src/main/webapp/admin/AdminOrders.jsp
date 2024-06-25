<%@page import="com.example.model.Ratings"%>
<%@page import="com.example.model.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Customerorders"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="./AdminTitle.jsp"></jsp:include>
<title>Orders History</title>

<script>
	   function confirm_update(orderId,orderStatus ) {
        let ans = confirm("Do you want to dispatch this Order?");
           if (ans) {
               window.location = "/EcommerceProject/UpdateCustomerOrderStatusServlet?n=2&orderId=" +orderId +"&orderStatus=Dispatched";
            }
    }
	</script>


</head>
<body>
	<jsp:include page="./AdminMenu.jsp" />
	<%
	Customerorders corders = new Customerorders();

	//int customerId = (int) session.getAttribute("customerId");
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
			<strong>Success!</strong> Product Dispatched.
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Yup!</strong> Product not Dispatched.
		</div>
		<%
		}
		}
		%>


		<h2 class="text-center text-danger">
			<u>Admin Orders</u>
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
						<td class="text-center"><%=cordersOb.getOrderId()%></td>
						<td class="text-center"><%=cordersOb.getCustomerId()%></td>
						<td class="text-center"><%=cordersOb.getInvoiceNumber()%></td>
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
							%> <input type="submit" class="btn btn-sm btn-warning"
							value="Update"
							onclick="confirm_update(<%=cordersOb.getOrderId()%>)" /> <%
 }
 %>


						</td>

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