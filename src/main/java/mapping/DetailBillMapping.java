package mapping;

import java.sql.ResultSet;

import beans.DetailBill;

public class DetailBillMapping {
	public static DetailBill mDetailBill (ResultSet rs)
	{
		try {
			DetailBill dtB= new DetailBill();
			dtB.setBillID(rs.getInt("billID"));
			dtB.setQuantity(rs.getInt("quantity"));
			dtB.setProductID(rs.getInt("productID"));
			return dtB;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
}
