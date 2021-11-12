package utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import beans.Users;

public class DBUtils {
	public static List<Users> listUser(Connection conn) throws SQLException {
		   String sql = "SELECT * FROM Users";
		   
		   System.out.println("connected!");
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   ResultSet rs = pstm.executeQuery();
		   System.out.println("connected!");
		   List<Users> list = new ArrayList<Users>();
		   while (rs.next()) {
		       String userID = rs.getString("userID");
		       String password = rs.getString("password");
		       String fullname = rs.getString("fullname");
		       String pic = rs.getString("pic");
		       String address = rs.getString("address");
		       String phone = rs.getString("phone");
		       int coins =rs.getInt("coins");
		       int role =rs.getInt("role");
		       
		       Users us = new Users();
		       us.setUserID(userID);
		       us.setPassword(password);;
		       us.setFullname(fullname);
		       us.setPic(pic);
		       us.setAddress(address);
		       us.setPhone(phone);
		       us.setCoins(coins);
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
		       String userID = rs.getString("userID");
		       String password = rs.getString("password");
		       String fullname = rs.getString("fullname");
		       String pic = rs.getString("pic");
		       String address = rs.getString("address");
		       String phone = rs.getString("phone");
		       int coins =rs.getInt("coins");
		       int role =rs.getInt("role");
		       
		       Users us = new Users();
		       us.setUserID(userID);
		       us.setPassword(password);;
		       us.setFullname(fullname);
		       us.setPic(pic);
		       us.setAddress(address);
		       us.setPhone(phone);
		       us.setCoins(coins);
		      list.add(us);
		   }
		   System.out.println("connect student!");
		   return list;
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
}
