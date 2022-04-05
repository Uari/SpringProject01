package com.bh.VO;


public class ReviewVO {
	private String u_id;
	private String r_memo;
	private String r_date;
	private int r_grade;
	private int no;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getR_memo() {
		return r_memo;
	}

	public void setR_memo(String r_memo) {
		this.r_memo = r_memo;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public int getR_grade() {
		return r_grade;
	}

	public void setR_grade(int r_grade) {
		this.r_grade = r_grade;
	}

}
