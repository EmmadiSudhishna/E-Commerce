<%@page import="com.example.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
     <jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="./AdminTitle.jsp"></jsp:include>
    <title>Edit Category</title>
</head>

<jsp:include page="AdminMenu.jsp" />

<body class="bg-light">
    <%
        String employeeId = request.getParameter("employeeId");
        Employee employee = new Employee();
        employee.setEmployeeId(Integer.parseInt(employeeId));
        employee = employee.getEmployeeById();
    %>

    <div class="container mt-5">
        <div class="card border-success border-4">
            <form class="card-body" style="background-color:#BFFC8B;"
            " action="/EcommerceProject/UpdateEmployeeServlet" method="post">

                <h2 class="mb-4 text-center">Edit Employee</h2>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="employeeId" class="fw-bold">EmployeeId:</label>
                            <input type="text" class="form-control" id="employeeId" name="employeeId"
                                value="<%=employee.getEmployeeId()%>">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="firstName" class="fw-bold">First Name:</label>
                            <input type="text" class="form-control" id="firstName" name="firstName"
                                value="<%=employee.getFirstName()%>">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="lastName" class="fw-bold">Last Name:</label>
                            <input type="text" class="form-control" id="lastName" name="lastName"
                                value="<%=employee.getLastName() %>">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="gender" class="fw-bold">Gender:</label>
                            <input type="text" class="form-control" id="gender" name="gender"
                                value="<%=employee.getGender()%>">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="mobile" class="fw-bold">Mobile:</label>
                            <input type="text" class="form-control" id="mobile" name="mobile"
                                value="<%=employee.getMobile()%>">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="email" class="fw-bold">Email:</label>
                            <input type="text" class="form-control" id="email" name="email"
                                value="<%=employee.getEmail()%>">
                        </div>
                    </div>
                </div>

                
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="password" class="fw-bold">Password:</label>
                            <input type="password" class="form-control" id="password" name="password"
                                value="<%=employee.getPassword()%>">
                        </div>
                    </div>
                    
                    <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="designation" class="fw-bold">Designation:</label>
                            <input type="text" class="form-control" id="designation" name="designation"
                                value="<%=employee.getDesignation()%>">
                        </div>
                    </div>
                    
                </div>

                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-info">Update Employee</button>
                </div>
            </form>
        </div>
    </div>

    <%
        String res = request.getParameter("res");
        if (res != null) {
            if (res.equals("0")) {
                out.println("<h4 style='color:red'>Employee not updated</h4>");
            } else {
                out.println("<h4 style='color:green'>Employee updated</h4>");
            }
        }
    %>

</body>
</html>
