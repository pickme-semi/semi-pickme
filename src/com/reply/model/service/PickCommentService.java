package com.reply.model.service;

import com.reply.model.dao.PickCommentDao;
import com.reply.model.vo.PickComment;

import static com.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

public class PickCommentService {
	
	private PickCommentDao pcDao = new PickCommentDao();

	public int insertComment(PickComment pc) {
		
		Connection con = getConnection();
		
		int result = pcDao.insertComment(con, pc);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public ArrayList<PickComment> selectList(int pid) {
		
		Connection con = getConnection();
		
		ArrayList<PickComment> clist = pcDao.selectList(con,pid);
		
		close(con);		
		
		return clist;
	}

	public int updateComment(PickComment pc) {
		Connection con = getConnection();
		
		int result = pcDao.updateComment(con,pc);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
		
	}

	public int deleteComment(int cno) {
		
		Connection con = getConnection();
		
		int result = pcDao.deleteComment(con,cno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	
}
