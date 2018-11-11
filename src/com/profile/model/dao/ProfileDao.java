package com.profile.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

	public ArrayList<User> followerList(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ArrayList<User> list = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("followerList");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<User> followingList(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ArrayList<User> list = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("followingList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
		}
		
		return list;
	}


	public int followerCount(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int followerCount = 0;
		
		String sql = prop.getProperty("followerCount");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				followerCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return followerCount;
	}

	public int followingCount(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int followingCount = 0;
		
		String sql = prop.getProperty("followingCount");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			

			if(rset.next()){
				followingCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return followingCount;
	}

	public int updateMyPage(Connection con, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMyPage");
		
		try {
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, user.getUserPass());
			pstmt.setString(2, user.getUserEmail());
			pstmt.setString(3, user.getProfile());
			pstmt.setString(4, user.getGender());
			pstmt.setDate(5, user.getBirthdate());
			pstmt.setString(6, user.getType());
			pstmt.setInt(7, user.getUserNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}

	public int deleteUser(Connection con, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteUser");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
}
