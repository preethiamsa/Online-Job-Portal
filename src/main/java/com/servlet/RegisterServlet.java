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
@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			String name = req.getParameter("name");
			String qual = req.getParameter("qual");
			String email = req.getParameter("email");
			String pw = req.getParameter("pw");
			
			UserDao ud = new UserDao(db_connection.getcon());
			
			User u = new User(name,email,pw,qual,"User");
			boolean b = ud.addUser(u);
			  HttpSession session	= req.getSession();
				
				if(b) {
					session.setAttribute("msg", "Registration Successfully.... ");
					res.sendRedirect("signup.jsp");
				}
				else {
					session.setAttribute("msg", "something wrong");
					res.sendRedirect("signup.jsp");
				}
			
		}catch(Exception e) {
				e.printStackTrace();		}
	
		
		
	}

}
