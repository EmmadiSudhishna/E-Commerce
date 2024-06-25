package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.model.WishList;

/**
 * Servlet implementation class AddtoWishListServlet
 */
@WebServlet("/AddtoWishListServlet")
public class AddtoWishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddtoWishListServlet() {
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

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String productCode = request.getParameter("productCode");

		System.out.println("productcode=" + productCode);

		Calendar calendar = Calendar.getInstance();
		String today = calendar.get(Calendar.YEAR) + "/" + (calendar.get(Calendar.MONTH) + 1) + "/"
				+ calendar.get(Calendar.DAY_OF_MONTH);

		HttpSession session = request.getSession();
		int customerId = (int) session.getAttribute("customerId");
		
		System.out.println("datetime=" + customerId);
		
		//// creating model object
		WishList wishlist = new WishList();
		wishlist.setCustomerId(customerId);
		wishlist.setWishlistDate(today);
		wishlist.setProductCode(Integer.parseInt(productCode));

		// getting the method
		int n = wishlist.addWishList();

		response.sendRedirect("/EcommerceProject/Customer/CustomerHome.jsp?res=" + n);
		pw.close();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
