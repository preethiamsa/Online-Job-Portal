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
@WebServlet("/update_profile")
public class update_profile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String qual = req.getParameter("qual");
			String email = req.getParameter("email");
			String pw = req.getParameter("pw");
			
			UserDao ud = new UserDao(db_connection.getcon());
			
			User u = new User();
			u.setId(id);
			u.setName(name);
			u.setQualification(qual);
			u.setPassword(pw);
			u.setEmail(email);
			boolean b = ud.updateUser(u);
			  HttpSession session	= req.getSession();
				
				if(b) {
					session.setAttribute("msg", "Profile Update Successfully");
					res.sendRedirect("home.jsp");
				}
				else {
					session.setAttribute("msg", "something wrong");
					res.sendRedirect("home.jsp");
				}
			
		}catch(Exception e) {
				e.printStackTrace();		}
	
		
		
	}
	}


