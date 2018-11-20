package com.reply.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.reply.model.vo.PickComment;

import static com.common.JDBCTemplate.*;

public class PickCommentDao {
	
	private Properties prop = new Properties();
	
	public PickCommentDao() {
		String filePath = PickCommentDao.class
				.getResource("/config/comment.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {			
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	

	public int insertComment(Connection con, PickComment pc) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertComment");
		System.out.println(pc);
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pc.getUserno());
			pstmt.setInt(2, pc.getPid());
			pstmt.setString(3, pc.getCcontent());
			
			pstmt.setInt(4, pc.getClevel());
			
			if(pc.getRefcno() > 0){
				pstmt.setInt(5, pc.getRefcno());
			} else {
				pstmt.setNull(5, java.sql.Types.NULL);
			}			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		return result;
	}

	public ArrayList<PickComment> selectList(Connection con, int pid) {
		
		ArrayList<PickComment> clist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pid);
			
			rset = pstmt.executeQuery();
			
			clist = new ArrayList<PickComment>();
			
			while(rset.next()){
				PickComment pc = new PickComment();
				
				pc.setCid(rset.getInt(1));
				pc.setUserno(rset.getInt(2));
				pc.setPid(pid);
				pc.setCcontent(rset.getString(4));
				pc.setClevel(rset.getInt(5));
				pc.setEdate(rset.getDate(6));
				pc.setName(rset.getString(8));
				
				clist.add(pc);
				System.out.println(pc);	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return clist;
	}


	public int updateComment(Connection con, PickComment pc) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateComment");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pc.getCcontent());
			pstmt.setInt(2, pc.getCid());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteComment(Connection con, int cno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteComment");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

}
