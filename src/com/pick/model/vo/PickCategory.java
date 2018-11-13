package com.pick.model.vo;

import java.io.Serializable;

public class PickCategory implements Serializable{
	
	private int id;  // Pick 카테고리 구분 ID
	private int pickid; // Pick ID
	private int categoryid; // PICK에 설정된 카테고리 ID
	private String categoryName; // 해당 카테고리의 이름.
	
	
	public PickCategory() {
		super();
	}


	public PickCategory(int id, int pickid, int categoryid, String categoryName) {
		super();
		this.id = id;
		this.pickid = pickid;
		this.categoryid = categoryid;
		this.categoryName = categoryName;
	}


	public PickCategory(int categoryid, String categoryName) {
		super();
		this.categoryid = categoryid;
		this.categoryName = categoryName;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getPickid() {
		return pickid;
	}


	public void setPickid(int pickid) {
		this.pickid = pickid;
	}


	public int getCategoryid() {
		return categoryid;
	}


	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	@Override
	public String toString() {
		return "PickCategory [id=" + id + ", pickid=" + pickid + ", categoryid=" + categoryid + ", categoryName="
				+ categoryName + "]";
	}	
	
	

}
