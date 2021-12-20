package utils;

import java.security.interfaces.RSAKey;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import beans.DetailCart;
import beans.Discount;
import beans.Products;
import mapping.CartMapping;
import mapping.CategoryMapping;
import mapping.DiscountMapping;
import mapping.ProductMapping;

public class CartUtils {
	public static List<DetailCart> getLstDetailCarts(Connection conn, int cartID ) throws SQLException {
		   String sql = "SELECT * FROM DetailCart where cartID=? ";
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   pstm.setInt(1, cartID);
		   ResultSet rs = pstm.executeQuery();
		   List<DetailCart> list = new ArrayList<DetailCart>();
		   while (rs.next()) {
			   DetailCart  ct = CartMapping.maDetailCart(rs);
			   ct.setPro(getProByCart(conn, ct.getProductID()));
			   list.add(ct);
		   }
		   System.out.println("connect prodcut!");
		   return list;
	}
	public static List<DetailCart> GetListProWithStatusIsOne(Connection conn, int cartID ) throws SQLException {
		   String sql = "EXEC dbo.us_GetListProWithStatusIsOne @cartID = ?";
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   pstm.setInt(1, cartID);
		   ResultSet rs = pstm.executeQuery();
		   List<DetailCart> list = new ArrayList<DetailCart>();
		   while (rs.next()) {
			   DetailCart  ct = CartMapping.maDetailCart(rs);
			   ct.setPro(getProByCart(conn, ct.getProductID()));
			   list.add(ct);
		   }
		   System.out.println("connect prodcut!");
		   return list;
	}
	
	public static void DelDisIDForUserCart(Connection conn, String username) throws SQLException {
		try {
			String sql = "EXEC us_UpdateDisIDforUserCart @username=?, @disID=NULL";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, username);
			pstm.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	public static void UpdateDisIDForUserCart(Connection conn, String disID, String username) throws SQLException {
		try {
			String sql = "EXEC us_UpdateDisIDforUserCart @username=?, @disID=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, username);
			pstm.setString(2, disID);
			pstm.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	public static Discount getDiscountID(Connection conn, String disID) throws SQLException {
		String sql = "SELECT * FROM dbo.Discount WHERE discountID=?";
	   PreparedStatement pstm = conn.prepareStatement(sql);
	   pstm.setString(1, disID);
	   ResultSet rs = pstm.executeQuery();
	   //List<DetailCart> list = new ArrayList<DetailCart>();
	   if (rs.next()) {
		   Discount  ct = DiscountMapping.maDiscount(rs);
		   return ct;
	   }
	   return null;
	}
	
	public static Products getProByCart(Connection conn, int proID) throws SQLException {
			String sql = "SELECT * FROM dbo.Products WHERE productID = ?";
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   pstm.setInt(1, proID);
		   ResultSet rs = pstm.executeQuery();
		   //List<DetailCart> list = new ArrayList<DetailCart>();
		   if (rs.next()) {
			   Products  ct = ProductMapping.maProducts(rs);
			   return ct;
		   }
		   return null;
	}
	public static void InsertDetailCart(Connection conn, int cartID,int proID, int i) throws SQLException {
		// TODO Auto-generated method stub
		try {
			String sql = "EXEC dbo.us_addtoDetailCart @proID=? , @amount = ?, @cartID = ?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, proID);
			pstm.setInt(2, i);
			pstm.setInt(3, cartID);
			ResultSet rs = pstm.executeQuery();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public static void changeStatus(Connection conn, int cartID, int proID, int status) {
		// TODO Auto-generated method stub
		try {
			String sql = "EXEC dbo.us_changeStatus @cartID = ? , @proID =? ,@status = ?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, cartID);
			pstm.setInt(2, proID);
			pstm.setInt(3, status);
			pstm.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public static int getTotalPriceItem(Connection conn, int cartID, int proID) {
		// TODO Auto-generated method stub
		try {
			String sql = "SELECT dbo.getTotalPriceItem(?,?)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, cartID);
			pstm.setInt(2, proID);
			ResultSet rs = pstm.executeQuery();
			if(rs.next())
			{
				System.out.println(rs.getInt(1));
				return rs.getInt(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return 0;
	}

	public static int findProWithStatusIsOne(Connection conn, int cartID) {
		// TODO Auto-generated method stub
		try {
		      //Preparing a CallableStatement to call a function
		      CallableStatement cstmt = conn.prepareCall("{? = call us_findProWithStatusIsOne(?)}");
		      //Registering the out parameter of the function (return type)
		      cstmt.registerOutParameter(1, Types.INTEGER);
		      //Setting the input parameters of the function
		      cstmt.setInt(2, cartID);
		      //Executing the statement
		      cstmt.execute();
		      System.out.print("get total pros with status=1");
		      return cstmt.getInt(1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}
	

}
