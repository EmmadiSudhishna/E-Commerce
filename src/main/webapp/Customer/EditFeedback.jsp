<%@page import="com.example.model.Feedback"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Feedback</title>
<jsp:include page="../Header.jsp" />
<jsp:include page="../CustomerNav.jsp" />
</head>
<body class="bg-light">
<%
	String feedbackId=request.getParameter("feedbackId");
	Feedback feedbacks=new Feedback();
	feedbacks.setFeedbackId(Integer.parseInt(feedbackId));
	feedbacks=feedbacks.getFeedbackById(feedbacks.getFeedbackId());
%>

<div class="container card border-success border-3 mt-5" style="background-color: #BFFC8B; height: 400px; width: 900px;">
        
            <form class="card-body"  action="/EcommerceProject/UpdateFeedbackServlet"
		method="post">

<h2 class="mb-4 text-center">Edit Feedback</h2>
        <div class="row">
            <div class="col-sm-6">
                <label for="feedbackId" class="fw-bold">Feedback ID:</label>
                <input type="text" class="form-control" id="feedbackId" name="feedbackId" value="<%=feedbacks.getFeedbackId()%>">
            </div>
            <div class="col-sm-6">
                <label for="date" class="fw-bold">Date:</label>
                <input type="text" class="form-control" id="date" name="date" value="<%=feedbacks.getDate()%>">
            </div>
        </div>
        <br/>
        <div class="row">
            <div class="col-sm-6">
                <label for="customerId" class="fw-bold">Customer Id:</label>
                <input type="number" class="form-control" id="customerId" name="customerId" value="<%=feedbacks.getCustomerId()%>">
            </div>
            
            <div class="col-sm-6">
                <label for="customerQueries" class="fw-bold">Customer Queries:</label>
                <input type="text" class="form-control" id="customerQueries" name="customerQueries" value="<%=feedbacks.getCustomerQueries()%>" readonly>
            </div>
        </div>
        
        <div class="col-sm-6">
            <div class="form-group">
                <label for="feedback" class="fw-bold">Feedback:</label>
                <textarea class="form-control" id="feedback" name="feedback" rows="3" cols="2" value="<%=feedbacks.getFeedback()%>"></textarea>
            </div>
            <div class=" col-sm-6 text-center mt-4">
                <button type="submit" class="btn btn-info">Update Feedback</button>
            </div>
        </div>
    </form>
</div>

<%
    String res = request.getParameter("res");
    if(res != null) {
        if(res.equals("1")) {
%>
            <div class="alert alert-success alert-dismissible fade show">
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                <strong>Success!</strong> Feedback updated.
            </div>
<%
        } else if(res.equals("0")) {
%>
            <div class="alert alert-danger alert-dismissible fade show">
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                <strong>Yup!</strong> Feedback not updated.
            </div>
<%
        }
    }
%>
</body>
</html>
		
