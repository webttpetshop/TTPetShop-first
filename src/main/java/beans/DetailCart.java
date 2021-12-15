package beans;

import java.util.List;

public class DetailCart {
	private int cartID;
	private int productID;
	private int quantity;
	private int status;
	private Products pro;
	public Products getPro() {
		return pro;
	}
	public void setPro(Products pro) {
		this.pro = pro;
	}
	public int getCartID() {
		return cartID;
	}
	public void setCartID(int cartID) {
		this.cartID = cartID;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
