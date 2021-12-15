package mapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import beans.Users;

public class UserMapping {
	public static Users maUsers (ResultSet rs)
	{
		try {
			String userID = rs.getString("username");
		       String password = rs.getString("password");
		       String fullname = rs.getString("fullname");
		       String address = rs.getString("address");
		       String phone = rs.getString("phone");
		       String email=rs.getString("email");
		       int coins =rs.getInt("coins");
		       int role =rs.getInt("role");
		       
		       Users us = new Users();
		       us.setUsername(userID);
		       us.setPassword(password);;
		       us.setFullname(fullname);
		       us.setAddress(address);
		       us.setPhone(phone);
		       us.setEmail(email);
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
