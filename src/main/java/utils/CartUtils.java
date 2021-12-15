package utils;

import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.DetailCart;
import beans.Products;
import mapping.CartMapping;
import mapping.CategoryMapping;
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

}
