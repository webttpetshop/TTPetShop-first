package mapping;

import java.sql.ResultSet;

import beans.*;

public class CategoryMapping {
	public static Categories maCategories (ResultSet rs)
	{
		try {
			Categories ct = new Categories();
			ct.setCategoryID(rs.getString("categoryID"));
			ct.setNameCat(rs.getString("nameCat"));
			return ct;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

}
