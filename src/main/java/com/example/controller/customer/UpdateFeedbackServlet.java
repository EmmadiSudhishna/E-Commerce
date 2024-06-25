package com.example.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Feedback;
import com.example.model.Ratings;

/**
 * Servlet implementation class UpdateFeedbackServlet
 */
@WebServlet("/UpdateFeedbackServlet")
public class UpdateFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        int feedbackId=Integer.parseInt(request.getParameter("feedbackId"));
        String customerQueries=(request.getParameter("customerQueries"));
        String feedback=request.getParameter("feedback");
        
        
        //
        System.out.println("feedbackid="+feedbackId);
       System.out.println("customerQueries="+customerQueries);
        System.out.println("feedback="+feedback);
        
        Feedback feedbacks= new Feedback();
        feedbacks.setFeedbackId(feedbackId);
        feedbacks.setCustomerQueries(customerQueries);
        feedbacks.setFeedback(feedback);
        
        int n=feedbacks.updateFeedback();
        
        if(n>0) {//successfully updated
        	response.sendRedirect("/EcommerceProject/Customer/ViewFeedbacks.jsp?res="+n);
        }
        
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
