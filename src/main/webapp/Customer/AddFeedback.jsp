
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../Header.jsp" />
<jsp:include page="../CustomerNav.jsp" />
    
</head>
<style>
    body {
        background-color: #f5f5f5;
        font-family: 'Arial', sans-serif;
    }

    .container {
        margin-top: 50px;
        width: 80%;
    }

    .card {
        border: 5px solid #17a2b8;
        border-radius: 15px;
        max-width: 70%;
        margin: auto;
        padding: 20px;
        background-color: #ffb6c1;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .btn-add-feedback {
        font-size: 18px;
        background-color: #17a2b8;
        color: #fff;
        border: none;
        border-radius: 30px;
        padding: 10px 20px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn-add-feedback:hover {
        background-color: #138496;
    }

    .input-group-append button {
        width: 100%;
        border: none;
        border-radius: 0 5px 5px 0;
        background-color: #17a2b8;
        color: #fff;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .input-group-append button:hover {
        background-color: #138496;
    }
    .card-header {
            background-color: green;
            color: white;
        }
        
        
       
</style>
</head>
<body>
<%
	
%>
 <div class="container card mt-5" style="background-color: #f9d5e5;">
        <h2 class="text-center card-header">
            <i class="fas fa-comment"></i> USER FEEDBACK
        </h2><br/>

    <form method="post" action="/EcommerceProject/AddFeedbackServlet">
       <!--   <div class="row">
            <div class="col-md-6 mt-2">
                <label for="customerId" class="fw-bold">Customer ID:</label>
               
                <input type="text" id="customerId" name="customerId" class="form-control" required>
            </div>-->

           <!--   <div class="col-md-6 mt-2">
                <label for="date" class="fw-bold">Date:</label>

                <input type="text" id="date" name="date" class="form-control" required>
            </div>
        </div><br/>-->
	<div class="row">
        <div class="col-md-6 mt-2">
            <label class="customerQueries"><strong>CustomerQueries</strong></label>
                <select class="form-control" name="customerQueries">
                    <option>-----select option----</option>
                    <option>What shipping methods do you offer?</option>
                    <option>What materials and fabrics do you use</option>
                    <option>Common fit issues& solutions</option>
                    <option>Were you satisfied with the overall experience?</option>
                    <option>I need to change my order!</option>
                    <option>How can i track my delivery</option>
                </select>
    </div>
</div><br/>
        <div class="form-group mt-2">
            <label for="feedback" class="fw-bold">Feedback:</label>
            <textarea id="feedback" name="feedback" rows="5" cols="10" class="form-control" required></textarea>
        </div>

        <div class="text-center mt-3">
            <button type="submit" class="btn btn-add-feedback">Add Feedback</button>
        </div>
    </form>
</div>


 
</body>
</html>
