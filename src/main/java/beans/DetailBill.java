package beans;

public class DetailBill {
	private int billID;
	private int productID;
	public int getBillID() {
		return billID;
	}
	public void setBillID(int billID) {
		this.billID = billID;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public Products getProducts() {
		return products;
	}
	public void setProducts(Products products) {
		this.products = products;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	private Products products;
	private int quantity;
	

}
