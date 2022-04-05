package com.bh.VO;

public class JoinVO {
	private String taxi_kind;
	private int cnt;
	private int price;
	String u_id;
	int point;
	
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
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
