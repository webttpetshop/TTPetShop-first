package beans;

public class Users {
	public Users() {
	}
	private Cart cartID;
	public Cart getCartID() {
		return cartID;
	}
	public void setCartID(Cart cartID) {
		this.cartID = cartID;
	}
	private String username;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getCoins() {
		return coins;
	}
	public void setCoins(int coins) {
		this.coins = coins;
	}
	private String password;
	private String fullname;
	private String address;
	private String phone;
	private int coins;
	private String email;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	private int role;
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}

}
