package com.example.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.model.Ratings;

/**
 * Servlet implementation class AddRatingServlet
 */
@WebServlet("/AddRatingServlet")
public class AddRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRatingServlet() {
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
		PrintWriter pw = response.getWriter();
		
		String productCode = request.getParameter("productCode");
		String rating=request.getParameter("rating");
		String comments=request.getParameter("comments");
		
		System.out.println("productCode="+productCode);
		System.out.println("rating="+rating);
		System.out.println("comments="+comments);
		
		HttpSession session=request.getSession();
		
		int customerId=Integer.parseInt(session.getAttribute("customerId").toString());
		System.out.println("customerId="+customerId);
		
		Ratings ratings=new Ratings();
		ratings.setProductCode(Integer.parseInt(productCode));
		ratings.setRating(Integer.parseInt(rating));
		ratings.setComments(comments);
		ratings.setCustomerId(customerId);
		
		int n= ratings.addRatings();
		
		response.sendRedirect("/EcommerceProject/Customer/OrdersHistory.jsp?res="+n);
		pw.close();
	}

}
