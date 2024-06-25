<%@page import="com.example.model.Ratings"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Rating</title>
<jsp:include page="../Header.jsp" />
<jsp:include page="../CustomerNav.jsp" />

</head>
<body class="bg-light">
<%
	String ratingId=request.getParameter("ratingId");
	Ratings rating=new Ratings();
	rating.setRatingId(Integer.parseInt(ratingId));
	rating=Ratings.getRatingById(rating.getRatingId());
%>

 <div class="container card border-success border-3 mt-5" style="background-color: #BFFC8B; height: 400px; width: 900px;">
        
            <form class="card-body"  action="http://localhost:8091/EcommerceProject/UpdateRatingServlet"
		method="post">


		

                <h2 class="mb-4 text-center">Edit Rating</h2>
				<div class="row">
                    <div class="col-sm-6">
                       
                            <label for="ratingId" class="fw-bold">Rating ID:</label>
                            <input type="text" class="form-control" id="ratingId" name="ratingId" value="<%=rating.getRatingId()%>">
                        </div>
                    
                    
                    <div class="col-sm-6">
                        
                            <label for="productCode" class="fw-bold">Product Code:</label>
                            <input type="text" class="form-control" id="productCode" name="productCode" value="<%=rating.getProductCode()%>" readonly>
                        </div>
                    </div>
                <br/>
                
                <div class="row">
                    <div class="col-sm-6">
                        
                            <label for="rating" class="fw-bold">Rating:</label>
                            <input type="number" class="form-control" id="rating" name="rating" value="<%=rating.getRating()%>">
                        </div>
                    
                    
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="comments" class="fw-bold">Comments:</label>
                            <textarea class="form-control" id="comments" name="comments" rows="3"><%=rating.getComments()%></textarea>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-info">Update Rating</button>
                </div>
            </form>
        </div>
  
    <%
		String res= request.getParameter("res");
		if(res!=null){
				if(res.equals("1")){
			%>

		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Rating updated.
		</div>
		<%
				}else if(res.equals("0")){
					%>
		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Yup!</strong> Rating not updated.
		</div>
		<%
			
			
							
				}
		}
		%>

	

</body>
</html>