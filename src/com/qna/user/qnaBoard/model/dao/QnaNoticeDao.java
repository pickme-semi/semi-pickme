package com.qna.user.qnaBoard.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


import com.qna.user.qnaBoard.model.vo.*;
import com.qna.user.qnaUserInsert.model.dao.QnaInsertDao;

import static com.common.JDBCTemplate.*;

public class QnaNoticeDao {
	
	private Properties prop = new Properties();
	
	public QnaNoticeDao(){
		String filePath = QnaInsertDao.class.
				getResource("/config/qnaUser-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertNotice(Connection con, QnaNotice q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertQnaNotice");
		
		try {
			pstmt = con.prepareStatement(sql);
					
			
			pstmt.setString(1, q.getQtitle());
			pstmt.setString(2, q.getQcontent());
//			pstmt.setDate(3, q.getQdate());
			pstmt.setString(3, q.getQcategory());
			
			System.out.println(pstmt);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			
			close(pstmt);
			
		}
		
		
		return result;
	}

	public QnaNotice QnaSelectOne(Connection con, int qno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		QnaNotice q = null;
		String sql = prop.getProperty("qnaSelectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				q = new QnaNotice();
				
				// ID, CATEGORY_ID, TITLE, CONTENT, EROLL_DATE 
				
				q.setQno(rset.getInt("BID"));
				q.setQcategory(rset.getString("CATEGORY_ID"));
				q.setQtitle(rset.getString("TITLE"));
				q.setQcontent(rset.getString("CONTENT"));
				// q.setQcount(rset.getInt(5));
				// q.setQwriter(rset.getString("NAME"));
				q.setQdate(rset.getDate("EROLL_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}



	public ArrayList<QnaNotice> qnaSelectList(Connection con) {
		ArrayList<QnaNotice> qlist = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("qnaSelectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			qlist = new ArrayList<QnaNotice>();
			
			System.out.println("dao qlist" + qlist);
			
			while(rset.next()){
				QnaNotice q = new QnaNotice();
				
				q.setQno(rset.getInt("qno"));
				q.setQcategory(rset.getString("qcategory"));
				q.setQtitle(rset.getString("qtitle"));
				q.setQcontent(rset.getString("qcontent"));
				// q.setQcount(rset.getInt("qcount"));
				// q.setQwriter(rset.getString("NAME"));
				// q.setQdate(rset.getDate("qdate"));
				
				qlist.add(q);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return qlist;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset.next()) listCount = rset.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

}
