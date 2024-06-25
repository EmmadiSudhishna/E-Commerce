<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"></jsp:include>
	<jsp:include page="Title.jsp"></jsp:include>
<style>
@keyframes glow {
    0% {
        box-shadow: 0 0 10px rgba(0, 123, 255, 0.8);
    }
    50% {
        box-shadow: 0 0 20px rgba(0, 123, 255, 0.8);
    }
    100% {
        box-shadow: 0 0 10px rgba(0, 123, 255, 0.8);
    }
}

.card-glow {
    background-color: #ffffff;
    color: #333333;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 0 10px rgba(255, 0,0, 0.8);
    transition: transform 0.3s;
    animation: glow 2s infinite;
}

.card-glow:hover {
box-shadow: 0 0 10px rgba(0, 255, 0, 0.8);
    transform: scale(1.05);
    animation: none; /* Disable the glow animation on hover */
}
    .login-title {
        color: #333333;
        font-size: 2.5rem;
    }

 
</style>

 
 
</head>
<body>
	<jsp:include page="Menu.jsp" />


	<div class="container mt-4 animate__animated animate__fadeIn">
		<div class="card border-2 mx-auto border-info animate__animated animate__fadeInUp animate__delay-1s card-glow" style="max-width: 480px;" id="loginCard">
			<div class="card-body">
				<h2 class="card-title text-center mb-4 login-title">Login</h2>
				
				 <div class="text-center mb-3">
                <img src="uploads/img_avatar1.png" alt="Logo" style="width: 100px; height: 100px; border-radius: 50%;">
            </div>
				<form method="POST"  action="/EcommerceProject/AdminLoginValidationServlet1">
					<div class="form-group mb-2">
    <label for="username" class="fw-bold">Username:</label>
    <input type="text" class="form-control" id="username" placeholder="Username" name="username" required>
</div>
					<div class="form-group mb-2">
    <label for="password" class="fw-bold">Password:</label>
    <input type="password" class="form-control" id="password"  placeholder="Password" name="password"  required>
</div>
					<div class="form-group mb-2">
    <label for="role" class="fw-bold">Role:</label>
    <div class="d-flex">
    <select class="form-control"  name="role">
        <option value=""></option>
        <option value="admin">ADMIN</option>
        <option value="customer">Customer</option>
    </select>
</div>
</div>	
<div class="text-center">
    <button type="submit" class="btn btn-outline-success mt-3">Sign In</button>
</div>	

					<!-- Display error message if present -->
                <%
                if (request.getParameter("res") != null && request.getParameter("res").equals("0")) {
                	out.println("<h6 class='text-danger mt-3 text-center '>Invalid username/password</h6>");
                }
                %>
				</form>
			</div>
		</div>
	</div>
	
	
	
	  <!--  <div class="footer mt-5  bg-dark text-white text-center fixed-bottom">
    <div class="container">
    <p>&lt;&lt; &lt;&copy; 2023 EMMADI Group of Companies. All rights reserved &gt;&gt;&gt;</p>
    <p>
      <a href="index.jsp">Back to Home</a></p>
  </div>
  </div>-->


</body>
</html>