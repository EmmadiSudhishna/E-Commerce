<%@page import="com.example.model.Ratings"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<jsp:include page="../Header.jsp" />
 <jsp:include page="../CustomerNav.jsp" />
<head>
    
<script>
        function confirm_delete(ratingId) {
            let ans = confirm("Want to delete this Rating?");
            if (ans) {
                window.location = "/EcommerceProject/DeleteRatingServlet?ratingId=" + ratingId;
            }
        }
    </script>
</head>
<body>
  
    <%
    
    Ratings ratings = new Ratings();
    List<Ratings> ratingList = ratings.getAllRatings();
    // Now 'ratingList' contains all ratings
%>

    

    <div class="container mt-2">
        <div class=" mx-auto border-success" style="max-width: 100%;">
            
                <h2 class=" text-center mb-4"><u>View Ratings</u></h2>
				
				<div class="table-responsive">
                <table class="table table-striped table-info table-responsive table-hover" id="table_id">
                    <thead class="table-dark">
                        <tr>
                            <th>Slno</th>
                            <th>Ratings ID</th>
                            <th>ProductCode</th>
                           <th>Date</th>
                            <th>Rating</th>
                            <th>Comments</th>
                            <th>Action</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int slno = 0;
                        for (Ratings ratingOb : ratingList) {
                            slno++;
                        %>
                        <tr>
                            <td><%=slno%></td>
                            <td><%=ratingOb.getRatingId()%></td>
                            <td><%=ratingOb.getProductCode()%></td>
                           <td><%= ratingOb.getDate()%></td>
							
                            <td><%=ratingOb.getRating()%></td>
                            <td><%=ratingOb.getComments()%></td>
                            
                            <td>
                                <button class='btn btn-sm btn-outline-danger' onclick="confirm_delete(<%=ratingOb.getRatingId()%>)">Delete</button>
                              
                            </td>
                            <td><a
							href="/EcommerceProject/Customer/EditRating.jsp?ratingId=<%=ratingOb.getRatingId()%>"
							class='btn btn-sm btn-outline-info'>Edit</a></td>
							
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
