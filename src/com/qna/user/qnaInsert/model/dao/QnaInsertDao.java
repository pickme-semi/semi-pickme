package com.qna.user.qnaInsert.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import com.qna.user.qnaInsert.model.vo.QnaBoard;

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
	
	
	
	
}
