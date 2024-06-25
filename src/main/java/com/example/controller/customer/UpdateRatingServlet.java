package com.example.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Ratings;

/**
 * Servlet implementation class UpdateRatingServlet
 */
@WebServlet("/UpdateRatingServlet")
public class UpdateRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRatingServlet() {
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
		
		
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        int ratingId=Integer.parseInt(request.getParameter("ratingId"));
        int rating=Integer.parseInt(request.getParameter("rating"));
        String comments=request.getParameter("comments");
        
        
        //
        System.out.println("ratingId: "+ratingId);
        System.out.println("rating: "+rating);
        System.out.println("comments: "+comments);;
        
        
        
        
        //
        Ratings ratings= new Ratings();
        ratings.setRatingId(ratingId);
        ratings.setRating(rating);
        ratings.setComments(comments);
        
        int n=ratings.updateRating();
        
        if(n>0) {//successfully updated
        	response.sendRedirect("/EcommerceProject/Customer/ViewRatings.jsp?res="+n);
        
	
}

	}
}
