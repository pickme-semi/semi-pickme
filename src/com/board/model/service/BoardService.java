package com.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.board.model.dao.BoardDao;
import com.board.model.vo.Board;
import com.board.model.vo.BoardCategory;

import static com.common.JDBCTemplate.*;

public class BoardService {

	private BoardDao bDao = new BoardDao();
	
	public ArrayList<BoardCategory> getBoardCategory(String category) {
		Connection con = getConnection();
		
		ArrayList<BoardCategory> cateList = bDao.getBoardCategory(con, category);
		
		return cateList;
	}

	public ArrayList<Board> getBoardList(String type) {
		Connection con = getConnection();
		
		ArrayList<Board> boardList = bDao.getBoardList(con, type);
		
		return boardList;
	}

	public int insertBoard(Board board) {
		Connection con = getConnection();
		
		int result = bDao.insertBoard(con, board);
		
		if(result > 0)commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Board> getCommonBoardList() {
		Connection con = getConnection();
		
		ArrayList<Board> commonBoardList = bDao.getCommonBoardList(con);
		
		return commonBoardList;
	}

	public Board selectOne(int id) {
		Connection con = getConnection();
		Board b = bDao.selectOne(con, id);
		close(con);
		
		return b;
	}

	public int reInsertBoard(Board b) {
		Connection con = getConnection();
		
		int result = bDao.reInsertBoard(con, b);
		if(result > 0)commit(con);
		else rollback(con);
		close(con);
		return result;
	}

}
