package com.qna.user.qnaUserInsert.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.qna.user.qnaUserInsert.model.vo.QnaBoard;

public class QnaInsertDao {

	private Properties prop = new Properties();
	
	
	// 기본 연결 설정 
	public QnaInsertDao(){
		String filePath = QnaInsertDao.class.
				getResource("/config/qnaUser-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	

	public int insertBoard(Connection con, QnaBoard b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertQuestion");
		
		try {
			pstmt = con.prepareStatement(sql);
					
			pstmt.setString(1, b.getQtitle());
			pstmt.setString(2, b.getQcontent());
			pstmt.setInt(3, b.getQcategory());
			pstmt.setInt(4, b.getQpickId());
			pstmt.setInt(5, b.getQalert());
			pstmt.setInt(6, b.getQphone());
			pstmt.setString(7, b.getQemail());
			pstmt.setString(9, b.getQfile());
			
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
		
		String sql = prop.getProperty("questionList");
		
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
		
		}catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}



	public ArrayList<QnaBoard> selectList(Connection con, int currentPage, int limit) {
		ArrayList<QnaBoard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("qSelectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage -1) * limit +1; 
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			list = new ArrayList<QnaBoard>();
			
			while(rset.next()){
				QnaBoard q = new QnaBoard();
				
				q.setQid(rset.getInt("ID"));
				q.setQtitle(rset.getString("TITLE"));
				q.setQcontent(rset.getString("CONTENT"));
				q.setQdate(rset.getDate("EROLL_DATE"));
				q.setQstatus(rset.getString("STATUS"));
				q.setQcategory(rset.getInt("CATEGORY"));
				q.setQno(rset.getInt("USER_NO"));
				q.setQpickId(rset.getInt("PICK_ID"));
				q.setQtype(rset.getString("TYPE"));
				q.setQalert(rset.getInt("ALERT"));
				q.setQphone(rset.getInt("PHONE"));
				q.setQemail(rset.getString("EMAIL"));
				q.setQfile(rset.getString("FILE"));
				
				list.add(q);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			close(rset);
			close(pstmt);
		}	
		return list;
	}



	public QnaBoard mSelectOne(Connection con, int qid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		QnaBoard q = null;
		
		String sql = prop.getProperty("userQnaSelectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qid);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				
				q.setQid(rset.getInt("ID"));
				q.setQtitle(rset.getString("TITLE"));
				q.setQcontent(rset.getString("CONTENT"));
				q.setQdate(rset.getDate("EROLL_DATE"));
				q.setQstatus(rset.getString("STATUS"));
				q.setQcategory(rset.getInt("CATEGORY"));
				q.setQno(rset.getInt("USER_NO"));
				q.setQpickId(rset.getInt("PICK_ID"));
				q.setQtype(rset.getString("TYPE"));
				q.setQalert(rset.getInt("ALERT"));
				q.setQphone(rset.getInt("PHONE"));
				q.setQemail(rset.getString("EMAIL"));
				q.setQfile(rset.getString("FILE"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return q;
	}
	

	
}















