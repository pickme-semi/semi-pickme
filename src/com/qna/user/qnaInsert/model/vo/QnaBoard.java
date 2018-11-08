package com.qna.user.qnaInsert.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class QnaBoard implements Serializable{

	private static final long serialVersionUID = 30000L;
	
	private int qid;
	private String qtitle;
	private String qcontent;
	private String qstatus;
	private Date qdate;
	private int qno;
	private String qcategory;
	private String qemail;
	private int qalert;
	private int qphone;
	
	public QnaBoard(){}

	public QnaBoard(String qtitle, String qcontent, String qcategory, String qemail, int qalert, int qphone) {
		super();
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qcategory = qcategory;
		this.qemail = qemail;
		this.qalert = qalert;
		this.qphone = qphone;
	}

	public QnaBoard(int qid, String qtitle, String qcontent, String qstatus, Date qdate, int qno, String qcategory,
			String qemail, int qalert, int qphone) {
		super();
		this.qid = qid;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qstatus = qstatus;
		this.qdate = qdate;
		this.qno = qno;
		this.qcategory = qcategory;
		this.qemail = qemail;
		this.qalert = qalert;
		this.qphone = qphone;
	}

	/**
	 * @return the qid
	 */
	public int getQid() {
		return qid;
	}

	/**
	 * @param qid the qid to set
	 */
	public void setQid(int qid) {
		this.qid = qid;
	}

	/**
	 * @return the qtitle
	 */
	public String getQtitle() {
		return qtitle;
	}

	/**
	 * @param qtitle the qtitle to set
	 */
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	/**
	 * @return the qcontent
	 */
	public String getQcontent() {
		return qcontent;
	}

	/**
	 * @param qcontent the qcontent to set
	 */
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	/**
	 * @return the qstatus
	 */
	public String getQstatus() {
		return qstatus;
	}

	/**
	 * @param qstatus the qstatus to set
	 */
	public void setQstatus(String qstatus) {
		this.qstatus = qstatus;
	}

	/**
	 * @return the qdate
	 */
	public Date getQdate() {
		return qdate;
	}

	/**
	 * @param qdate the qdate to set
	 */
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}

	/**
	 * @return the qno
	 */
	public int getQno() {
		return qno;
	}

	/**
	 * @param qno the qno to set
	 */
	public void setQno(int qno) {
		this.qno = qno;
	}

	/**
	 * @return the qcategory
	 */
	public String getQcategory() {
		return qcategory;
	}

	/**
	 * @param qcategory the qcategory to set
	 */
	public void setQcategory(String qcategory) {
		this.qcategory = qcategory;
	}

	/**
	 * @return the qemail
	 */
	public String getQemail() {
		return qemail;
	}

	/**
	 * @param qemail the qemail to set
	 */
	public void setQemail(String qemail) {
		this.qemail = qemail;
	}

	/**
	 * @return the qalert
	 */
	public int getQalert() {
		return qalert;
	}

	/**
	 * @param qalert the qalert to set
	 */
	public void setQalert(int qalert) {
		this.qalert = qalert;
	}

	/**
	 * @return the qphone
	 */
	public int getQphone() {
		return qphone;
	}

	/**
	 * @param qphone the qphone to set
	 */
	public void setQphone(int qphone) {
		this.qphone = qphone;
	}

	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "QnaBoard [qid=" + qid + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qstatus=" + qstatus
				+ ", qdate=" + qdate + ", qno=" + qno + ", qcategory=" + qcategory + ", qemail=" + qemail + ", qalert="
				+ qalert + ", qphone=" + qphone + "]";
	}
	
	
	
}
