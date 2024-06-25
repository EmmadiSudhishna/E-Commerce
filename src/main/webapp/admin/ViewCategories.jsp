<%@ page
	import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.util.List, com.example.model.Categories"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
 <jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="./AdminTitle.jsp"></jsp:include>
<title>View Category</title>


<script>
        function confirm_delete(categoryId) {
            let ans = confirm("Want to delete this record?");
            if (ans) {
                window.location = "/EcommerceProject/DeleteCategory?categoryId=" + categoryId;
            }
        }
    </script>
</head>
<body>
	<jsp:include page="./AdminMenu.jsp" />
	<%
	Categories category = new Categories();
	List<Categories> categoryList = category.getAllCategories();
	System.out.println("categoryList=" + categoryList.size());
	%>

	<div class="container mt-3">

		<%
		String res= request.getParameter("res");
		if(res!=null){
				if(res.equals("1")){
			%>

		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Record updated.
		</div>
		<%
				}else if(res.equals("0")){
					%>
		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Yup!</strong> Records not updated.
		</div>
		<%
			
			
							
				}
		}
		%>



		<h2 class="text-center"><u>View Categories</u></h2><br/>
		<div class="table-responsive">
		<table class="table table-striped table-dark table-hover"
			id="table_id">
			<thead class="table-success">
				<tr>
					<th>Operations</th>
					<th>Operations</th>
					<th>Slno</th>
					<th>CategoryId</th>
					<th>CategoryName</th>
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Categories categoryOb : categoryList) {
					slno++;
				%>
				<tr>
					<td>
						<!-- <a
						href="/EcommerceProject/DeleteCategory?categoryId=<%=categoryOb.getCategoryId()%>"
						class='btn btn-sm btn-danger'>Delete</a>-->

						<button class='btn btn-sm btn-outline-danger'
							onclick="confirm_delete(<%=categoryOb.getCategoryId()%>)">Delete</button>
					</td>
					<td><a
						href="/EcommerceProject/admin/EditCategory.jsp?categoryId=<%=categoryOb.getCategoryId()%>"
						class='btn btn-sm btn-outline-info'>Edit</a></td>

					<td><%=slno%></td>
					<td><%=categoryOb.getCategoryId()%></td>
					<td><%=categoryOb.getCategoryName()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
			
			$('#success_id').slideUp(3000);
		});
	</script>
</body>
</html>
