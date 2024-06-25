package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import servletpack.DBConnection;

public class Ratings implements Serializable {
	private int ratingId;
	private int productCode;
	private  int rating;
	private String comments;
	private int customerId;
	private Date date;
	public Ratings(Date date) {
		super();
		this.date = date;
	}
	public Ratings() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Ratings(int ratingId, int productCode, int rating, String comments, int customerId,Date date) {
		super();
		this.ratingId = ratingId;
		this.productCode = productCode;
		this.rating = rating;
		this.comments = comments;
		this.customerId = customerId;
		this.date=date;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getRatingId() {
		return ratingId;
	}
	public void setRatingId(int ratingId) {
		this.ratingId = ratingId;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	
	
	//add rating
	public int addRatings() {
		int n=0;
		try{
			DBConnection db=new DBConnection();
			Connection conn=db.getConnection();
			
			

			String qry = "insert into rating (productCode,rating,comments,customerId,date) values(?,?,?,?,?)";

			PreparedStatement pst = conn.prepareStatement(qry);
			//pst.setInt(1, this.ratingId);
			pst.setInt(1, this.productCode);
			pst.setInt(2, this.rating);
			pst.setString(3, this.comments);
			pst.setInt(4, this.customerId);
			pst.setDate(5, Date.valueOf(LocalDate.now()));
			
			n = pst.executeUpdate();

		
		}catch(Exception e) {
			System.out.println("error: "+e);
		}
		return n;
	}
	
	//view in order to get the records in review.jsp page///
	public List<Ratings> getRatingsByProductCode(int productCode) {
		List<Ratings> ratingList = new ArrayList<>();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String query = "SELECT * FROM rating WHERE productCode = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, productCode);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Ratings rating = new Ratings();
				rating.setRatingId(rs.getInt("ratingId"));
				rating.setProductCode(rs.getInt("productCode"));
				rating.setRating(rs.getInt("rating"));
				rating.setComments(rs.getString("comments"));
				rating.setCustomerId(rs.getInt("customerId"));
				rating.setDate(rs.getDate("date"));
				ratingList.add(rating);
			}
			conn.close();
		} catch(Exception e) {
			System.out.println("Error:"+e);;
		}
		return ratingList;
	}
	
	////deleting///
	public static boolean deleteRating(int ratingId) {
        boolean deleted = false;
        try {
            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();

            String query = "DELETE FROM rating WHERE ratingId=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, ratingId);

            int n = pst.executeUpdate();
            if (n > 0) {
                deleted = true;
            }
            conn.close();
        } catch (Exception e) {
           System.out.println("Error:");
        }
        return deleted;
    }
	////
	 public List<Ratings> getAllRatings() {
	        List<Ratings> ratingList = new ArrayList<>();
	        try {
	            DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            String query = "SELECT * FROM rating";
	            PreparedStatement pst = conn.prepareStatement(query);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	                Ratings rating = new Ratings();
	                rating.setRatingId(rs.getInt("ratingId"));
	                rating.setProductCode(rs.getInt("productCode"));
	                rating.setRating(rs.getInt("rating"));
	                rating.setComments(rs.getString("comments"));
	                rating.setCustomerId(rs.getInt("customerId"));
	                rating.setDate(rs.getDate("date"));
	                ratingList.add(rating);
	            }
	            conn.close();
	        } catch(Exception e) {
	            System.out.println("Error:" + e);
	        }
	        return ratingList;
	    }
	
	
	///
	
	public boolean isRatingGiven(int customerId,int productcode) {
		boolean found=false;
		try{
			DBConnection db=new DBConnection();
			Connection conn=db.getConnection();
			
		
		String qry="select ratingId from rating where customerId=? and productCode=?";
		PreparedStatement pst = conn.prepareStatement(qry);
		
		pst.setInt(1, customerId);
		pst.setInt(2, productcode);
		
		System.out.println("qry111="+pst.toString());
		ResultSet rs=pst.executeQuery();
		if(rs.next()) {
			found=true;
			
		}
		
		
	}catch(Exception e) {
		System.out.println("Error in Rating.isRatingGiven():"+e);
	}
		System.out.println("found="+found);
		return found;

}
	
	public static Ratings getRatingById(int ratingId) {
        Ratings rating = null;
        try {
            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();

            String query = "SELECT * FROM rating WHERE ratingId=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, ratingId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                rating = new Ratings();
                rating.setRatingId(rs.getInt("ratingId"));
                rating.setProductCode(rs.getInt("productCode"));
                rating.setRating(rs.getInt("rating"));
                rating.setComments(rs.getString("comments"));
                rating.setCustomerId(rs.getInt("customerId"));
            }
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: "+e);
        }
        return rating;
    }

	///update//
	public int updateRating() {
        int n = 0;
        try {
            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();

            String query = "UPDATE rating SET rating=?, comments=? WHERE ratingId=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, this.rating);
            pst.setString(2, this.comments);
            pst.setInt(3, this.ratingId);

            System.out.println("qry111="+pst.toString());
            
            n = pst.executeUpdate();
           
        } catch (Exception e) {
           System.out.println("Error: "+e);
        }
        return n;
    }
	
	

}


	
	
	

