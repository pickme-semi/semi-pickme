package com.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.board.model.vo.Board;
import com.board.model.vo.BoardCategory;

import static com.common.JDBCTemplate.*;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao(){
		String filePath = BoardDao.class
							.getResource("/config/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<BoardCategory> getBoardCategory(Connection con, String category) {
		PreparedStatement pstmt = null;
		ArrayList<BoardCategory> cateList = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getBoardCategory");
		
		// BOT001 : 질문, BOT002 : 신고
		String sqlType = (category.equals("report")) ? "신고" :"질문";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sqlType);
			
			rset = pstmt.executeQuery();
			
			cateList = new ArrayList<BoardCategory>();
			
			while(rset.next()){
				BoardCategory bc = new BoardCategory();
				
				bc.setId(rset.getInt(1));
				bc.setConetent(rset.getString(2));
				bc.setType(rset.getString(3));
				
				cateList.add(bc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cateList;
	}

	public ArrayList<Board> getBoardList(Connection con, String type) {
		PreparedStatement pstmt = null;
		ArrayList<Board> boardList = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getBoardList");
		
		// BOT001 : 질문, BOT002 : 신고
		String sqlType = (type.equals("report")) ? "신고" :"질문";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sqlType);
			
			rset = pstmt.executeQuery();
			
			boardList = new ArrayList<Board>();
			
			while(rset.next()){
				Board bo = new Board();
				
				
				boardList.add(bo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return boardList;
	}

}
