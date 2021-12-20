package mapping;

import java.sql.ResultSet;

import beans.Bill;

public class BillMapping {
	public static Bill maBill (ResultSet rs)
	{
		try {
			Bill bill= new Bill();
			bill.setBillID(rs.getInt("billID"));
			bill.setDate(rs.getString("date"));
			bill.setDiscountID(rs.getString("discountID"));
			bill.setStatus(rs.getInt("status"));
			bill.setTotal(rs.getInt("total"));
			bill.setUsername(rs.getString("username"));
			return bill;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
}
