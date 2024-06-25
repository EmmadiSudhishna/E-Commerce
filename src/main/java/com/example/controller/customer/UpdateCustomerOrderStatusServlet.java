package com.example.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Customerorders;

/**
 * Servlet implementation class UpdateCustomerOrderStatusServlet
 */
@WebServlet("/UpdateCustomerOrderStatusServlet")
public class UpdateCustomerOrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerOrderStatusServlet() {
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
        
        
        String orderId=request.getParameter("orderId");
        String orderStatus=request.getParameter("orderStatus");
        
       
        System.out.println("orderId="+orderId);
        System.out.println("orderStatus="+orderStatus);
       
        Customerorders corders =new Customerorders();
        corders.setOrderId(Long.parseLong(orderId));
        corders.setOrderStatus(orderStatus);
        int n=corders.customerOrderStatusUpdate(Long.parseLong(orderId), orderStatus);
        
        int m=Integer.parseInt(request.getParameter("n"));
        if(m==1) {//customer
        response.sendRedirect("/EcommerceProject/Customer/OrdersHistory.jsp?res="+n);
        }else if(m==2) {
        	 response.sendRedirect("/EcommerceProject/admin/AdminOrders.jsp?res="+n);
        }
        
        
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
