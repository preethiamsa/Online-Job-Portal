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

@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			job_dao jd =new job_dao(db_connection.getcon());
			boolean b = jd.deleteJobs(id);
			  HttpSession session	= req.getSession();
				
				if(b) {
					session.setAttribute("msg", "Job Delete Successfully.... ");
					res.sendRedirect("View_job.jsp");
				}
				else {
					session.setAttribute("msg", "something wrong");
					res.sendRedirect("View_job.jsp");
				}
			
		}catch(Exception e) {
				e.printStackTrace();		}
	}

}
