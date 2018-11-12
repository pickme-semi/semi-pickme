package com.qna.user.qnaUserInsert.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class QnaBoard implements Serializable{

	private static final long serialVersionUID = 30000L;
	
	private int qid;
	private String qtitle;
	private String qcontent;
	private Date qdate;
	private String qstatus;
	private String qcategory;
	private int qno;
	private int qpickId;
	private String qtype;
	private int qalert;
    private int qphone;
	private String qemail;
	private String qfile;
	
	public QnaBoard(){}

	
	
	public QnaBoard(String qtitle, String qcontent, String qcategory, int qpickId, int qalert, int qphone, String qemail, String qfile) {
		super();
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qcategory = qcategory;
		this.qpickId = qpickId;
		this.qalert = qalert;
		this.qphone = qphone;
		this.qemail = qemail;
		this.qfile = qfile;
	}



	public QnaBoard(int qid, String qtitle, String qcontent, Date qdate, String qstatus, String qcategory, int qno,
			int qpickId, String qtype, int qalert, int qphone, String qemail, String qfile) {
		super();
		this.qid = qid;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qdate = qdate;
		this.qstatus = qstatus;
		this.qcategory = qcategory;
		this.qno = qno;
		this.qpickId = qpickId;
		this.qtype = qtype;
		this.qalert = qalert;
		this.qphone = qphone;
		this.qemail = qemail;
		this.qfile = qfile;
	}


	
	/**
	 * @return the qfile
	 */
	public String getQfile() {
		return qfile;
	}



	/**
	 * @param qfile the qfile to set
	 */
	public void setQfile(String qfile) {
		this.qfile = qfile;
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
	 * @return the qcategory
	 */
	public String getQcategory() {
		return qcategory;
	}



	/**
	 * @param qcategory the qcategory to set
	 */
	public void setQcategory (String qcategory) {
		this.qcategory = qcategory;
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
	 * @return the qpickId
	 */
	public int getQpickId() {
		return qpickId;
	}



	/**
	 * @param qpickId the qpickId to set
	 */
	public void setQpickId(int qpickId) {
		this.qpickId = qpickId;
	}



	/**
	 * @return the qtype
	 */
	public String getQtype() {
		return qtype;
	}



	/**
	 * @param qtype the qtype to set
	 */
	public void setQtype(String qtype) {
		this.qtype = qtype;
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
		return "QnaBoard [qid=" + qid + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qdate=" + qdate
				+ ", qstatus=" + qstatus + ", qcategory=" + qcategory + ", qno=" + qno + ", qpickId=" + qpickId
				+ ", qtype=" + qtype + ", qalert=" + qalert + ", qphone=" + qphone + ", qemail=" + qemail +
				", qfile=" + qfile + "]";
	}
	
	
	
	
}
