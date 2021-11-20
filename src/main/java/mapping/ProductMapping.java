package mapping;

import java.sql.ResultSet;

import beans.Products;

public class ProductMapping {
	public static Products maProducts (ResultSet rs)
	{
		try {
			Products pd = new Products();
			pd.setProductID(rs.getInt("productID"));
			pd.setName(rs.getString("name"));
			pd.setPrice(rs.getFloat("price"));
			pd.setProductID(rs.getInt("categoryID"));
			pd.setName(rs.getString("description"));
			pd.setName(rs.getString("pic"));
			pd.setProductID(rs.getInt("quantity"));
			pd.setProductID(rs.getInt("viewed"));
			return pd;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

}
