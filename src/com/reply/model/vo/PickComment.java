package com.reply.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PickComment implements Serializable{
	
	private int cid; // 댓글 id번호
	private int userno; // 댓글 작성자 id번호
	private int pid; // 댓글 달린 pick의 id번호
	private String ccontent; // 댓글내용
	private int clevel; // 댓글 레벨
	private Date edate; // 댓글 작성일
	private int refcno; // 대댓글 관련;
	private String name;
	
	
	public PickComment(){
		
	}


	


	public PickComment(int userno, int pid, String ccontent, int clevel, int refcno) {
		super();
		this.userno = userno;
		this.pid = pid;
		this.ccontent = ccontent;
		this.clevel = clevel;
		this.refcno = refcno;
	}





	public PickComment(int cid, int userno, int pid, String ccontent, int clevel, Date edate, int refcno, String name) {
		super();
		this.cid = cid;
		this.userno = userno;
		this.pid = pid;
		this.ccontent = ccontent;
		this.clevel = clevel;
		this.edate = edate;
		this.refcno = refcno;
		this.name = name;
	}





	public int getRefcno() {
		return refcno;
	}

	public void setRefcno(int refcno) {
		this.refcno = refcno;
	}

	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public int getUserno() {
		return userno;
	}


	public void setUserno(int userno) {
		this.userno = userno;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getCcontent() {
		return ccontent;
	}


	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}


	public int getClevel() {
		return clevel;
	}


	public void setClevel(int clevel) {
		this.clevel = clevel;
	}


	public Date getEdate() {
		return edate;
	}


	public void setEdate(Date edate) {
		this.edate = edate;
	}





	public String getName() {
		return name;
	}





	public void setName(String name) {
		this.name = name;
	}





	@Override
	public String toString() {
		return "PickComment [cid=" + cid + ", userno=" + userno + ", pid=" + pid + ", ccontent=" + ccontent
				+ ", clevel=" + clevel + ", edate=" + edate + ", refcno=" + refcno + ", name=" + name + "]";
	}




	
	
}