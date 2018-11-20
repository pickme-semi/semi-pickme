package com.pick.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.pick.model.vo.Attachment;
import com.pick.model.vo.PickCategory;
import com.pick.model.vo.PickMe;
import com.user.model.vo.User;

import static com.common.JDBCTemplate.*;


public class PickDao {
	
	private Properties prop = null;

	public PickDao() {
		prop = new Properties();
		String filePath = PickDao.class
				.getResource("/config/pick-me.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<PickMe> selectList(Connection con) {
		ArrayList<PickMe> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPickMeOne");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<PickMe>();
			
			while(rset.next()){
				PickMe pm = new PickMe();
				
				pm.setId(rset.getInt(1));
				pm.setSelect_1(rset.getString(2));
				pm.setSelect_2(rset.getString(3));
				pm.setTitle(rset.getString(4));
				pm.setContent(rset.getString(5));
				pm.setEdate(rset.getDate(6));
				pm.setViewcount(rset.getInt(7));
				pm.setDdate(rset.getDate(8));
				pm.setType(rset.getString(9));
				pm.setUserno(rset.getInt(10));
				pm.setUserId(rset.getString(12));
				pm.setUserEmail(rset.getString(14));
				pm.setBirthdate(rset.getDate(16));
				pm.setGender(rset.getString(17));
				pm.setProfile(rset.getString(19));
				System.out.println(pm);
				//				pm.setCategory(0);
				list.add(pm);
			}
			
			
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}

	public int insertPick(Connection con, PickMe pm) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertPick");
		
		try {
			pstmt = con.prepareStatement(sql);		
						
			pstmt.setString(1, pm.getSelect_1());
			pstmt.setString(2, pm.getSelect_2());
			pstmt.setString(3, pm.getTitle());
			pstmt.setString(4, pm.getContent());
			pstmt.setDate(5, pm.getDdate());
			pstmt.setInt(6, pm.getUserno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public int selectCurrentBid(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int pid = 0;
		
		String sql = prop.getProperty("selectCurrentBid");
		
		try {
			stmt = con.createStatement();
		
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				pid = rset.getInt(1); // "CURRVAL"
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return pid;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> list) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertAttachment");
		
		try{
			
			for(int i = 0 ; i < list.size(); i++){
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, list.get(i).getBid());
				pstmt.setString(2, list.get(i).getOriginName());
				pstmt.setString(3, list.get(i).getChangeName());
				pstmt.setString(4, list.get(i).getFilePath());
				
				// 첫번째 데이터일 경우 대표 이미지로 level = 0
				// 나머지 데이터는 일반 이미지로 level = 1
				
				int level = 0;
				if(i != 0 ) level = 1;
				
				pstmt.setInt(5, level);
				
				result += pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public HashMap<String, Object> selectPickMeMap(Connection con, int pid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		PickMe p = new PickMe();
		User u = new User();
		
		String sql = prop.getProperty("selectPickdetail");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pid);
			
			rset = pstmt.executeQuery();
			
			
			
			
		while(rset.next()){
			
			p.setId(pid);  // pick id
			p.setSelect_1(rset.getString(2));   // pick 사진 1
			p.setSelect_2(rset.getString(3));   // pick 사진 2			
			p.setTitle(rset.getString(4));	    // pick 제목
			p.setContent(rset.getString(5));    // pick 내용			
			p.setEdate(rset.getDate(6));        // pick 업로드 날짜
			p.setViewcount(rset.getInt(7));     // pick 조회수
			p.setDdate(rset.getDate(8));	    // pick 마감날짜 	
			p.setType(rset.getString(9));		// pick 업로드 회원 타입
			p.setUserno(rset.getInt(10));		// pick 업로드 회원 번호			
			p.setUserId(rset.getString(11));	// pick 업로드 회원 id
			p.setUserEmail(rset.getString(12)); // pick 업로드 회원 email			
			p.setGender(rset.getString(13));	// pick 업로드 회원 성별
			p.setBirthdate(rset.getDate(14));	// pick 업로드 회원 생일
			p.setProfile(rset.getString(15));	// pick 업로드 회원 프로필 사진.
			System.out.println(p);
		}
		hmap = new HashMap<String, Object>();
		hmap.put("PickMe", p);	
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return hmap;
	}

	public ArrayList<PickCategory> browseCategory(Connection con) {
		ArrayList<PickCategory> pcArr = new ArrayList<PickCategory>();
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM PM_CATEGORY_TB";
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()){
				PickCategory pc = new PickCategory();
				
				pc.setCategoryid(rset.getInt("ID"));
				pc.setCategoryName(rset.getString("Name"));
				
				pcArr.add(pc);
			}
			System.out.println(pcArr);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return pcArr;
	}

	public int insertCategory(Connection con, int boardNum, int categoryNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCategory");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setInt(2, categoryNum);
			result = pstmt.executeUpdate();
			System.out.println("Pcategory DB 입력 완료!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int getPickCount(Connection con) {
		int result = 0;
		String sql = prop.getProperty("getCountPick");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = con.prepareStatement(sql);			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
		return result;
	}
}
