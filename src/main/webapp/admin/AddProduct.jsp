<%@page import="java.util.List"%>
<%@page import="com.example.model.Categories"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../Header.jsp"></jsp:include>
    <jsp:include page="./AdminTitle.jsp"></jsp:include>
    <title>Add product</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-group {
            margin-bottom: 1.5rem;
        }

        @media (max-width: 768px) {
            .form-group {
                margin-bottom: 1rem;
            }
        }
    </style>
</head>

<jsp:include page="./AdminMenu.jsp" />

<body class="bg-light">

<%
Categories category = new Categories();
List<String> categoryList = category.getAllCategoriesByName();
System.out.print(categoryList);
%>

<div class="container card border-success border-3 mt-4" style="background-color: #BFFC8B;">
    <form class="card-body" action="/EcommerceProject/AddProduct" method="post" enctype="multipart/form-data">
        <h2 class="mb-4 text-center">Add Product</h2>
        <div class="form-group row">
            <div class="col-md-6">
                <label for="productCode" class="fw-bold">Product Code:</label>
                <input type="number" class="form-control" id="productCode" name="productCode" required>
            </div>
            <div class="col-md-6">
                <label for="categoryName" class="fw-bold">Category Name:</label>
                <select name="categoryName" class="form-control">
                    <%
                    for (String categoryNames : categoryList) {
                        String option = "<option value='" + categoryNames + "'>" + categoryNames + "</option>";
                        out.println(option);
                    }
                    %>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6">
                <label for="productName" class="fw-bold">Product Name:</label>
                <input type="text" class="form-control" id="productName" name="productName" required>
            </div>
            <div class="col-md-6">
                <label for="description" class="fw-bold">Description:</label>
                <textarea rows="2" class="form-control" id="description" name="description"></textarea>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6">
                <label for="discount" class="fw-bold">Discount:</label>
                <input type="number" class="form-control" id="discount" name="discount">
            </div>
            <div class="col-md-6">
                <label for="cost" class="fw-bold">Cost:</label>
                <input type="number" class="form-control" id="cost" name="cost">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6">
                <label for="productImage1" class="fw-bold">Product Image1:</label>
                <input type="file" class="form-control" id="productImage1" name="productImage1">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6">
                <label for="productImage2" class="fw-bold">Product Image2:</label>
                <input type="file" class="form-control" id="productImage2" name="productImage2">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6">
                <label for="productImage3" class="fw-bold">Product Image3:</label>
                <input type="file" class="form-control" id="productImage3" name="productImage3">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Add Product</button>
            </div>
        </div>
        <%
        String res = request.getParameter("res");
        if (res != null) {
            if (res.equals("0")) {
                out.println("<h4 style='color:red'>Product not added</h4>");
            } else {
                out.println("<h4 style='color:green'>Product added</h4>");
            }
        }
        %>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
