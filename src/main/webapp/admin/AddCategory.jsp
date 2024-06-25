<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
   <jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="./AdminTitle.jsp"></jsp:include>
</head>
<body class="bg-light">

<jsp:include page="AdminMenu.jsp"></jsp:include> 
    <div class="container card border-success border-3  mt-5">
        
            <form class="card-body"  action="/EcommerceProject/AddCategory" method="post">
                <h2 class="mb-4 text-center">Add Category</h2>

                <div class="form-group">
                    <label for="categoryName" class="fw-bold">Category Name:</label>
                    <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                </div>

                
                <div class="text-center mt-2">
                    <button type="submit" class="btn btn-primary">Add Category</button>
                </div>
                <%
                String res=request.getParameter("res");
                if(res!=null){
                	if(res.equals("0")){
                		out.println("<h4 style='color:red'>category not added</h4>");
                	}else{
                		out.println("<h4 style='color:green'>category  added</h4>");
                	}
                }
                %>
            </form>
        </div>
    </div>

    
</body>
</html>
