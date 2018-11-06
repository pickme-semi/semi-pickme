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
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
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
				System.out.println(rset.getString("gender"));
				
				result = new User();
				
				result.setUserNo(rset.getInt(1));
				result.setUserId(rset.getString(2));
				result.setUserPass(rset.getString(3));
				result.setUserEmail(rset.getString(4));
				result.setUserName(rset.getString(5));
				result.setBirthdate(rset.getDate(6));
				result.setGender(rset.getString(7));
				result.setType(rset.getString(8));
				
				
			}
			
		} catch(SQLException e){
			throw new UserException(e.getMessage());			
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

}
