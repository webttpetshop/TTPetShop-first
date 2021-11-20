package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.*;
import mapping.*;

public class ProductUtils {
	public static List<Products> listUser(Connection conn) throws SQLException {
		   String sql = "SELECT * FROM Products";
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   ResultSet rs = pstm.executeQuery();
		   System.out.println("connected!");
		   List<Products> list = new ArrayList<Products >();
		   while (rs.next()) {
			   Products  pd = ProductMapping.maProducts(rs);
		      list.add(pd);
		   }
		   System.out.println("connect prodcut!");
		   return list;
	}
}
