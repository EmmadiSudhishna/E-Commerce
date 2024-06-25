package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import servletpack.DBConnection;

/**
 * Servlet implementation class AdminLoginValidationServlet
 */
@WebServlet("/AdminLoginValidationServlet")
public class AdminLoginValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginValidationServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //reading parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();

            if (conn == null) {
                out.println("Connection error");
                return;
            }

            String query = String.format("select * from admin where username='%s' and password='%s' and role='%s'" ,username, 
                    password, role);
            out.println(query);

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);

            if (rs.next()) {
                out.println("<h1>User exists</h1>");
                String username1 = rs.getString("username");
                HttpSession session = request.getSession();
                session.setAttribute("username", username1);
                response.sendRedirect("/EcommerceProject/admin/AdminHome.jsp");
            } else {
            	out.println("<h1>User does not exist</h1>");
                out.println("<script language='javascript'>alert('Invalid user');window.location='AdminLogin.jsp?res=0';</script>");
            }

            out.close();
        } catch (Exception e) {
            System.out.println("Connection Error: " + e);
        }
    }
		
		

}
