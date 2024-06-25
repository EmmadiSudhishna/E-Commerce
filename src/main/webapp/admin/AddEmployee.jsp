<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Add employee</title>
 <jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="./AdminTitle.jsp"></jsp:include>
</head>
<body>

	
	<jsp:include page="./AdminMenu.jsp" />

	<div class="container mt-4">
		<form action="/EcommerceProject/AddEmployeeServlet" method="post"
			enctype="multipart/form-data" >
			<div class="card mx-auto border-warning border-2 bg-light text-dark"
				style="max-width: 1000px; max-height: 500;">
				<div class="card-body">
					<h2 class="card-title text-center mb-4">Add Employee</h2>

					<div class="row">
						<div class="col-md-6">
						<div class="mb-3">
								<label for="employeeId" class="form-label fw-bold">EmployeeId
									:</label> <input type="text" class="form-control" id="employeeId"
									name="employeeId" placeholder="Enter your employeeId">
							</div>
						
							<div class="mb-3">
								<label for="firstName" class="form-label fw-bold">First
									Name:</label> <input type="text" class="form-control" id="firstName"
									name="firstName" placeholder="Enter your first name">
							</div>

							<div class="mb-3">
								<label for="lastName" class="form-label fw-bold">Last
									Name:</label> <input type="text" class="form-control" id="lastName"
									name="lastName" placeholder="Enter your last name">
							</div>

							<div class="mb-3">
								<label for="gender" class="form-label fw-bold">Gender:</label> <select
									class="form-control" id="gender" name="gender" required>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
								</select>
							</div>

							<div class="mb-3">
								<label for="mobile" class="form-label fw-bold">Mobile
									Number:</label> <input type="text" class="form-control" id="mobile"
									name="mobile" placeholder="Enter your mobile number">
							</div>
						</div>

						<div class="col-md-6">

							<div class="mb-3">
								<label for="email" class="form-label fw-bold">Email
									Id:</label> <input type="text" class="form-control" id="email"
									name="email" placeholder="Enter your E-mail">
							</div>

							<div class="mb-3">
								<label for="text" class="form-label fw-bold">Designation:</label>
								<input type="designation" class="form-control" id="designation"
									name="designation">
							</div>

							<div class="mb-3">
								<label for="password" class="form-label fw-bold">Password:</label>
								<input type="password" class="form-control" id="password"
									name="password" placeholder="Enter your Password">
							</div>
							


							<div class="mb-3">
								<label for="employeepic" class="form-label fw-bold">Employee
									Pic :</label> <input type="file" class="form-control" id="employeepic"
									name="employeepic">
							</div>
							
						</div>


					</div>
				</div>

				
				<div class="text-center mb-2">
					<button type="submit" class="btn btn-success">Add Employee</button>
				</div>

			</div>
	</div>
	
	
	

	<!--  <div class="footer mt-5 bg-dark text-white text-center fixed-bottom">
		<div class="container">
			<p>&lt;&lt; &lt;&copy; 2023 EMMADI Group of Companies. All rights
				reserved &gt;&gt;&gt;</p>
			<p>
				<a href="index.jsp">Back to Home</a>
			</p>
		</div>
	</div>-->

</body>
</html>
