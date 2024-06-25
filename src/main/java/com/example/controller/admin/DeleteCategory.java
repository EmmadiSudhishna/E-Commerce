package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Categories;

@WebServlet("/DeleteCategory")
public class DeleteCategory extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    response.setContentType("text/html");
		    PrintWriter pw = response.getWriter();

		    String categoryId = request.getParameter("categoryId");
		    //use model to insert
		    Categories category = new Categories();
		    category.setCategoryId(Integer.parseInt(categoryId));
		    boolean flag = category.deleteCategoryById();
		    int n=0;
		    if (flag) {
		    	n=1;
		        
		        response.sendRedirect("/EcommerceProject/admin/ViewCategories.jsp");      // OR  response.sendRedirect("/Admin/addcategory.jsp?res="+n);
		    } else {
		       n=0;
		    }
		    //response.sendRedirect("/EcommerceProject/admin/ViewCategories.jsp?res=" +flag);
	}
}
