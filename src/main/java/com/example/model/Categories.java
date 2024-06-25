package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;

import com.mysql.jdbc.Statement;

import servletpack.DBConnection;

public class Categories implements Serializable {
	private String categoryName;
	private int categoryId;

	public Categories() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	
	//Add  record to category table
	public int AddCategory() {
	    int n = 0;
	    DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();

	    if (conn == null) {
	        n = 0;
	    } else {
	        try {
	            String qry = "INSERT INTO category (categoryName) VALUES (?)";
	            PreparedStatement pst = conn.prepareStatement(qry);
	           
	            pst.setString(1, this.categoryName);

	            n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

	        } catch (Exception e) {
	            n=0;
	        } 
	    
	    
	}
		return n;
}
	
	//get records from category table(view)
	public List<Categories> getAllCategories(){
		List<Categories> categoryList=new ArrayList<Categories>();
	
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select categoryId, categoryName from category order by categoryId";
		    Statement st=(Statement) conn.createStatement();
		    ResultSet rs=st.executeQuery(qry);
		    
		    while(rs.next()) {
		    	Categories category= new Categories();
		    	category.setCategoryId(rs.getInt("categoryId"));
		    	category.setCategoryName(rs.getString("categoryName"));
		    	categoryList.add(category);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllCategories..:" +e);
			
		}
		return categoryList;
	}
	
	
	
	//delete records based on category id
	public boolean deleteCategoryById() {
		boolean flag=false;
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
			
		    String qry="delete from category where categoryId=?";
		    PreparedStatement pst=conn.prepareStatement(qry);
		    pst.setInt(1,  this.categoryId);
		    
		    int n=pst.executeUpdate();
		    
		    if(n==0) {
		    	flag=false;
		    }else {
		    	flag=true;
		    }
		}catch(Exception e){
			flag=false;
			
		}
		return flag;
	}
	
	
	//get category record by id
	public Categories getCategoryById() {
		Categories categoryRow =new Categories();
		try {
			DBConnection db=new DBConnection();
			Connection conn=db.getConnection();
			String qry="select categoryId, categoryName from category where categoryId=?";
			PreparedStatement pst=conn.prepareStatement(qry);
			pst.setInt(1, this.categoryId);
			
			
			ResultSet rs=pst.executeQuery();
			
			if(rs.next()) {
				categoryRow.setCategoryId(rs.getInt("categoryId"));
				categoryRow.setCategoryName(rs.getString("categoryName"));
			}else {
				categoryRow=null;
			}
			
		}catch(Exception e) {
			System.out.println("Error: "+e);
		}
		return categoryRow;
	}
	
	
	
	
	//update category table  by id
	public int UpdateCategoryById() {
	    int n = 0;
	    try {
	    DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();

	       String qry = "update category set categoryName=? where categoryId=?";
	            PreparedStatement pst = conn.prepareStatement(qry);
	           
	            pst.setString(1, this.categoryName);
	            pst.setInt(2, this.categoryId);

	            n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

	        } catch (Exception e) {
	            n=0;
	        } 
	    return n;
	    
	}
	
	
	//get all  category names from category table
		public List<String> getAllCategoriesByName(){
			List<String> categoryList=new ArrayList<String>();
		
			try {
				DBConnection db = new DBConnection();
			    Connection conn = db.getConnection();
			    
			    String qry="select  categoryName from category order by categoryName";
			    Statement st=(Statement) conn.createStatement();
			    ResultSet rs=st.executeQuery(qry);
			    
			    while(rs.next()) {
			    	
			    	categoryList.add(rs.getString("categoryName"));
			    }
			}catch(Exception e) {
				System.out.println("Error:getAllCategories..:" +e);
				
			}
			return categoryList;
		}
		
		
	
}