package mapping;

import java.sql.ResultSet;

import beans.Discount;

public class DiscountMapping {
	public static Discount maDiscount (ResultSet rs) {
		try {
			Discount dis = new Discount();
			dis.setDiscountID(rs.getString("discountID"));
			dis.setQuantity(rs.getInt("quantity"));
			dis.setQuanlity(rs.getInt("quanlity"));
			dis.setDesDiscount(rs.getString("desDiscount"));
			return dis;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
	
