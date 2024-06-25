<%@page import="java.util.List"%>
<%@page import="com.example.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="../CustomerNav.jsp" />


<link rel="icon" href="favicon.png" type="image/png">
<style>
@keyframes glow {from { box-shadow:010px#4CAF50, 020px#4CAF50, 030px#4CAF50;
	
}

to {
	box-shadow: 0 0 20px #00ff00, 0 0 30px #4CAF50, 0 0 40px #4CAF50;
}

}
.card::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: -1;
	border-radius: 10px;
	animation: glow 1s infinite alternate;
	background-color: dark;
	
}

.customer-profile-header {
	background-color: #F08080;
	color: white;
	padding: 20px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.card-body {
	background-color: #F5F5DC;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
}

.customer-img {
	width: 120px;
	height: 120px;
	border: 6px solid #007bff;
	border-radius: 50%;
	margin-bottom: 20px;
}

.edit-icon {
	width: 30px;
	height: 30px;
}
   .card {
            width: 100%;
            max-width: 750px; /* Maximum width for medium and large screens */
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            background-color: #F5F5DC;
        }
         @media (max-width: 576px) {
            .card {
                max-width: 95%; /* Adjusted width for small screens */
            }
  
</style>

</head>
<body>

	<br />
	<%
	Customer customer = new Customer();
	List<Customer> customerList = customer.getCustomerById((int) session.getAttribute("customerId"));
	for (Customer customers : customerList) {
	%>
	<div class="container-fluid mt-2">
		<div class="row">
			<div class="col-md-6 mx-auto">

				<div class="card" style="width: 400px;">


					<div class="card-header text-center customer-profile-header">
						<h2 class="animate__animated animate__bounce">Customer
							Profile</h2>


						<img src='../uploads/<%=customers.getProfilePic()%>'
							class="img img-center rounded-pill img-fluid"
							style="width: 120px; height: 120px; border: 6px solid #AFEEEE;" />
						<br/> <a
							href='/EcommerceProject/Customer/CustomerEditProfile.jsp?tableName=customers&setColName=profilePic&whereColName=customerId&conditionValue=<%=customers.getCustomerId()%>&colName=profilePic'>
							<img src="../uploads/editicon.png" alt="Edit Image"
							style="width: 30px; height: 30px;">
						</a>
					</div>
					<div class="card-body">
						<!-- Customer details -->
						
							<div class="row">
								<div class="col-sm-6">
									<h6>Customer Id:</h6>
									<%=customers.getCustomerId()%></p>
								</div>
								<div class="col-sm-6">
									<h6>First Name:</h6>
									<%=customers.getFirstName()%></p>
								</div>
								<div class="col-sm-6">
									<h6>Last Name:</h6>
									<%=customers.getLastName()%></p>
								</div>
								<div class="col-sm-6">
									<h6>Mobile Number:</h6>
									<%=customers.getMobileNumber()%></p>
								</div>
								<div class="col-sm-6">
									<h6>Email Id:</h6>
									<%=customers.getEmailId()%></p>
								</div>
								<div class="col-sm-6">
									<h6>Password:</h6>
									<%=customers.getPassword()%></p>
								</div>
								<div class="col-sm-6">
									<h6>Register Date:</h6>
									<%=customers.getRegisterDate()%></p>
								</div>
								
							</div>

							<div class="text-center mb-3">

								<div class="col-sm-8">
									<a href="/EcommerceProject/Customer/EditProfile.jsp?customerId=<%=customers.getCustomerId()%>">
										<button type="submit" class="btn btn-info">Edit Profile</button>
									</a>
								</div>
							</div>
						
					</div>

				</div>
			</div>
		</div>
	</div>

	<%
	} // End of for loop
	%>

	
</body>
</html>
