package beans;

public class Cart {
	private int cartID;
	private String username;
	private int total;
	private String discountID;
	private Discount discount;
	public Discount getDiscount() {
		return discount;
	}
	public void setDiscount(Discount discount) {
		this.discount = discount;
	}
	public String getDiscountID() {
		return discountID;
	}
	public void setDiscountID(String discountID) {
		this.discountID = discountID;
	}
	public int getCartID() {
		return cartID;
	}
	public void setCartID(int cartID) {
		this.cartID = cartID;
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

}
