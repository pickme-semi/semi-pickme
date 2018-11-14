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

}
