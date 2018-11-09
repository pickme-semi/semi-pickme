package com.qna.user.qnaUserInsert.model.service;

import static com.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.qna.user.qnaUserInsert.model.dao.QnaInsertDao;
import com.qna.user.qnaUserInsert.model.vo.QnaBoard;

public class QnaService {

	private QnaInsertDao qDao = new QnaInsertDao();
	
	
	public int insertBoard(QnaBoard b) {
		Connection con = getConnection();
		
			int result = qDao.insertBoard(con, b);
			
			if(result > 0) commit(con);
			else rollback(con);
			
			close(con);
			
		return result;
	}


	public int getListCount() {
		Connection con = getConnection();
		int listCount = qDao.getListCount(con);
		
		close(con);
		
		return listCount;
	}


	public ArrayList<QnaBoard> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<QnaBoard> list = qDao.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}


	public QnaBoard mSelectOne(int qid) {
		Connection con = getConnection();
		
		QnaBoard q = qDao.mSelectOne(con, qid);
		
		close(con);
		
		return q;
	}

}
