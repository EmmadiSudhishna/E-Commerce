<%@page import="com.example.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Profile</title>
<jsp:include page="../Header.jsp" />
<jsp:include page="../CustomerNav.jsp" />
</head>
<body>
	
	
	<form action="/EcommerceProject/UpdateCustomerDataServlet"
			method="post" >
			
			

	<div class="container mt-4">
		
				<div class="card w-100 mx-auto border-warning border-4 bg-light text-dark"
					style="max-width: none;">
					<div class="card-body">
						<h2 class="card-title text-center mb-4">Edit Profile</h2>

						<%
						String res = request.getParameter("res");
						if (res != null) {
							if (res.equals("1")) {
						%>
						<div class="alert alert-success alert-dismissible" id='success_id'>
							<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							<strong>Success!</strong> *Updated ..!
						</div>
						<%
						} else if (res.equals("0")) {
						%>
						<div class="alert alert-danger alert-dismissible" id='success_id'>
							<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							<strong>Success!</strong> *Account not Updated..!
						</div>
						<%
						}
						}
						%>
						<%
						Customer customers = new Customer();
						customers.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
						customers = customers.getCustomerProfileById();
						%>


						<div class="row">
							<div class="col-md-6 mx-auto">
								
									<label for="customerId" class="form-label fw-bold">Customer
										Id :</label> <input type="text" class="form-control" id="customerId"
										name="customerId" value='<%=customers.getCustomerId()%>'
										placeholder="Enter your customerId">
	

								
									<label for="firstName" class="form-label fw-bold">First
										Name:</label> <input type="text" class="form-control" id="firstName"
										name="firstName" value='<%=customers.getFirstName()%>'
										placeholder="Enter your first name">
								
							</div>

							<div class="col-md-6 mx-auto">
								
									<label for="lastName" class="form-label fw-bold">Last
										Name:</label> <input type="text" class="form-control" id="lastName"
										name="lastName" value='<%=customers.getLastName()%>'
										placeholder="Enter your last name">
								

								
									<label for="mobileNumber" class="form-label fw-bold">Mobile
										Number:</label> <input type="text" class="form-control"
										id="mobileNumber" name="mobileNumber"
										value='<%=customers.getMobileNumber()%>'
										placeholder="Enter your mobile number">
								
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mx-auto">
								
									<label for="emailId" class="form-label fw-bold">Email
										Id:</label> <input type="text" class="form-control" id="emailId"
										name="emailId" value='<%=customers.getEmailId()%>'
										placeholder="Enter your E-mail">
								
							</div>

							<div class="col-md-6 mx-auto">
								
									<label for="password" class="form-label fw-bold">Password:</label>
									<input type="password" class="form-control" id="password"
										name="password" value='<%=customers.getPassword()%>'
										placeholder="Enter your Password">
								
								
									<label for="registerDate" class="form-label fw-bold">Register
										Date:</label> <input type="Date" class="form-control"
										id="registerDate" name="registerDate"
										value='<%=customers.getRegisterDate()%>'
										placeholder="Enter your registerDate">
								
							</div>
						</div>
						<div class="text-center mt-2">
							<input type="submit" name="submit" class="btn btn-info"
								value="Upload">
						</div>
					</div>
				</div>
				</div>
		</form>
	
</body>
</html>