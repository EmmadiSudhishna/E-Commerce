package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import com.example.model.Products;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
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
        String productCode = request.getParameter("productCode");
        String categoryName = request.getParameter("categoryName");
        String productName = request.getParameter("productName");
        String description=request.getParameter("description");
        String discount=request.getParameter("discount");
        String cost=request.getParameter("cost");
        
        
        System.out.println("productCode=" + productCode);
        
        //use model to insert category
        Products product = new Products();
        
        product.setProductCode(Integer.parseInt(productCode));
        product.setCategoryName(categoryName);
        product.setProductName(productName);
        product.setDescription(description);
        product.setDiscount(Integer.parseInt(discount));
        product.setCost(Integer.parseInt(cost));
        
        int n=product.UpdateProductByCode();
        System.out.println("n="+n);
        /*if(n==0) {
        	out.println("category not updated");
        	response.sendRedirect("/EcommerceProject/admin/EditCategory.jsp?res=0");
        }else {
        	out.println("category Updated");
        	response.sendRedirect("/EcommerceProject/admin/EditCategory.jsp?res=1");
        }*/
        response.sendRedirect("admin/ViewProducts.jsp?res=" +n);
        out.close();

	}

	}


