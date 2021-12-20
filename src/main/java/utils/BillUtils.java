package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class BillUtils {

	public static void MapFromCartToBill(Connection conn, String username, int cartID) {
		// TODO Auto-generated method stub
		String sql="";
		try {
			sql = "EXEC us_MapFromCartToBill @username=? , @cartID=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, username);
			pstm.setInt(2, cartID);
       		pstm.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	public static void cancelOrder(Connection conn, String billID) {
		// TODO Auto-generated method stub
		try {
			String sqlString="EXEC us_cancelOrder @billID=?";
			PreparedStatement pstm = conn.prepareStatement(sqlString);
			pstm.setInt(1,Integer.parseInt(billID) );
			pstm.executeQuery();
			System.out.println("cancal order utils");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}

	public static void ReceivedBill(Connection conn, int billID) {
		// TODO Auto-generated method stub
		try {
			String sqlString = "UPDATE dbo.Bill SET status =2 WHERE billID=?";
			PreparedStatement pstm = conn.prepareStatement(sqlString);
			pstm.setInt(1, billID);
			pstm.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	

}
