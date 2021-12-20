package beans;

import java.util.List;

public class Bill {
	private int billID;
	private String username;
	private int total;
	private String discountID;
	private String date;
	private int status;
	private List<DetailBill> dtBill;
	public int getBillID() {
		return billID;
	}
	public List<DetailBill> getDtBill() {
		return dtBill;
	}
	public void setDtBill(List<DetailBill> dtBill) {
		this.dtBill = dtBill;
	}
	public void setBillID(int billID) {
		this.billID = billID;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getDiscountID() {
		return discountID;
	}
	public void setDiscountID(String discountID) {
		this.discountID = discountID;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	

}
