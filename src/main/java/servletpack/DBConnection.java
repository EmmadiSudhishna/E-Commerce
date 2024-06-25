package servletpack;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	Connection conn = null;

	public Connection getConnection() {
	try {
		//Step 1
		Class.forName("com.mysql.jdbc.Driver");
		
		//Step 2
		
		//conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/fullstack_ecommerce?autoReconnect=true&useSSL=false","root","");
		//conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/sigma445_ecommercedb?autoReconnect=true&useSSL=false","sigma445_ecommercedb","XNOH7gROi[oH");
		
		
		final String DB_URL="jdbc:mysql://localhost:3306/fullstack_ecommerce?connectTimeout=1000&sockerTimeout=30000";
        final String USERNAME="root";
        final String PASSWORD="apex12345";
        conn = DriverManager.getConnection(DB_URL,USERNAME,PASSWORD);
        
	}catch(Exception e) {
		conn=null;
	}
	return conn;
	
}

}
