<%@page import="java.util.List"%>
<%@page import="com.example.model.Ratings"%>
<%@page import="com.example.model.Products"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Review</title>
    <jsp:include page="../Header.jsp"></jsp:include>
    <jsp:include page="../CustomerNav.jsp" />
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        
        .card-custom {
            border: none;
            background: #fde2e2;
            border-radius: 20px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            transition: opacity 0.3s ease,background-color 0.3s ease;
        }
        .card-custom:hover {
            opacity: 0.8; 
             background-color: #f9c2c2; 
            /* Adjust the opacity value as needed */
        }

    
        .card-custom .card-body {
            padding: 30px;
        }

        
        .card-custom .card-title {
            font-size: 24px;
            color: #2C3E50;
            font-weight: bold;
            font-family: 'Arial', sans-serif;
        }

        
        .card-custom .card-img-top {
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            max-height: 200px; /* Adjust the height as needed */
            object-fit: cover;
        }

        /* Custom style for the card text */
        .card-custom .card-text {
            font-size: 18px;
            color: #000; /* Adjust the color as needed */
            font-weight: text;
        }

        
        .card-custom .card-header {
            background-color: #7A035D;
            color: #fff;
            font-size: 24px;
            font-family: 'Protest Guerilla', cursive;
            font-weight: bold;
            padding: 20px;
            border-bottom: none;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }

        
        .card-custom .card-body-content {
            padding: 20px;
        }
       
    </style>
</head>
<body class="text-center">

    <form action="/EcommerceProject/AddRatingServlet" method="post">

        <div class="container mt-5">

            <% 
                String productCode = request.getParameter("productCode");
                Products product = new Products();
                product.setProductCode(Integer.parseInt(productCode));
                product = product.getProductByCode();
            %>

            <!-- Overall Review Card -->
            <div class="card card-custom mx-auto mb-5" style="width: 70%;">
            <div class="card-header">OverAll Review</div>
                <div class="card-body">
                    
                    <div class="row">
                        <div class="col-sm-4 card-body-center">
                            <img src='../uploads/<%= product.getProductImage1() %>' class='card-img-top' alt='Product Image' />
                        </div>
                        <div class="col-sm-8 card-body-content">
                            <p class="card-text  "><strong>ProductName:</strong> <%=product.getProductName()%></p>
                            <p class="card-text  "><strong>Cost: </strong><%=product.getCost()%></p>
                            <p class="card-text  "><strong>Discount: </strong><%=product.getDiscount()%></p>
                            <p class="card-text   "><strong>Description: </strong><%=product.getDescription()%></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Ratings Card -->
            <div class="card card-custom mt-5 mx-auto" style="width: 70%;">
                <div class="card-header">Ratings</div>
                <div class="card-body">
                    <div class="col-sm-12 card-body-content">
                        <% 
                            Ratings rating = new Ratings();
                            List<Ratings> ratingList = rating.getRatingsByProductCode(Integer.parseInt(productCode));
                            for(Ratings ratingsOb :ratingList){
                        %>
                                 <p class="card-text text-center">
                        <i class="far fa-calendar-alt"></i><strong> Date:</strong> <%=ratingsOb.getDate()%>
                    </p>
                    
                    <p class="card-text text-green">
                        <i class="far fa-comments"></i><strong> Comments:</strong> <%=ratingsOb.getComments()%>
                    </p>
                   
                    <p class="card-text text-green"><strong>Rating:</strong> <%=ratingsOb.getRating()%> <i class="fas fa-star"></i></p>
                    <hr>
                        <% } %>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>