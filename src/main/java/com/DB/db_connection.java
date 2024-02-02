package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class db_connection {
  
  private static Connection con; 
      
  public static Connection getcon() throws ClassNotFoundException {
	  
  String url = "jdbc:mysql://localhost:3306/job_portal";
  String user = "root";
  String pw = "Amsa@811";
  try {
	if(con==null) {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, pw);
	}
} catch (SQLException e) {
	
	e.printStackTrace();
}
  
  return con;
  }
}
