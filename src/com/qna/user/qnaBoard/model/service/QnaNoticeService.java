package com.qna.user.qnaBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.qna.user.qnaBoard.model.dao.QnaNoticeDao;
import com.qna.user.qnaBoard.model.vo.*;

import static com.common.JDBCTemplate.*;


public class QnaNoticeService {
	
	private QnaNoticeDao qnDao = new QnaNoticeDao(); 


	public int insertNotice(QnaNotice q) {
		int result = 0;
		Connection con = getConnection();
		result = qnDao.insertNotice(con, q);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		
		return result;
	}


	public QnaNotice qnaSelectOne(int qno) {
		Connection con = getConnection();
		
		QnaNotice q = qnDao.QnaSelectOne(con, qno);
		
		close(con);
		
		return q;
	}


	public ArrayList<QnaNotice> QnaSelectList(int currentPage, int limit) {
		ArrayList<QnaNotice> qlist = null;
		Connection con = getConnection();
		qlist = qnDao.qnaSelectList(con);
		
		System.out.println("service qlist" + qlist);
		
		close(con);
		
		return qlist;
	}


	public int getListCount() {
		Connection con = getConnection();
		int listCount = qnDao.getListCount(con);
		
		close(con);
		
		return listCount;
	}



}
