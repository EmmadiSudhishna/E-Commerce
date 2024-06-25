package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Employee;
import com.example.model.Products;

/**
 * Servlet implementation class UpdateEmployeeServlet
 */
@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		

		response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	
    	// Retrieve parameters from the view
        String employeeId = request.getParameter("employeeId");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String designation = request.getParameter("designation");
        String password = request.getParameter("password");
        
        System.out.println("employeeId="+employeeId);
        System.out.println("firstName="+firstName);
        System.out.println("lastName="+lastName);
        System.out.println("gender="+gender);
        System.out.println("mobile="+mobile);
        System.out.println("email="+email);
        System.out.println("designation="+designation);
        System.out.println("password="+password);
        
        
        //use model to insert category
        Employee employee = new Employee();
        
        employee.setEmployeeId(Integer.parseInt(employeeId));
        employee.setFirstName(firstName);
        employee.setLastName(lastName);
        employee.setGender(gender);
        employee.setMobile(mobile);
        employee.setEmail(email);
        employee.setDesignation(designation);
        employee.setPassword(password);
        
        int n=employee.UpdateEmployeeById();
        System.out.println("n=" +n);
        /*if(n==0) {
        	out.println("category not updated");
        	response.sendRedirect("/EcommerceProject/admin/EditCategory.jsp?res=0");
        }else {
        	out.println("category Updated");
        	response.sendRedirect("/EcommerceProject/admin/EditCategory.jsp?res=1");
        }*/
        response.sendRedirect("admin/ViewEmployee.jsp?res=" +n);
        out.close();

	}
        
        
	}


