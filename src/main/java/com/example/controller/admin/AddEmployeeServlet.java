

package com.example.controller.admin;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.example.model.Employee;
import com.example.model.Products;

/**
 * Servlet implementation class AddEmployeeServlet
 */
@WebServlet("/AddEmployeeServlet")
@MultipartConfig
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddEmployeeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		System.out.println("Servlet reached");

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		// read data from the view
		String employeeId = request.getParameter("employeeId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String gender = request.getParameter("gender");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String designation = request.getParameter("designation");
		String password = request.getParameter("password");

		System.out.println("employeeId=" + employeeId);
		System.out.println("firstName=" + firstName);
		System.out.println("lastName=" + lastName);
		System.out.println("gender=" + gender);
		System.out.println("mobile=" + mobile);
		System.out.println("email=" + email);
		System.out.println("designation=" + designation);
		System.out.println("password=" + password);

		Part employeepic = request.getPart("employeepic");

////////////////creation of uploads directory in webapp folder
///////////////////////

		ServletContext sc = getServletContext();
		String path = sc.getRealPath("/");
		System.out.println("path = " + path);

		/*String str = path.substring(0, path.indexOf(".metadata") - 1);
		System.out.println("str = " + str);

//get application name
		String appName = path.substring(path.lastIndexOf("\\", path.length() - 2));
		System.out.println("appName = " + appName);

//Concatenate root directory with application name
		String uploadDirectory = str + appName + "\\src\\main\\webapp\\uploads";*/
		
		String uploadDirectory = path + "/uploads";
		System.out.println("uploadDirectory :" + uploadDirectory);

		Path uploadPath = Path.of(uploadDirectory);

// Create the directory if it doesnt't exist
		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
			System.out.println("directory Created");
		} else {
			System.out.println("directory not Created");
		}

/////// upload Image1////////////////////
		//////////////////////////////

		// Get the input stream of the uploaded file
		InputStream inputStream1 = employeepic.getInputStream();

		// Generate the unique filename or use the original file name
		String fileName1 = System.currentTimeMillis() + "_" + employeepic.getSubmittedFileName();

		// Save file to the server
		Path filePath1 = uploadPath.resolve(fileName1);
		Files.copy(inputStream1, filePath1, StandardCopyOption.REPLACE_EXISTING);
		response.getWriter().println("File Uploaded Succesfullty :" + employeepic);
		
		Employee employee = new Employee();
		employee.setEmployeeId(Integer.parseInt(employeeId));
		employee.setFirstName(firstName);
		employee.setLastName(lastName);
		employee.setGender(gender);
		employee.setMobile(mobile);
		employee.setEmail(email);
		employee.setDesignation(designation);
		employee.setPassword(password);
		employee.setEmployeepic(fileName1);

		int n = employee.AddEmployee();

		System.out.println("Employee insertion result: " + n);
		response.sendRedirect("/EcommerceProject/admin/AddEmployee.jsp?res=" + n);

		pw.close();

	}

}
