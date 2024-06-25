package com.example.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.model.Customer;

/**
 * Servlet implementation class CustomerLoginValidationServlet1
 */
@WebServlet("/CustomerLoginValidationServlet1")
public class CustomerLoginValidationServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLoginValidationServlet1() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String emailId = request.getParameter("emailId");
        String password = request.getParameter("password");

       System.out.println("Received Email: " + emailId + ", Password: " + password);

       
        Customer customer =new Customer();
        customer.setEmailId(emailId);
        customer.setPassword(password);

            boolean flag=customer.validateCustomerLogin();
            if (flag == true) { //customer user exist 
            	HttpSession session=request.getSession();
            	session.setAttribute("customerId", customer.getCustomerId());
            	session.setAttribute("customerName", customer.getFirstName() +" " +customer.getLastName());
            	session.setAttribute("customerMailId", customer.getEmailId());
                
                response.sendRedirect("/EcommerceProject/Customer/CustomerHome.jsp");
                
                	
            }else {
                //response.sendRedirect("CustomerLogin.jsp?res="+ flag);
                out.println("<h1>User does not exist</h1>");
                out.println("<script language='javascript'>alert('Invalid user');window.location='CustomerLogin.jsp?res=0';</script>");
                out.close();
    


        }
    }

}
