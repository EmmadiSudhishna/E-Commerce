<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<title>Contact Us</title>
<style>
/* Add some styling if needed */
body {
	font-family: Arial, sans-serif;
}

.contact-container {
	max-width: 600px;
	margin: auto;
	padding: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
}

input, textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 16px;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 15px;
	border: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="Menu.jsp" />
	<div class="contact-container">
		<h1>Contact Us</h1>
		<p>Have questions or feedback? Reach out to us using the form
			below:</p>

		<form>
			<label for="name">Your Name:</label> <input type="text" id="name"
				name="name" required> <label for="email">Your Email:</label>
			<input type="email" id="email" name="email" required> <label
				for="message">Your Message:</label>
			<textarea id="message" name="message" rows="4" required></textarea>

			<button type="submit">Submit</button>
		</form>

		<hr>

		<h2>Contact Details</h2>
		<p>Email: emmadi97@.com</p>
		<p>Phone: +91 123-4567</p>
		<p>Address: 123 Main Street, Cityville</p>
	</div>


	>




</body>


</html>