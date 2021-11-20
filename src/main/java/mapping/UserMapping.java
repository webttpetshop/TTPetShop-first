package mapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import beans.Users;

public class UserMapping {
	public static Users maUsers (ResultSet rs)
	{
		try {
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
		       us.setRole(role);
		       return us;
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

}
