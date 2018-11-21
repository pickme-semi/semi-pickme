package com.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BoardAnswer implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2937419669499202870L;
	
	private int id;
	private int bId;
	private int userNo;
	private String content;
	private Date enrollDate;
	private String userName;
	
	public BoardAnswer() {
		super();
	}

	public BoardAnswer(int id, int bId, int userNo, String content, Date enrollDate) {
		super();
		this.id = id;
		this.bId = bId;
		this.userNo = userNo;
		this.content = content;
		this.enrollDate = enrollDate;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "BoardAnswer [id=" + id + ", bId=" + bId + ", userNo=" + userNo + ", content=" + content
				+ ", enrollDate=" + enrollDate + "]";
	}
	
}
