package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Cart;

/**
 * Servlet implementation class DeleteCartServlet
 */
@WebServlet("/DeleteCartServlet")
public class DeleteCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCartServlet() {
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

		int productCode=Integer.parseInt(request.getParameter("productCode"));
		int customerId=Integer.parseInt(request.getParameter("customerId"));
		
		Cart cart=new Cart();
		cart.setProductCode(productCode);
		cart.setCustomerId(customerId);
		
		boolean result=cart.deleteCartItemByProductCodeCustomerId();
		
		if(result) {
			response.sendRedirect("/EcommerceProject/Customer/Cart.jsp");
		}else {
			System.out.println("Failed to delete product from cart");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
