package com.profile.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.user.model.vo.User;
import static com.common.JDBCTemplate.*;

public class ProfileDao {
	
	private Properties prop = new Properties();
	
	public ProfileDao(){
		
		String filePath = ProfileDao.class
							.getResource("/config/profile-query.properties").getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}

	public ArrayList<User> followerList(Connection con) {
		Statement stmt = null;
		ArrayList<User> list = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("followerList");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<User>();
			
			while(rset.next()){
				User u = new User();
				
				u.setUserId(rset.getString("ID"));
				u.setProfile(rset.getString("PROFILE"));
				
				list.add(u);
				
			}
			
			System.out.println("list : " + list);
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	public ArrayList<User> followingList(Connection con) {
		Statement stmt = null;
		ArrayList<User> list = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("followingList");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<User>();
			
			while(rset.next()){
				User u = new User();
				
				u.setUserId(rset.getString("ID"));
				u.setProfile(rset.getString("PROFILE"));
				
				list.add(u);
				
			}
			
			System.out.println("list : " + list);
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}


	public int followerCount(Connection con) {
		Statement stmt = null;
		int result = 0;
		
		String sql = prop.getProperty("followCount");
		
		try {
			
			stmt = con.createStatement();
		
			result = stmt.executeUpdate(sql);
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(stmt);
		}
		
		return result;
	}

	public int followingCount(Connection con) {
		
		Statement stmt = null;
		int result = 0;
		
		String sql = prop.getProperty("followingCount");
		
		try {
			
			stmt = con.createStatement();
		
			result = stmt.executeUpdate(sql);
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(stmt);
		}
		
		return result;
	}

	
}
