package com.qna.user.qnaBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.qna.user.qnaBoard.model.dao.QnaNoticeDao;
import com.qna.user.qnaBoard.model.vo.QnaNotice;

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


	public QnaNotice qnaSelectOne(int qnno) {
		Connection con = getConnection();
		int result = 0;
		QnaNotice q = qnDao.QnaSelectOne(con, qnno);
		
		if( q != null){
			result = qnDao.updateCount(con, qnno);
			
			if(result > 0)commit(con);
			else rollback(con);
		}
		close(con);
		return q;
	}


	public ArrayList<QnaNotice> QnaSelectList() {
		ArrayList<QnaNotice> qlist = null;
		Connection con = getConnection();
		qlist = qnDao.qnaSelectList(con);
		
		close(con);
		
		return qlist;
	}



}
