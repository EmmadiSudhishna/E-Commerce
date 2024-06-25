package com.example.model;

import java.io.Serializable;
import java.sql.Connection;

import servletpack.DBConnection;

public class Admin implements Serializable {
	
	private String username;
	private String password;
	private String role;
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
	
	

}
