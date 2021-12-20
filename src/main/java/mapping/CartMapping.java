package mapping;

import java.sql.ResultSet;

import beans.Cart;
import beans.DetailCart;

public class CartMapping {

	public static DetailCart maDetailCart (ResultSet rs)
	{
		try {
			DetailCart ct = new DetailCart();
			ct.setProductID(rs.getInt("productID"));
			ct.setCartID(rs.getInt("cartID"));
			ct.setQuantity(rs.getInt("quantity"));
			ct.setStatus(rs.getInt("status"));
			return ct;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	public static Cart maCart(ResultSet rs) {
		try {
			Cart cart= new Cart();
			cart.setCartID(rs.getInt("cartID"));
			cart.setTotal(rs.getInt("total"));
			cart.setUsername(rs.getString("username"));
			cart.setDiscountID(rs.getString("discountID"));
			return cart;
		} catch (Exception e) {
			return null;
		}
	}

}
