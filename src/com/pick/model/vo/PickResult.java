package com.pick.model.vo;

import java.sql.Date;

public class PickResult {

	private int id;   // pick 게시물 id
	private int result ; // 1 or 2
	private Date ddate; // pick 마감일자.
	private int userno; // pick 작성자 id
	public PickResult() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PickResult(int id, int result) {
		super();
		this.id = id;
		this.result = result;
	}
	
	public PickResult(int id, int result, Date ddate, int userno) {
		super();
		this.id = id;
		this.result = result;
		this.ddate = ddate;
		this.userno = userno;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public Date getDdate() {
		return ddate;
	}
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	@Override
	public String toString() {
		return "PickResult [id=" + id + ", result=" + result + ", ddate=" + ddate + ", userno=" + userno + "]";
	}

	
	


}

