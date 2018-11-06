package com.pick.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PickMe implements Serializable{
	
	private static final long serialVersionUID = 30000L;
	
	private int id;   // pick 게시물 id
	private String select_1; // 1번 pick
	private String select_2; // 2번 pick
	private String title; // pick 제목
	private String content; // pick 게시글 내용
	private int category; // pick 카테고리
	private Date edate; // pick 업로드 일자
	private int viewcount; // pick 상세 조회수
	private Date ddate; // pick 마감일자.
	private String type; // pick 상태(마감여부?)
	
	
	public PickMe(){}	
	

	public PickMe(String select_1, String select_2, String title, int category, Date ddate) {
		super();
		this.select_1 = select_1;
		this.select_2 = select_2;
		this.title = title;
		this.category = category;		
		this.ddate = ddate;
		// pick 메인 페이지용 객체
		
	}


	public PickMe(int id, String select_1, String select_2, String title, String content, int category, Date edate,
			int viewcount, Date ddate, String type) {
		super();
		this.id = id;
		this.select_1 = select_1;
		this.select_2 = select_2;
		this.title = title;
		this.content = content;
		this.category = category;
		this.edate = edate;
		this.viewcount = viewcount;
		this.ddate = ddate;
		this.type = type;
		
		// pick 상세 페이지용
		
	}


	@Override
	public String toString() {
		return "PickMe [id=" + id + ", select_1=" + select_1 + ", select_2=" + select_2 + ", title=" + title
				+ ", content=" + content + ", category=" + category + ", edate=" + edate + ", viewcount=" + viewcount
				+ ", ddate=" + ddate + ", type=" + type + "]";
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getSelect_1() {
		return select_1;
	}


	public void setSelect_1(String select_1) {
		this.select_1 = select_1;
	}


	public String getSelect_2() {
		return select_2;
	}


	public void setSelect_2(String select_2) {
		this.select_2 = select_2;
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


	public int getCategory() {
		return category;
	}


	public void setCategory(int category) {
		this.category = category;
	}


	public Date getEdate() {
		return edate;
	}


	public void setEdate(Date edate) {
		this.edate = edate;
	}


	public int getViewcount() {
		return viewcount;
	}


	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}


	public Date getDdate() {
		return ddate;
	}


	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
		

}
