<%@page import="java.util.List"%>

<%@page import="com.example.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="./AdminTitle.jsp"></jsp:include>
<script>
        function confirm_delete(customerId) {
            let ans = confirm("Want to delete this customer?");
            if (ans) {
                window.location = "/EcommerceProject/DeleteCustomerServlet?customerId=" + customerId;
            }
        }
    </script>
</head>
<body>
    <jsp:include page="./AdminMenu.jsp" />

    <%
    Customer customer = new Customer();
    List<Customer> customerList = customer.getAllCustomers();
    %>

    <div class="container mt-2">
        <div class=" mx-auto border-success" style="max-width: 1000px;">
            
                <h2 class=" text-center mb-4"><u>View Customers</u></h2>
				
				<div class="table-responsive">
                <table class="table table-striped table-success table-hover" id="table_id">
                    <thead class="table-dark">
                        <tr>
                            <th>Slno</th>
                            <th>Customer ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Mobile No</th>
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int slno = 0;
                        for (Customer customerOb : customerList) {
                            slno++;
                        %>
                        <tr>
                            <td><%=slno%></td>
                            <td><%=customerOb.getCustomerId()%></td>
                            <td><%=customerOb.getFirstName()%></td>
                            <td><%=customerOb.getLastName()%></td>
                            <td><%=customerOb.getMobileNumber()%></td>
                            <td><%=customerOb.getEmailId()%></td>
                           
                            <td>
                                <button class='btn btn-sm btn-outline-danger' onclick="confirm_delete(<%=customerOb.getCustomerId()%>)">Delete</button>
                               <!--  <a href="/EcommerceProject/admin/EditCustomer.jsp?customerId=<%=customerOb.getCustomerId()%>" class='btn btn-sm btn-info'>Edit</a>--> 
                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- <div class="footer mt-5 bg-dark text-white text-center fixed-bottom">
        <div class="container">
            <p>&lt;&lt; &lt;&copy; 2023 EMMADI Group of Companies. All rights reserved &gt;&gt;&gt;</p>
            <p>
                <a href="index.jsp">Back to Home</a>
            </p>
        </div>
    </div> -->
    
    <script>
		$(document).ready(function() {
			$('#table_id').DataTable();
			
			$('#success_id').slideUp(3000);
		});
	</script>
</body>
</html>
