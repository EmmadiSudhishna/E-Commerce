package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.controller.admin.AddtoWishListServlet;
import com.mysql.jdbc.Statement;

import servletpack.DBConnection;

public class WishList implements Serializable {
	private int wishId;
	private int productCode;
	private int customerId;
	private  String wishlistDate;
	public WishList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WishList(int wishId, int productCode, int customerId, String wishlistDate) {
		super();
		this.wishId = wishId;
		this.productCode = productCode;
		this.customerId = customerId;
		this.wishlistDate = wishlistDate;
	}
	public int getWishId() {
		return wishId;
	}
	public void setWishId(int wishId) {
		this.wishId = wishId;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getWishlistDate() {
		return wishlistDate;
	}
	public void setWishlistDate(String wishlistDate) {
		this.wishlistDate = wishlistDate;
	}
	
	public int addWishList() {
		int n=0;
		try{
			DBConnection db=new DBConnection();
			Connection conn=db.getConnection();
			
			

			String qry = "insert into wishlist(productCode,customerId,wishlistDate) values(?,?,?)";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.productCode);
			
			pst.setInt(2, this.customerId);
			pst.setString(3, this.wishlistDate);
			
			n = pst.executeUpdate();

		
		}catch(Exception e) {
			System.out.println("error: "+e);
		}
		return n;
	}
	
	//get all   names from wishlist table
	public List<Products> getAllWishListProductsByCustomerId(int CustomerId){
		List<Products> productList=new ArrayList<Products>();
	
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3 from products where productCode in(select productCode from wishlist where customerId=?)";
		    PreparedStatement pst=conn.prepareStatement(qry);
		    pst.setInt(1, CustomerId);
		    ResultSet rs=pst.executeQuery();
		    
		    while(rs.next()) {
		    	Products product= new Products();
		    	product.setProductCode(rs.getInt("productCode"));
		    	product.setCategoryName(rs.getString("categoryName"));
				product.setProductName(rs.getString("productName"));
				product.setDescription(rs.getString("description")); // Set the description parameter
				product.setDiscount(rs.getInt("discount"));
				product.setCost(rs.getInt("cost"));
				product.setProductImage1(rs.getString("productImage1"));
				product.setProductImage2(rs.getString("productImage2"));
				product.setProductImage3 (rs.getString("productImage3"));

			
		    	productList.add(product);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllProducts..:" +e);
			
		}
		return productList;
	}
	
	

	//delete records based on productCode
	public boolean deleteWishlistItemByProducCode() {
		boolean flag=false;
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
			
		    String qry="delete from wishlist where productCode=?";
		    PreparedStatement pst=conn.prepareStatement(qry);
		    pst.setInt(1,  this.productCode);
		    
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
	
	
	
	


			
	
}
	
