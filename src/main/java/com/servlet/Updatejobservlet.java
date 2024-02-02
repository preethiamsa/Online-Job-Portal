package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.db_connection;
import com.dao.job_dao;
import com.entity.Jobs;
@WebServlet("/update")
public class Updatejobservlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 try {
			    int id=Integer.parseInt(req.getParameter("id"));
				String Title = req.getParameter("title");
				String Location = req.getParameter("location");
				String Category = req.getParameter("category");
				String Status = req.getParameter("status");
				String Description = req.getParameter("desc");
				
				Jobs j = new Jobs();
				j.setId(id);
				j.setTitle(Title);
				j.setDescription(Description);
				j.setLocation(Location);
				j.setCategory(Category);
				j.setStatus(Status);
				
			    HttpSession session	= req.getSession();
				
				job_dao jd = new job_dao(db_connection.getcon());
				boolean b = jd.updateJob(j);
				if(b) {
					session.setAttribute("msg", "Job Update Successfully.... ");
					res.sendRedirect("View_job.jsp");
				}
				else {
					session.setAttribute("msg", "something wrong");
					res.sendRedirect("View_job.jsp");
				}
		 }catch(Exception e) {
			 
		 }
	}

}
