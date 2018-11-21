package com.profile.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Category implements Serializable {
	
	private int id; // user_category_id
	private int categoryId; 
	private String categoryName;
	private int userNo;
	private Date enrolldate;
	
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(int id, int categoryId, String categoryName, int userNo, Date enrolldate) {
		super();
		this.id = id;
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.userNo = userNo;
		this.enrolldate = enrolldate;
	}

	public Category(int categoryId, String categoryName) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}

	public Category(int id, int userNo, Date enrolldate) {
		super();
		this.id = id;
		this.userNo = userNo;
		this.enrolldate = enrolldate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", categoryId=" + categoryId + ", categoryName=" + categoryName + ", userNo="
				+ userNo + ", enrolldate=" + enrolldate + "]";
	}
	
	
	
	
	
	
	

}
