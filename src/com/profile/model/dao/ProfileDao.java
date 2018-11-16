package com.profile.model.dao;

import static com.common.JDBCTemplate.close;

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

import com.pick.model.vo.PickMe;
import com.pick.model.vo.PickResult;
import com.point.model.vo.Point;
import com.profile.model.vo.Category;
import com.user.model.vo.User;

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
				
				u.setUserNo(rset.getInt(1));
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
				
				u.setUserNo(rset.getInt("NO"));
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
	public int followDel(Connection con, int userNo) {
		int fResult = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteFollow");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);
			
			fResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return fResult;
	}
	public int categoryDel(Connection con, int userNo) {
		
		int cResult = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("categoryDel");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			cResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return cResult;
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

	public ArrayList<Category> browseCategory(Connection con) {
		
		ArrayList<Category> cArr = new ArrayList<Category>();
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM PM_CATEGORY_TB";
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()){
				Category c = new Category();
				
				c.setCategoryId(rset.getInt("ID"));
				c.setCategoryName(rset.getString("Name"));
				
				cArr.add(c);
			}
			System.out.println(cArr);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return cArr;
	}

	public int insertCategory(Connection con, int userNo, String category) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertCategory");
		String[] c = category.split(", ");
		int[] categoryId = new int[c.length];
		
		try {
			
			for(int i=0; i<c.length; i++){
				categoryId[i] = Integer.parseInt(c[i]);
			
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, categoryId[i]);
			
				result = pstmt.executeUpdate();
			}
			
			System.out.println("category DB 입력 완료!");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteCategory(Connection con, int userNo){
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteCategory");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<Category> getCategory(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Category result = null;
		
		String sql = prop.getProperty("getCategory");
		
		

		ArrayList<Category> list = new ArrayList<Category>();
		
		try {
			System.out.println(userNo);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()){
				result = new Category();
				System.out.println(rset.getInt(1));
				
				result.setCategoryId(rset.getInt(1));
				list.add(result);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return list;
	}
  
  	public User userPage(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		User user = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("userPage");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				user = new User();
				
				user.setUserNo(rset.getInt("NO"));
				user.setUserId(rset.getString("ID"));
				user.setUserEmail(rset.getString("EMAIL"));
				user.setUserName(rset.getString("NAME"));
				user.setGender(rset.getString("PROFILE"));
				
			}
			
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}

	public int followInsert(Connection con, int userNo1, int userNo2) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("followInsert");
		
		try {
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, userNo2);
			pstmt.setInt(2, userNo1);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<PickMe> browseMyPick(Connection con, int userNo) {
		ArrayList<PickMe> myPick = new ArrayList<PickMe>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("browsePickResult");
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset= pstmt.executeQuery();
			
			while(rset.next()){
				PickMe pm = new PickMe();
				
				pm.setId(rset.getInt("ID"));
				pm.setSelect_1(rset.getString("SELECT_1"));
				pm.setSelect_2(rset.getString("SELECT_2"));
				pm.setTitle(rset.getString("TITLE"));
				pm.setContent(rset.getString("CONTENT"));
				pm.setEdate(rset.getDate("ENROLL_DATE"));
				pm.setViewcount(rset.getInt("VIEW_COUNT"));
				pm.setType(rset.getString("TYPE"));
				pm.setUserno(rset.getInt("USERNO"));
				
				myPick.add(pm);
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return myPick;
	}

	public int followDelete(Connection con, int userNo1, int userNo2) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("followDelete");
		
		try {
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, userNo2);
			pstmt.setInt(2, userNo1);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}

	public int followCheck(Connection con, int userNo1, int userNo2) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("followCheck");
		
		try {
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, userNo2);
			pstmt.setInt(2, userNo1);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<PickMe> browseUserPick(Connection con, int userNo) {
		ArrayList<PickMe> userPick = new ArrayList<PickMe>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("browsePickResult");
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset= pstmt.executeQuery();
			
			while(rset.next()){
				PickMe pm = new PickMe();
				
				pm.setId(rset.getInt("ID"));
				pm.setSelect_1(rset.getString("SELECT_1"));
				pm.setSelect_2(rset.getString("SELECT_2"));
				pm.setTitle(rset.getString("TITLE"));
				pm.setContent(rset.getString("CONTENT"));
				pm.setEdate(rset.getDate("ENROLL_DATE"));
				pm.setViewcount(rset.getInt("VIEW_COUNT"));
				pm.setType(rset.getString("TYPE"));
				pm.setUserno(rset.getInt("USERNO"));
				
				userPick.add(pm);
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return userPick;
	}

	public int browsePoint(Connection con, int userNo) {
			
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		int pointResult = 0;
		
		String sql = prop.getProperty("browsePoint");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				
				pointResult = rset.getInt("POINT");
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return pointResult;
	}
	
}
