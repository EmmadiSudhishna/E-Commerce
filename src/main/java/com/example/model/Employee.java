package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import java.sql.Statement;


import servletpack.DBConnection;

public class Employee implements Serializable {
	private int employeeId;
	private String firstName;
	private String lastName;
	private String gender;
	private String mobile;
	private String email;
	private String designation;
	private String password;
	private String employeepic;
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Employee(int employeeId, String firstName, String lastName, String gender, String mobile, String email,
			String designation, String password, String employeepic) {
		super();
		this.employeeId = employeeId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.mobile = mobile;
		this.email = email;
		this.designation = designation;
		this.password = password;
		this.employeepic = employeepic;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	


	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getPassword() {
		return password;
	}
	



	public String getMobile() {
		return mobile;
	}



	public void setMobile(String mobile) {
		this.mobile = mobile;
	}



	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmployeepic() {
		return employeepic;
	}
	public void setEmployeepic(String employeepic) {
		this.employeepic = employeepic;
	}
	
	// Add record to category table
		public int AddEmployee() {
			int n = 0;
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			if (conn == null) {
				n = 0;
			} else {
				try {
					String qry = "insert into employees(employeeId,firstName,lastName,gender,mobile,email,designation,password,employeepic)values(?,?,?,?,?,?,?,?,?)";
					PreparedStatement pst = conn.prepareStatement(qry);

					pst.setInt(1, this.employeeId);
					pst.setString(2, this.firstName);
					pst.setString(3, this.lastName);
					pst.setString(4, this.gender);
					pst.setString(5, this.mobile);
					pst.setString(6, this.email);
					pst.setString(7, this.designation);
					pst.setString(8, this.password);
					pst.setString(9, this.employeepic);
					
					System.out.println("qry="+toString());
					n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

				} catch (Exception e) {
					n = 0;
				}

			}
			return n;
			
		}
			

			//get records from employee table(view record)
				public List<Employee> getAllEmployee(){
					List<Employee> employeeList=new ArrayList<Employee>();
				
					try {
						DBConnection db = new DBConnection();
					    Connection conn = db.getConnection();
					    
					    String qry="select employeeId,firstName,lastName,gender,mobile,email,designation,password,employeepic from employees order by employeeId";
					    Statement st=conn.createStatement();
					    
					    ResultSet rs=st.executeQuery(qry);
					   
					    while(rs.next()) {
					    	Employee employee= new Employee();
					    	
					    	employee.setEmployeeId(rs.getInt("employeeId"));
					    	employee.setFirstName(rs.getString("firstName"));
							employee.setLastName(rs.getString("lastName"));
							employee.setGender(rs.getString("gender")); 
							employee.setMobile(rs.getString("mobile"));
							employee.setEmail(rs.getString("email"));
							employee.setDesignation(rs.getString("designation"));
							employee.setPassword(rs.getString("password"));
							employee.setEmployeepic (rs.getString("employeepic"));

							
					    	employeeList.add(employee);
					    }
					}catch(Exception e) {
						System.out.println("Error:getAllEmployees..:" +e);
						
					}
					return employeeList;
				}
				
				
				
			////for viewing customers
			/*	 public List<Employee> getEmployeeById(int employeeId) {
				        List<Employee> employeeList = new ArrayList<Employee>();

				        try {
				            DBConnection db = new DBConnection();
				            Connection conn = db.getConnection();

				            String qry = "select employeeId, firstName, lastName,gender,mobile,email,designation,password,employeepic from employees where employeeId = ?";
				            PreparedStatement pst = conn.prepareStatement(qry);
				            pst.setInt(1, employeeId);

				            ResultSet rs = pst.executeQuery();

				            while (rs.next()) {
				                Employee employee = new Employee();
				                //customer.setEmployeeId(rs.getInt("customerId"));
				                employee.setFirstName(rs.getString("firstName"));
				                employee.setLastName(rs.getString("lastName"));
				                employee.setGender(rs.getString("gender"));
				                
				                employee.setMobile(rs.getString("mobile"));
				                employee.setEmail(rs.getString("email"));
				                employee.setDesignation(rs.getString("designation"));
				                
				                employee.setPassword(rs.getString("password"));
								employee.setEmployeepic(rs.getString("employeepic"));
								
				                employeeList.add(employee);
				            }
				        } catch (Exception e) {
				            System.out.println("Error: getEmployeeById" + e);
				        }

				        return employeeList;
				    }*/
				 
				//////delete by employee///////
					
					public boolean deleteEmployeeById() {
						boolean flag=false;
						try {
							DBConnection db = new DBConnection();
						    Connection conn = db.getConnection();
							
						    String qry="delete from employees where employeeId=?";
						    PreparedStatement pst=conn.prepareStatement(qry);
						    pst.setInt(1,  this.employeeId);
						    
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
					
					
					
					///////edit///////
					public Employee getEmployeeById() {
						Employee employee =new Employee();
						try {
							DBConnection db=new DBConnection();
							Connection conn=db.getConnection();
							String qry="select employeeId,firstName,lastName,gender,mobile,email,designation,password,employeepic from employees where employeeId=?";
							
							//System.out.println("Updating employeeId: " + this.employeeId);
							//System.out.println("New first name: " + this.firstName);
							//System.out.println("New last name: " + this.lastName);

							PreparedStatement pst=conn.prepareStatement(qry);
							System.out.println("qry="+qry);
							pst.setInt(1, this.employeeId);
							
							
							ResultSet rs=pst.executeQuery();
							
							if(rs.next()) {
								employee.setEmployeeId(rs.getInt("employeeId"));
								employee.setFirstName(rs.getString("firstName"));
								employee.setLastName(rs.getString("lastName"));
								employee.setGender(rs.getString("gender"));
								employee.setMobile(rs.getString("mobile"));
								employee.setEmail(rs.getString("email"));
								employee.setDesignation(rs.getString("designation"));
								employee.setPassword(rs.getString("password"));
							}else {
								employee=null;
							}
							
						}catch(Exception e) {
							System.out.println("Error: "+e);
						}
						return employee;
					}
					

					//update employee table  by employeeId
					public int UpdateEmployeeById() {
					    int n = 0;
					    try {
					    DBConnection db = new DBConnection();
					    Connection conn = db.getConnection();

					       String qry = "update employees set firstName=?,lastName=?,gender=?,mobile=?,email=?,designation=?,password=? where employeeId=?";
					            PreparedStatement pst = conn.prepareStatement(qry);
					           
					            System.out.println("Query ="+pst.toString());
					            
					            pst.setString(1, this.firstName);
					            pst.setString(2, this.lastName);
					            
					            pst.setString(3, this.gender);
					            pst.setString(4, this.mobile);
					            pst.setString(5, this.email);
					            
					            pst.setString(6, this.designation);
					            pst.setString(7, this.password);
					           
					            pst.setInt(8, this.employeeId);

					            
					           
					            n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

					        } catch (Exception e) {
					            n=0;
					        } 
					    return n; 
					}
					
					
					/*//get all  employees names from employee table
					public List<String> getAllEmployeesById(){
						List<String> employeeList=new ArrayList<String>();
					
						try {
							DBConnection db = new DBConnection();
						    Connection conn = db.getConnection();
						    
						    String qry="select  employeeId from employees order by employeeId";
						    Statement st=(Statement) conn.createStatement();
						    ResultSet rs=st.executeQuery(qry);
						    
						    while(rs.next()) {
						    	
						    	employeeList.add(rs.getString("employeeId"));
						    }
						}catch(Exception e) {
							System.out.println("Error:getAllEmployees..:" +e);
							
						}
						return employeeList;
					}*/
					
					

				
				
				

		}
	


