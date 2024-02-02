package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.db_connection;
import com.dao.UserDao;
import com.entity.User;
@WebServlet("/login")
public class Loginservlet extends HttpServlet{
 @Override
 protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws IOException , ServletException{
	try { 
	 String em =rq.getParameter("email");
	 String pw =rq.getParameter("password");
	 HttpSession session = rq.getSession();
	 User user = new User();
	 if("admin@gmail.com".equals(em) && "admin@123".equals(pw)) { 
	       user.setRole("admin");
		 
		   rs.sendRedirect("admin.jsp");
	 
		   session.setAttribute("userobj", user);
	  }
	 else {
		 UserDao ud = new UserDao(db_connection.getcon());
		 User u = ud.login(em, pw);
		 
		 if(u!=null) {
			 session.setAttribute("userobj", u);
			 rs.sendRedirect("home.jsp");
		 }
		 else {
			 session.setAttribute("msg", "Invalid Email & Password");
			 rs.sendRedirect("login.jsp");
		 }
	 }
     }
	 catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("error");
		}

}
}