package com.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.db_connection;
import com.dao.job_dao;
import com.entity.Jobs;
@WebServlet("/postjob")
public class Addpost extends HttpServlet{
 protected void doPost(HttpServletRequest req,HttpServletResponse res) {
	 try {
		 
		String Title = req.getParameter("title");
		String Location = req.getParameter("location");
		String Category = req.getParameter("category");
		String Status = req.getParameter("status");
		String Description = req.getParameter("desc");
		
		Jobs j = new Jobs();
		j.setTitle(Title);
		j.setLocation(Location);
		j.setCategory(Category);
		j.setStatus(Status);
		j.setDescription(Description);
		
	    HttpSession session	= req.getSession();
		
		job_dao jd = new job_dao(db_connection.getcon());
		boolean b = jd.addjobs(j);
		if(b) {
			session.setAttribute("msg", "Job Post Successfully.... ");
			res.sendRedirect("postjob.jsp");
		}
		else {
			session.setAttribute("msg", "something wrong");
			res.sendRedirect("postjob.jsp");
		}
		
		
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
	 
 }
	
}
