package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;

public class job_dao {

	private Connection Conn;
	
	public job_dao(Connection Conn){
		super();
		this.Conn = Conn;
	}
	public boolean addjobs(Jobs j) {
		
		boolean b = false;
		try {
			String query = "insert into jobs(title,description,category,status,location) values(?,?,?,?,?)";
			
			PreparedStatement ps = Conn.prepareStatement(query);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			
			int res = ps.executeUpdate();
			
			if(res==1) {
				b = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public List<Jobs> getAllJobs(){
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		try {
			String sql = "select * from jobs order by id desc";
			PreparedStatement ps = Conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPublish_date(rs.getTimestamp(7)+ "");
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Jobs> getAllJobsForUser(){
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		try {
			String sql = "select * from jobs where status=? order by id desc";
			PreparedStatement ps = Conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPublish_date(rs.getTimestamp(7)+ "");
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Jobs getJobById(int id){
		Jobs j = null;
		try {
			String sql = "select * from jobs where id=?";
			PreparedStatement ps = Conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPublish_date(rs.getTimestamp(7)+ "");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return j;
	}
	public boolean updateJob(Jobs j) {
		
		boolean b = false;
		try {
			String query = "update jobs set title=?,description=?,category=?,status=?,location=? where id=? ";
			
			PreparedStatement ps = Conn.prepareStatement(query);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			ps.setInt(6, j.getId());
			int res = ps.executeUpdate();
			
			if(res==1) {
				b = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
    public boolean deleteJobs(int id) {
    	boolean b = false;
    	try {
    		String sql="delete from jobs where id=?";
    		PreparedStatement ps = Conn.prepareStatement(sql);
    		ps.setInt(1,id);
    		int res = ps.executeUpdate();
    		if(res==1) {
				b = true;
			}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return b;
    }
    public List<Jobs> getJobsOrLC(String location,String category){
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		try {
			String sql = "select * from jobs where category=? or location=? order by id desc";
			PreparedStatement ps = Conn.prepareStatement(sql);
			ps.setString(1,category);
			ps.setString(2,location);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPublish_date(rs.getTimestamp(7)+ "");
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
    public List<Jobs> getJobsAndLC(String location,String category){
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		try {
			String sql = "select * from jobs where category=? and location=? order by id desc";
			PreparedStatement ps = Conn.prepareStatement(sql);
			ps.setString(1,category);
			ps.setString(2,location);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPublish_date(rs.getTimestamp(7)+ "");
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	
}
}


