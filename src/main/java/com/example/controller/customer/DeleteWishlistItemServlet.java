package com.example.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Employee;
import com.example.model.WishList;

/**
 * Servlet implementation class DeleteWishlistItemServlet
 */
@WebServlet("/DeleteWishlistItemServlet")
public class DeleteWishlistItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWishlistItemServlet() {
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
	        
	        String productCode = request.getParameter("productCode");

	       
	        
		    WishList wishlist = new WishList();
		    wishlist.setProductCode(Integer.parseInt(productCode));
		    
		    boolean flag = wishlist.deleteWishlistItemByProducCode();
		    int n=0;
		    if (flag) {
		    	n=1;
		        
		        response.sendRedirect("/EcommerceProject/Customer/WishList.jsp");      // OR  response.sendRedirect("/Admin/addcategory.jsp?res="+n);
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
