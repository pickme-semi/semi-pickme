package com.user.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.user.exception.UserException;
import com.user.model.vo.User;

import static com.common.JDBCTemplate.*;

public class UserDao {
	
	private Properties prop;
	
	public UserDao() {
		prop = new Properties();
		String filePath = UserDao.class
				.getResource("/config/user-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int joinUser(Connection con, User u) throws UserException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("joinUser");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUserPass());
			pstmt.setString(3, u.getUserEmail());
			pstmt.setString(4, u.getUserName());
			
			
			System.out.println( u.getUserId() + " " + u.getUserPass() + " " + u.getUserEmail() + " " + u.getUserName());
			result = pstmt.executeUpdate();
			
			System.out.println("resulotdao : " + result);
			
		} catch (SQLException e) {
			throw new UserException(e.getMessage());
		} finally {
			close(pstmt);
			close(con);
		}
		
		return result;
	}

	public User loginUser(Connection con, User u) throws UserException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User result = null;
		
		String sql = prop.getProperty("loginUser");
		
		try{
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUserPass());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				//System.out.println(rset.getString("gender"));
				
				result = new User();
				
				result.setUserNo(rset.getInt(1));
				result.setUserId(rset.getString(2));
				result.setUserPass(rset.getString(3));
				result.setUserEmail(rset.getString(4));
				result.setUserName(rset.getString(5));
				result.setBirthdate(rset.getDate(6));
				result.setGender(rset.getString(7));
				result.setType(rset.getString(8));
				result.setProfile(rset.getString(9));
				
				
			}
			
		} catch(SQLException e){
			throw new UserException(e.getMessage());			
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int idDupCheck(Connection con, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("idDupCheck");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) result = rset.getInt(1);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int emailDupCheck(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("emailDupCheck");
		
		try{
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) result = rset.getInt(1);
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public String idSearch(Connection con, String username, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = null;
		
		String sql = prop.getProperty("idSearch");
		
		try {
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, username);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
			result = rset.getString(1);
			}
			else{
				result = "fail";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public int passSearch(Connection con, String userid, String useremail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("passSearch");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, useremail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
			}else{
				result = 0;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	public int updatePass(Connection con, String id, String pass) throws UserException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePass");
		
		try{
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e){
			throw new UserException(e.getMessage());
		} finally{
			close(pstmt);
		}
		return result;
	}

}
