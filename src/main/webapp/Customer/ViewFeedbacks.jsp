<%@page import="com.example.model.Feedback"%>
<%@page import="com.example.model.Ratings"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../Header.jsp" />
<jsp:include page="../CustomerNav.jsp" />
    
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    
  
<script>
        function confirm_delete(feedbackId) {
            let ans = confirm("Want to delete this Feedback?");
            if (ans) {
                window.location = "/EcommerceProject/DeleteFeedbackServlet?feedbackId=" + feedbackId;
            }
        }
    </script>
</head>
<body>
  
    <%
    
    Feedback feedbacks = new Feedback();
    List<Feedback> feedbacksList = feedbacks.getAllFeedback();
    // Now 'ratingList' contains all ratings
%>

    

    <div class="container mt-2">
        <div class=" mx-auto border-success" style="max-width: 100%;">
            
                <h2 class=" text-center mb-4"><u>View Feedbacks</u></h2>
				<div class="table-responsive">
                <table class="table table-striped table-info table-hover table-responsive" id="table_id">
                    <thead class="table-dark">
                        <tr>
                            <th>Slno</th>
                            <th>Feedback ID</th>
                            <th>Date</th>
                           <th>CustomerId</th>
                            <th>CustomerQueries</th>
                            <th>Feedback</th>
                            <th>Action</th>
                            <th>Action</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int slno = 0;
                        for (Feedback feedbackOb : feedbacksList) {
                            slno++;
                        %>
                        <tr>
                            <td><%=slno%></td>
                            <td><%=feedbackOb.getFeedbackId()%></td>
                            <td><%=feedbackOb.getDate()%></td>
                           <td><%= feedbackOb.getCustomerId()%></td>
							
                            <td><%=feedbackOb.getCustomerQueries()%></td>
                            <td><%=feedbackOb.getFeedback()%></td>
                            
                            <td>
                                <button class='btn btn-sm btn-outline-danger' onclick="confirm_delete(<%=feedbackOb.getFeedbackId()%>)">Delete</button>
                              
                              <td><a
							href="/EcommerceProject/Customer/EditFeedback.jsp?feedbackId=<%=feedbackOb.getFeedbackId()%>"
							class='btn btn-sm btn-outline-info'>Edit</a></td>
							
                              
                            </td>
                            
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

   
    <script>
    $(document).ready(function() {
        $('#table_id').DataTable();
    });
</script>
</body>
</html>
