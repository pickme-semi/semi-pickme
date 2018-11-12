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


import com.qna.user.qnaBoard.model.vo.QnaNotice;
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
			
//			pstmt.setString(1, q.getQcategory());
//			pstmt.setString(3, q.getQwriter());
//			pstmt.setString(2, q.getQtitle());		
//			pstmt.setString(4, q.getQcontent());
//			pstmt.setDate(5, q.getQdate());
			
			
			pstmt.setString(1, q.getQcategory());
			pstmt.setString(2, q.getQtitle());
			pstmt.setString(3, q.getQcontent());
//			pstmt.setDate(4, q.getQdate());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			System.out.println(pstmt);
			close(pstmt);
			
		}
		
		
		return result;
	}

	public QnaNotice QnaSelectOne(Connection con, int qnno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		QnaNotice q = null;
		String sql = prop.getProperty("qnaSelectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qnno);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				q = new QnaNotice();
				
				q.setQnno(qnno);
				q.setQcategory(rset.getString(2));
				q.setQtitle(rset.getString(3));
				q.setQcontent(rset.getString(4));
				q.setQcount(rset.getInt(5));
				q.setQwriter(rset.getString("NAME"));
				q.setQdate(rset.getDate(7));
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

	public int updateCount(Connection con, int qnno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("qnaUpdateCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qnno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
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
			
			while(rset.next()){
				QnaNotice q = new QnaNotice();
				
				q.setQnno(rset.getInt("qnno"));
				q.setQcategory(rset.getString("qcategory"));
				q.setQtitle(rset.getString("qtitle"));
				q.setQcontent(rset.getString("qcontent"));
				q.setQcount(rset.getInt("qcount"));
				q.setQwriter(rset.getString("NAME"));
				q.setQdate(rset.getDate("qdate"));
				
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

}
