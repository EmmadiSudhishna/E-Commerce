<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
	<form action="ImageUploadServlet" method="post" enctype="multipart/form-data">
		Enter name: <input type="text" name="name" size="20"><br /> <input
			type="file" name="photo" accept="image/*"><br /> <input
			type="submit" value="Upload">
	</form>
</body>
</html>