package com.board.model.dao;

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

import com.board.model.vo.Board;
import com.board.model.vo.BoardAnswer;
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
		
		// BOT001 : 신고, BOT002 : 질문
		String sqlType = (category.equals("report")) ? "신고" :"질문";
		
		try {
			
			System.out.println("sql type : " + sqlType);
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
		
		System.out.println("타입 DAO : " + sqlType);
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sqlType);
			
			rset = pstmt.executeQuery();
			
			boardList = new ArrayList<Board>();
			
			while(rset.next()){
				Board bo = new Board();
				
				System.out.println("dao board : " + bo);
				
				bo.setId(rset.getInt(1));
				bo.setTitle(rset.getString(2));
				bo.setContent(rset.getString(3));
				bo.setEnrollDate(rset.getDate(4));
				bo.setStatus(rset.getString(5));
				bo.setCategoryId(rset.getInt(6));
				bo.setUserNo(rset.getInt(7));
				bo.setPickId(rset.getInt(8));
				bo.setType(rset.getString(9));
				bo.setUserName(rset.getString(10));
				
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

	public int insertBoard(Connection con, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String bType = (board.getType().equals("BOT001"))? "report" : "qna";
		
		String sql = "";
		
		if(bType.equals("report")) {
			sql = prop.getProperty("insertReport");
		}else {
			sql = prop.getProperty("insertQuestion");
		}
		
		System.out.println("sql : " + sql);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getCategoryId());
			pstmt.setInt(4, board.getUserNo());

			if(bType.equals("report")) {
				pstmt.setInt(5, board.getPickId());
				pstmt.setString(6, board.getType());
			}else {
				pstmt.setString(5, board.getType());
			}
			
			System.out.println("titel : " + board.getTitle());
			System.out.println("content : " + board.getContent());
			System.out.println("cateid : " + board.getCategoryId());
			System.out.println("userno : " + board.getUserNo());
			System.out.println("type : " + board.getType());
			System.out.println("pickid : " + board.getPickId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Board> getCommonBoardList(Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<Board> commonBoardList = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getCommonBoardList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			commonBoardList = new ArrayList<Board>();
			
			while(rset.next()){
				Board bo = new Board();
				
				bo.setId(rset.getInt(1));
				bo.setTitle(rset.getString(2));
				bo.setContent(rset.getString(3));
				bo.setEnrollDate(rset.getDate(4));
				bo.setStatus(rset.getString(5));
				bo.setCategoryId(rset.getInt(6));
				bo.setUserNo(rset.getInt(7));
				bo.setPickId(rset.getInt(8));
				bo.setType(rset.getString(9));
				
				System.out.println("DAO : " + bo);
				
				commonBoardList.add(bo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return commonBoardList;
	}

	public Board selectOne(Connection con, int id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				b = new Board();
				
				b.setId(rset.getInt("ID"));
				b.setCategoryId(rset.getInt("CATEGORY_ID"));
				b.setContent(rset.getString("CONTENT"));
				b.setEnrollDate(rset.getDate("ENROLL_DATE"));
				b.setTitle(rset.getString("TITLE"));
				b.setUserNo(rset.getInt("USER_NO"));
				b.setStatus(rset.getString("STATUS"));
				b.setUserName(rset.getString("NAME"));
			}
					
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	public int reInsertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmts = null;
		int result = 0;
		String sql = prop.getProperty("reInsert");
		String sqls = prop.getProperty("statusFn");
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmts = con.prepareStatement(sqls);
			
			
			pstmt.setInt(1, b.getId());
			pstmt.setInt(2, b.getUserNo());
			pstmt.setString(3, b.getContent());
			
			pstmts.setInt(1, b.getId());
			
			
			result = pstmts.executeUpdate();
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmts);
			close(pstmt);
		}
		
		
		return result;
	}

	public int updateBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, b.getContent());
			
			pstmt.setInt(2, b.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			
			stmt = con.createStatement();		
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){			
				listCount = rset.getInt(1);
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	public ArrayList<Board> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Board> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Board>();
			
			while(rset.next()){
				Board b = new Board();
				
				b.setId(rset.getInt("ID"));
				b.setTitle(rset.getString("TITLE"));
				b.setContent(rset.getString("CONTENT"));
				b.setEnrollDate(rset.getDate("ENROLL_DATE"));
				b.setStatus(rset.getString("STATUS"));
				b.setCategoryId(rset.getInt("CATEGORY_ID"));
				b.setUserNo(rset.getInt("USER_NO"));
				b.setPickId(rset.getInt("PICK_ID"));
				b.setType(rset.getString("TYPE"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public BoardAnswer selectReOne(Connection con, int id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BoardAnswer ba = null;
		String sql = prop.getProperty("selectReOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				ba = new BoardAnswer();
				
				ba.setId(rset.getInt(1));
				ba.setbId(rset.getInt(2));
				ba.setUserNo(rset.getInt(3));
				ba.setContent(rset.getString(4));
				ba.setEnrollDate(rset.getDate(5));
				ba.setUserName(rset.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return ba;
	}

	public ArrayList<BoardAnswer> getCommonAnswerList(Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<BoardAnswer> commonAnswerList = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getCommonAnswerList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			commonAnswerList = new ArrayList<BoardAnswer>();
			
			while(rset.next()){
				BoardAnswer ba = new BoardAnswer();
				
				ba.setId(rset.getInt(1));
				ba.setbId(rset.getInt(2));
				ba.setUserNo(rset.getInt(3));
				ba.setContent(rset.getString(4));
				ba.setEnrollDate(rset.getDate(5));
				
				System.out.println("DAO : " + ba);
				
				commonAnswerList.add(ba);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return commonAnswerList;
	}
	

}

































