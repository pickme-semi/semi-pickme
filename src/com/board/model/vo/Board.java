package com.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3527924050026203724L;
	
	private int id;
	private String title;
	private String content;
	private Date enrollDate;
	private String status;
	private int categoryId;
	private int userNo;
	private int pickId;
	private String type;
	private String userName;
	
	public Board() {
		super();
	}
	
	// 질문 보드
	public Board(String title, String content, int categoryId, int userNo, String type) {
		super();
		this.title = title;
		this.content = content;
		this.categoryId = categoryId;
		this.userNo = userNo;
		this.type = type;
	}
	
	// 신고 보드
	public Board(String title, String content, int categoryId, int userNo, int pickId, String type) {
		super();
		this.title = title;
		this.content = content;
		this.categoryId = categoryId;
		this.userNo = userNo;
		this.pickId = pickId;
		this.type = type;
	}
	
	// 답변 보드
	public Board(int id, String content, int userNo){
		super();
		this.id = id;
		this.content = content;
		this.userNo = userNo;
	}
	

	public Board(int id, String title, String content, Date enrollDate, String status, int categoryId, int userNo,
			int pickId, String type) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
		this.status = status;
		this.categoryId = categoryId;
		this.userNo = userNo;
		this.pickId = pickId;
		this.type = type;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPickId() {
		return pickId;
	}

	public void setPickId(int pickId) {
		this.pickId = pickId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Board [id=" + id + ", title=" + title + ", content=" + content + ", enrollDate=" + enrollDate
				+ ", status=" + status + ", categoryId=" + categoryId + ", userNo=" + userNo + ", pickId=" + pickId
				+ ", type=" + type + ", name="+ userName + "]";
	}
}
