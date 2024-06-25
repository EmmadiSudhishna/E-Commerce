package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Customer;
import com.example.model.Employee;

/**
 * Servlet implementation class DeleteEmployeeServlet
 */
@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
	    PrintWriter pw = response.getWriter();

	    String employeeId = request.getParameter("employeeId");
	    
	    Employee employee = new Employee();
	    employee.setEmployeeId(Integer.parseInt(employeeId));
	    
	    boolean flag = employee.deleteEmployeeById();
	    int n=0;
	    if (flag) {
	    	n=1;
	        
	        response.sendRedirect("/EcommerceProject/admin/ViewEmployee.jsp");      // OR  response.sendRedirect("/Admin/addcategory.jsp?res="+n);
	    } else {
	       n=0;
	    }
	    //response.sendRedirect("/EcommerceProject/admin/ViewCategories.jsp?res=" +flag);
}
	

	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
