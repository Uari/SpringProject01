package com.bh.VO;

public class BBEVO {
	private int taxi_no;
	private String taxi_kind;
	private int cnt;
	private int price;
	private String state;
	private String u_id;
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getTaxi_no() {
		return taxi_no;
	}
	public void setTaxi_no(int taxi_no) {
		this.taxi_no = taxi_no;
	}
	public String getTaxi_kind() {
		return taxi_kind;
	}
	public void setTaxi_kind(String taxi_kind) {
		this.taxi_kind = taxi_kind;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
