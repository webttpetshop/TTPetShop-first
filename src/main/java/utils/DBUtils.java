package utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.When;

import beans.Bill;
import beans.Cart;
import beans.DetailBill;
import beans.DetailCart;
import beans.Products;
import beans.Users;
import mapping.BillMapping;
import mapping.CartMapping;
import mapping.DetailBillMapping;
import mapping.ProductMapping;
import mapping.UserMapping;

public class DBUtils {
	public static List<Users> listUser(Connection conn) throws SQLException {
		   String sql = "SELECT * FROM Users";
		   
		   System.out.println("connected!");
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   ResultSet rs = pstm.executeQuery();
		   System.out.println("connected!");
		   List<Users> list = new ArrayList<Users>();
		   while (rs.next()) {
			   Users us = UserMapping.maUsers(rs);
		      list.add(us);
		   }
		   System.out.println("connect student!");
		   return list;
	}
	
	public static List<Users> getRcord(Connection conn, int start, int total) throws SQLException {
		   String sql = "SELECT * from (SELECT ROW_NUMBER() OVER (ORDER BY coins) AS r, *FROM dbo.Users) AS sub  WHERE sub.r between (?-1)*?+1 AND ?*?";
		   System.out.println("connected!");
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   pstm.setInt(1, start);
		   pstm.setInt(2, total);
		   pstm.setInt(3, start);
		   pstm.setInt(4, total);
		  // pstm.setInt(3, total);
		  // pstm.setInt(4, start);
		  // pstm.setInt(5, total);
		   ResultSet rs = pstm.executeQuery();
		   System.out.println("connected!");
		   List<Users> list = new ArrayList<Users>();
		   while (rs.next()) {

			   Users us = UserMapping.maUsers(rs);
		      list.add(us);
		   }
		   System.out.println("connect student!");
		   return list;
	}
	public static Users findUserByID(Connection conn, String username, String password) throws SQLException {
		   String sql = "SELECT  distinct * FROM Users where username= ? and password = ?";
		   
		   System.out.println("find user!");
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   pstm.setString(1, username);
		   pstm.setString(2, password);
		   ResultSet rs = pstm.executeQuery();
		   System.out.println("begin find!");
		   //List<Users> list = new ArrayList<Users>();
		   if (rs.next()) {

			   Users us = UserMapping.maUsers(rs);
			   us.setCartID(getCartByUsername(conn, us.getUsername()));
			   System.out.println("end find user and success");
		       return us;

		   }
		   return null;
	}

	private static Cart getCartByUsername(Connection conn, String username) throws SQLException {
		String sql = "SELECT * FROM dbo.Cart WHERE username=?";
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   pstm.setString(1, username);
		   ResultSet rs = pstm.executeQuery();
		   //List<DetailCart> list = new ArrayList<DetailCart>();
		   if (rs.next()) {
			   Cart  ct = CartMapping.maCart(rs);
			   ct.setDiscount(CartUtils.getDiscountID(conn, ct.getDiscountID()));
			   return ct;
		   }
		   return null;
	}

	public static void addUser(Connection conn, String username, String fullname, String email, String password,
			String address, String phone, String role) {
		// TODO Auto-generated method stub
		try {
			String sql = "EXEC ad_addUser @Username=?, @fullname=?, @Email=?, @password=?, @address=?, @phone=?, @role=?";

			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, username);
			pstm.setString(2, fullname);
			pstm.setString(3, email);
			pstm.setString(4, password);
			pstm.setString(5, address);
			pstm.setString(6, phone);
			if(role != null )
				pstm.setInt(7, Integer.parseInt(role) );
			else {
				pstm.setInt(7, 0 );
			}
			pstm.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	public static void editUser(Connection conn, String username, String fullname, String email, String password,
			String address, String phone, String role) {
		// TODO Auto-generated method stub
		try {
			String sql = "EXEC ad_editUser @Username=?, @fullname=?, @Email=?, @password=?, @address=?, @phone=?, @role=?";

			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, username);
			pstm.setString(2, fullname);
			pstm.setString(3, email);
			pstm.setString(4, password);
			pstm.setString(5, address);
			pstm.setString(6, phone);
			if(role != null )
				pstm.setInt(7, Integer.parseInt(role) );
			else {
				pstm.setInt(7, 0 );
			}
			pstm.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	public static Users findUserByUsername(Connection conn, String username) {
		// TODO Auto-generated method stub
		System.out.println("findUserByUsername - DBUtils");
		try {
			String sql="EXEC ad_findUserByUsername @Username=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, username);
			   ResultSet rs = pstm.executeQuery();
			   if (rs.next()) {
				   Users us = UserMapping.maUsers(rs);
					System.out.println(us.getUsername());
			       return us;

			   }
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
		
	}

	public static List<Bill> GetBillByUsernameAndStatus(Connection conn,String username, int i, int j) {
		   
		try {
			String sql = "EXEC us_GetBillByUsernameAndStatus @username=?, @status=?, @status2=?";
			   PreparedStatement pstm = conn.prepareStatement(sql);
			   pstm.setString(1, username);
			   pstm.setInt(2, j);
			   pstm.setInt(3, j);
			   ResultSet rs = pstm.executeQuery();
			   System.out.println("connected!");
			   List<Bill> list = new ArrayList<Bill>();
			   while (rs.next()) {

				   Bill us = BillMapping.maBill(rs);
				   us.setDtBill(getDetailBillbyBillID(conn, us.getBillID()));
			      list.add(us);
			   }
			   return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	private static List<DetailBill> getDetailBillbyBillID(Connection conn, int billID) {
		// TODO Auto-generated method stub
		try {
			String sql = "EXEC us_getDetailBillByBillID @BillID=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, billID);
			ResultSet rs = pstm.executeQuery();
			List<DetailBill> list = new ArrayList<DetailBill>();
			while (rs.next()) {

				   DetailBill us = DetailBillMapping.mDetailBill(rs);
				   us.setProducts(getProductbyDTBill(conn, us.getProductID()));
				   list.add(us);
			}
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		}
	private static Products getProductbyDTBill(Connection conn, int proID) {
		// TODO Auto-generated method stub
		try {
			String sql = "SELECT * FROM dbo.Products WHERE productID=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, proID);
			ResultSet rs = pstm.executeQuery();
			Products us = new Products();
			if (rs.next()) {

				   us = ProductMapping.maProducts(rs);
			}
			return us;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
}
		   

















/*	public static SinhVien findSinhVien(Connection conn, int idIn) throws SQLException {
	    String sql ="Select a.id, a.name, a.address from student a where a.id=?";
	    PreparedStatement pstm = conn.prepareStatement(sql);
	    pstm.setInt(1, idIn);
	    //"Select a.id, a.name, a.address from Student a where a.id=12";
	    ResultSet rs = pstm.executeQuery();
	    while (rs.next()) {
	         int id= rs.getInt("id");
	        String name = rs.getString("name");
	        String diachi = rs.getString("address");
	        SinhVien sv = new SinhVien(id, name, diachi);
	        return sv;
	    }
	    return null;
	}
	
	public static void updateSinhVien(Connection conn, SinhVien sv) throws SQLException {
		   String sql = "Update student set name=?, address=? where id=? ";
		   PreparedStatement pstm = conn.prepareStatement (sql);
		   pstm.setString(1, sv.getHoten());
		   pstm.setString(2, sv.getDiachi());
		   pstm. setInt(3, sv.getId());
		   //"Update Student set name='nguyen van a', address='thu duc where id-12"
		   pstm.executeUpdate();
	}*/

