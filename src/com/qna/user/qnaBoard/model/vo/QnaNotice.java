package com.qna.user.qnaBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class QnaNotice implements Serializable{

	private int qnno;
	private String qcategory;
	private String qtitle;
	private String qcontent;
	private String qwriter;
	private int qcount;
	private Date qdate;
	

 public QnaNotice(){}

public QnaNotice(String qtitle, String qcontent, String qwriter, String qcategory) {
	super();
	this.qtitle = qtitle;
	this.qcontent = qcontent;
	this.qwriter = qwriter;
	this.qcategory = qcategory;
}

public QnaNotice(int qnno, String qtitle, String qcontent, String qwriter, int qcount, Date qdate, String qcategory) {
	super();
	this.qnno = qnno;
	this.qtitle = qtitle;
	this.qcontent = qcontent;
	this.qwriter = qwriter;
	this.qcount = qcount;
	this.qdate = qdate;
	this.qcategory = qcategory;
}

/**
 * @return the qnno
 */
public int getQnno() {
	return qnno;
}

/**
 * @param qnno the qnno to set
 */
public void setQnno(int qnno) {
	this.qnno = qnno;
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
 * @return the qwriter
 */
public String getQwriter() {
	return qwriter;
}

/**
 * @param qwriter the qwriter to set
 */
public void setQwriter(String qwriter) {
	this.qwriter = qwriter;
}

/**
 * @return the qcount
 */
public int getQcount() {
	return qcount;
}

/**
 * @param qcount the qcount to set
 */
public void setQcount(int qcount) {
	this.qcount = qcount;
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

/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */
@Override
public String toString() {
	return "QnaNotice [qnno=" + qnno + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qwriter=" + qwriter
			+ ", qcount=" + qcount + ", qdate=" + qdate + ", qcategory ="+ qcategory + "]";
}


 

}
