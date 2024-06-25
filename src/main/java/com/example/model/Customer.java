package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Statement;
import java.util.List;

import jakarta.servlet.http.HttpSession;


import servletpack.DBConnection;

public class Customer implements Serializable {
	private String emailId;
	private String password;
	private int customerId;
	private String firstName;
	private String lastName;
	private String mobileNumber;
	private String profilePic;
	private String registerDate;

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customer(String emailId, String password, int customerId, String firstName, String lastName,
			String mobileNumber, String profilePic, String registerDate) {
		super();
		this.emailId = emailId;
		this.password = password;
		this.customerId = customerId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.mobileNumber = mobileNumber;
		this.profilePic = profilePic;
		this.registerDate = registerDate;
	}

	public Customer(String emailId) {
		super();
		this.emailId = emailId;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	// methods to validate customer login credentials
	public boolean validateCustomerLogin() {
		boolean flag = false;
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			flag = false;
		} else {
			try {
				String qry = "select * from customers where emailId=? and password=?";
				System.out.println("Query: " + qry);
				PreparedStatement pst = conn.prepareStatement(qry);
				pst.setString(1, this.emailId);
				pst.setString(2, this.password);

				System.out.println("emailId=" + emailId);
				System.out.println("password=" + password);
				ResultSet rs = pst.executeQuery();
				if (rs.next()) {

					this.setCustomerId(rs.getInt("customerId"));
					this.setEmailId(rs.getString("emailId"));
					this.setFirstName(rs.getString("firstName"));
					this.setLastName(rs.getString("lastName"));
					flag = true;
				} else {
					flag = false;
				}

			} catch (Exception e) {
				System.out.println("Error: " + e);

			}
		}

		return flag;
	}

	// Add record to customer table
	public int AddCustomer() {
		int n = 0;
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			n = 0;
		} else {
			try {
				String qry = "insert into customers(firstName,lastName,mobileNumber,emailId,password,profilePic,registerDate)values(?,?,?,?,?,?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);

				pst.setString(1, this.firstName);
				pst.setString(2, this.lastName);
				pst.setString(3, this.mobileNumber);
				pst.setString(4, this.emailId);
				pst.setString(5, this.password);
				pst.setString(6, this.profilePic);

				Calendar c = Calendar.getInstance();
				// Assuming 'c' is a Calendar instance
				String registerDate = c.get(Calendar.YEAR) + "/" + (c.get(Calendar.MONTH) + 1) + "/"
						+ c.get(Calendar.DAY_OF_MONTH);
				pst.setString(7, registerDate);

				n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

			} catch (Exception e) {
				n = 0;
			}

		}
		return n;

	}

	// veiwing customer details(view)
	public List<Customer> getAllCustomers() {
		List<Customer> customerList = new ArrayList<Customer>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select customerId, firstName, lastName, emailId, mobileNumber from customers order by customerId";
			PreparedStatement pst = conn.prepareStatement(qry);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Customer customer = new Customer();
				customer.setCustomerId(rs.getInt("customerId"));
				customer.setFirstName(rs.getString("firstName"));
				customer.setLastName(rs.getString("lastName"));
				customer.setEmailId(rs.getString("emailId"));
				customer.setMobileNumber(rs.getString("mobileNumber"));
				customerList.add(customer);
			}
		} catch (Exception e) {
			System.out.println("Error:getAllCustomers..:" + e);

		}
		return customerList;
	}
	 ////for viewing customers
	 public List<Customer> getCustomerById(int customerId) {
	        List<Customer> customerList = new ArrayList<Customer>();

	        try {
	            DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            String qry = "select customerId, firstName, lastName, emailId, mobileNumber,password,profilePic,registerDate from customers where customerId = ?";
	            PreparedStatement pst = conn.prepareStatement(qry);
	            pst.setInt(1, customerId);

	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	                Customer customer = new Customer();
	                customer.setCustomerId(rs.getInt("customerId"));
	                customer.setFirstName(rs.getString("firstName"));
	                customer.setLastName(rs.getString("lastName"));
	                customer.setEmailId(rs.getString("emailId"));
	                customer.setMobileNumber(rs.getString("mobileNumber"));
	                customer.setPassword(rs.getString("password"));
					customer.setProfilePic(rs.getString("profilePic"));
					customer.setRegisterDate(rs.getString("registerDate"));
	                customerList.add(customer);
	            }
	        } catch (Exception e) {
	            System.out.println("Error: getCustomerById" + e);
	        }

	        return customerList;
	    }

/////////////////////////////////////////
////////get records from Customer Table(View) (Only by emailId-Single)

	/*public List<String> getCustomersByEmailId() {
		List<String> customerList = new ArrayList<>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

//String qry = "select  categoryName from category order by categoryName";
			String qry = "select emailId from customers order by customerId";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {

				customerList.add(rs.getString("emailId"));
			}

		} catch (Exception e) {
			System.out.println("Error: getAllCategories()............." + e);
		}
		return customerList;
	}*/
	
	
	//delete by customer
	
	public boolean deleteCustomerById() {
		boolean flag=false;
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
			
		    String qry="delete from customers where customerId=?";
		    PreparedStatement pst=conn.prepareStatement(qry);
		    pst.setInt(1,  this.customerId);
		    
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
	
	

	// ///////
	
	    public int updateCustomerByCustomerId() {
	        int n = 0;

	        try {
	            DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            if (conn != null) {
	                String query = "UPDATE customers SET firstName=?, lastName=?, mobileNumber=?, "
	                             + "emailId=?, password=?, registerDate=? WHERE customerId=?";
	                PreparedStatement pst = conn.prepareStatement(query);
	                System.out.println("query=" + query);
	                pst.setString(1, this.firstName);
	                pst.setString(2, this.lastName);
	                pst.setString(3, this.mobileNumber);
	                pst.setString(4, this.emailId);
	                pst.setString(5, this.password);
	                pst.setString(6, this.registerDate);  // Assuming registerDate is a string, adjust if it's a date
	                pst.setInt(7, this.customerId);

	                	System.out.println("query1="+pst.toString());
	                n = pst.executeUpdate();
	            }
	        } catch (Exception e) {
	            System.out.println("Error:"+e);
	        }

	        return n;
	    }
	    
	    
	    ///////
	    public Customer getCustomerProfileById() {
	    	Customer customer=new Customer();
	    	try {
	    		DBConnection db=new DBConnection();
	    		Connection conn=db.getConnection();
	    		
	    		String qry="select customerId,firstName,lastName,mobileNumber,emailId,password,registerDate from customers where customerId=?";
	    		PreparedStatement pst=conn.prepareStatement(qry);
	    		
	    		
	    		
	    		pst.setInt(1,  this.customerId);
	    		
	    		System.out.println("qry="+toString());
	    		ResultSet rs=pst.executeQuery();
	    		
	    		if(rs.next()) {
	    			customer.setCustomerId(rs.getInt("customerId"));
	    			customer.setFirstName(rs.getString("firstName"));
					customer.setLastName(rs.getString("lastName"));
					customer.setMobileNumber(rs.getString("mobileNumber"));
					customer.setEmailId(rs.getString("emailId"));
					customer.setPassword(rs.getString("password"));

					customer.setRegisterDate(rs.getString("registerDate"));

				} else {
					customer = null;
				}

			} catch (Exception e) {
				System.out.println("Error" + e);
			}
			return customer;
		}
	    		
	    	}
	    

	    


	


