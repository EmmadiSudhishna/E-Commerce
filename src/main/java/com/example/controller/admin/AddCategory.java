package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Categories;

@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	response.setContentType("text/html");
    	PrintWriter pw=response.getWriter();
    	
        // Retrieve parameters from the view
        String categoryName = request.getParameter("categoryName");
        

        // Create a new Categories object and set the values
        Categories category = new Categories();
        category.setCategoryName(categoryName);
        

        // Call the addCategory method
        int n = category.AddCategory();

        //record not added
        if (n == 0) {
            
            response.sendRedirect("/EcommerceProject/admin/AddCategory.jsp?res=0");
        } else {//record added
            
            response.sendRedirect("/EcommerceProject/admin/AddCategory.jsp?res=1");
        }
        //or
        //response.sendRedirect("AddCategory.jsp?res=+n");
    }
}
