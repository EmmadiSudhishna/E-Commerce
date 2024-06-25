package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import servletpack.DBConnection;

public class Feedback implements Serializable {
	private int feedbackId;
	private Date date;
	private int customerId;
	private String customerQueries;
	private String feedback;
	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Feedback(int feedbackId, Date date, int customerId, String customerQueries, String feedback) {
		super();
		this.feedbackId = feedbackId;
		this.date = date;
		this.customerId = customerId;
		this.customerQueries = customerQueries;
		this.feedback = feedback;
	}
	public int getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getCustomerQueries() {
		return customerQueries;
	}
	public void setCustomerQueries(String customerQueries) {
		this.customerQueries = customerQueries;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	
	public int addFeedback() {
		int n=0;
		try {
			DBConnection db=new DBConnection();
			Connection conn=db.getConnection();
			
			String query="insert into feedback(date,customerId,customerQueries,feedback)values(?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(query);
			
			pst.setDate(1, Date.valueOf(LocalDate.now()));
			pst.setInt(2, this.customerId);
			pst.setString(3, this.customerQueries);
			pst.setString(4, this.feedback);
			
			System.out.println("feedback qry = " +pst.toString());
			
			n=pst.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println("Error: "+e);
			
		}
		return n;
	}
	
	 // Get all feedback
    public List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<Feedback>();
        try {
            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();

            String qry = "select feedbackId,date,customerId,customerQueries,feedback from feedback ";
  			Statement st = conn.createStatement();
  			ResultSet rs = st.executeQuery(qry);
  			
  			
  			System.out.println("feedback qry = " +st.toString());

  			while (rs.next()) {
  				Feedback feedback = new Feedback();
  				
  				feedback.setFeedbackId(rs.getInt("feedbackId"));
  				feedback.setDate(rs.getDate("date"));
  				feedback.setCustomerId(rs.getInt("customerId"));
  				feedback.setCustomerQueries(rs.getString("customerQueries"));
  				feedback.setFeedback(rs.getString("feedback"));
  				
                
                feedbackList.add(feedback);
            }

            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return feedbackList;
    }
    
    
    // delete//
    public static boolean deleteFeedback(int feedbackId) {
        boolean deleted = false;
        try {
            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();

            String query = "DELETE FROM feedback WHERE feedbackId=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, feedbackId);

            int n = pst.executeUpdate();
            if (n > 0) {
                deleted = true;
            }
            
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return deleted;
    }
    
    
    
    
    public static Feedback getFeedbackById(int feedbackId) {
        Feedback feedback = null;
        try {
            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();

            String query = "SELECT * FROM feedback WHERE feedbackId=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, feedbackId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedbackId"));
                feedback.setDate(rs.getDate("date"));
                feedback.setCustomerId(rs.getInt("customerId"));
                feedback.setCustomerQueries(rs.getString("customerQueries"));
                feedback.setFeedback(rs.getString("feedback"));
            }
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: "+e);
        }
        return feedback;
    }

    
    
    
    
  ///update//
    public int updateFeedback() {
        int n = 0;
        try {
            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();

            String query = "UPDATE feedback SET feedback=? WHERE feedbackId=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, this.feedback);
            //pst.setString(2, this.customerQueries);
            pst.setInt(2, this.feedbackId);

            System.out.println("qry111="+pst.toString());

            n = pst.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error: "+e);
        }
        return n;
    }


}
	


