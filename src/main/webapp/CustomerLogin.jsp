<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"></jsp:include>
	<jsp:include page="Title.jsp"></jsp:include>     
 <style>
  @keyframes pulse { 
    0% {   <!-- this is for customerLogin animation-->
        transform: scale(1);
    }
    50% {
        transform: scale(1.1);
    }
    100% {
        transform: scale(1);
    }
}


.card-title {
    animation: pulse 2s infinite; <!--this is also for customer login-->
}

@keyframes slideIn {
    0% {
        transform: translateY(-100%);
        opacity: 0;
    }
    100% {
        transform: translateY(0);
        opacity: 1;
    }
}

.card {
    animation: slideIn 1s ease-in-out;
}
.custom-border{
	animation: slideIn 1s ease-in-out;
}

/* Container Animation */
@keyframes fadeIn {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}





.card-body img {
    width: 200px;
    height: 200px;
    border-radius: 50%;
    filter: drop-shadow(0px 0px 10px #4535c8);
    animation: glow 4s linear infinite;
    margin: 10px;
}

/* Glowing animation */
@keyframes glow {<!--this is for customer logo image-->
    0% {
        filter: drop-shadow(0 0 1rem rgb(9, 255, 0.5));
    }
    33% {
        filter: drop-shadow(0 0 1rem rgba(1, 6, 255, 0.5));
    }
    66% {
        filter: drop-shadow(0 0 1rem rgba(255, 0, 0, 0.5));
    }
    100% {
        filter: drop-shadow(0 0 1rem rgb(9, 255, 0.5));
    }
}


</style>
               
</head>
<body>
    <jsp:include page="Menu.jsp" />

    <div class="container mt-3">
        <div class="card mx-auto custom-border" style="max-width: 500px; border-color: #87CEEB; border-width:3px;">
            <div class="card-body">
                <h2 class="card-title text-center mb-4">Customer Login</h2>
                <div class="text-center mb-3">
                    <img src="uploads/CustomerLogo.png" alt="Logo" style="width: 100px; height: 100px; border-radius: 50%;">
                </div>
                <form method="POST" action="/EcommerceProject/CustomerLoginValidationServlet1">
                    <div class="form-group mb-2">
    <label for="emailId" class="fw-bold">Email Id:</label>
    <input type="text" class="form-control" id="emailId"  placeholder="EmailId" name="emailId" required>
</div>
                    <div class="form-group mb-2">
    <label for="password" class="fw-bold">Password:</label>
    <input type="password" class="form-control" id="password"  placeholder="Password" name="password" required>
</div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-success mt-4">Sign in</button>
                    </div>
                        

                    <!-- Registration link for new customers -->
                    <div class="form-group mb-2 text-center">
                        <small>New Customer <a href="CustomerRegistration.jsp">Register?</a></small>
                    </div>

                    <% if (request.getParameter("res") != null && request.getParameter("res").equals("0")) { %>
                        <h6 class="text-danger mt-3 text-center">Invalid username/password</h6>
                    <% } %>
                </form>
            </div>
        </div>
    </div>

    
</body>
</html>
