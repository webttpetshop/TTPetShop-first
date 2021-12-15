package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Categories;
import beans.DetailCart;
import mapping.CategoryMapping;

public class CategoryUtils {
	public static List<Categories> getListCat(Connection conn) throws SQLException {
		   String sql = "SELECT * FROM Category ";
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   ResultSet rs = pstm.executeQuery();
		   List<Categories> list = new ArrayList<Categories>();
		   while (rs.next()) {
			   Categories  ct = CategoryMapping.maCategories(rs);
		      list.add(ct);
		      System.out.println("product" + list.size());
		   }
		   System.out.println("connect prodcut!");
		   return list;
	}
	
}
