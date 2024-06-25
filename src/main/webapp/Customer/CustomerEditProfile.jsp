<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Customer Edit Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="../CustomerMenu.jsp" />
    <div class="container mt-5">
        <div class="card mx-auto" style="max-width: 400px;">
            <div class="card-header bg-dark text-white text-center">
                <h5 class="font-weight-bold">Edit Image</h5>
            </div>
            <div class="card-body">
                <form action="/EcommerceProject/UploadCustomerImageServlet" method="post" enctype="multipart/form-data">
                    <input type='hidden' name='tableName' value='<%=request.getParameter("tableName") %>'>
                    <input type='hidden' name='setColName' value='<%=request.getParameter("setColName") %>'>
                    <input type='hidden' name='whereColName' value='<%=request.getParameter("whereColName") %>'>
                    <input type='hidden' name='conditionValue' value='<%=request.getParameter("conditionValue") %>'>

                    <div class="form-group">
                        <label for="image1">Upload Image</label>
                        <input type="file" class="form-control" name="image1">
                    </div>

                    <div class="form-group text-center mt-2">
                        <input type="submit" name="submit" class="btn btn-info" value="Upload">
                    </div>
                </form>
            </div>
        </div>
    </div>

    
</body>
</html>