package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Categories;

/**
 * Servlet implementation class UpdateCategoryServlet
 */
@WebServlet("/UpdateCategoryServlet")
public class UpdateCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCategoryServlet() {
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
        String categoryName = request.getParameter("categoryName");
        String categoryId = request.getParameter("categoryId");
        
        //use model to insert category
        Categories category = new Categories();
        category.setCategoryName(categoryName);
        category.setCategoryId(Integer.parseInt(categoryId));
        
        int n=category.UpdateCategoryById();
        /*if(n==0) {
        	out.println("category not updated");
        	response.sendRedirect("/EcommerceProject/admin/EditCategory.jsp?res=0");
        }else {
        	out.println("category Updated");
        	response.sendRedirect("/EcommerceProject/admin/EditCategory.jsp?res=1");
        }*/
        response.sendRedirect("admin/ViewCategories.jsp?res=" +n);
        out.close();

	}

}
