<%@page import="java.util.List"%>
<%@page import="com.example.model.Feedback"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="./AdminTitle.jsp"></jsp:include>
</head>
<body>
<jsp:include page="./AdminMenu.jsp" />

<div class="container-fluid mt-4">

<%
	Feedback invoice=new Feedback();

	List<Feedback> feedbackList=invoice.getAllFeedback();
%>

<h2 class="text-center text-danger">
			<u>Reviews</u>
		</h2>
		<div class="table-responsive">
		<table
			class="table table-bordered table-secondary table-hover"
			id="table_id">

			<thead class="table-dark">
				<tr class="text-center">
				<tr>
				<th>SINo</th>
					<th>FeedbackId</th>
					<th>Date</th>
					<th>CustomerId</th>
					<th>CustomerQueries</th>
					<th>Feedback</th>
					
				</tr>
			</thead>
			<tbody class="table table-info">
				<%
				int slno = 0;
				for (Feedback feedbackObj : feedbackList) {
					slno++;
				%>
				<tr>


					<td><%=slno%></td>
					<td><%=feedbackObj.getFeedbackId()%></td>
					<td><%=feedbackObj.getDate()%></td>
					<td><%=feedbackObj.getCustomerId()%></td>
					<td><%=feedbackObj.getCustomerQueries()%></td>
					<td><%=feedbackObj.getFeedback()%></td>
					
				</tr>

				<%
				}
				%>

			</tbody>
		</table>
		</div>

	</div>
</body>

</html>