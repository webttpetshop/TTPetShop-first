package utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.*;
import mapping.*;

public class ProductUtils {
	
	public static List<Products> getRcord(Connection conn, int start, int total) throws SQLException {
		   String sql = "SELECT * from (SELECT ROW_NUMBER() OVER (ORDER BY productID) AS r, *FROM dbo.Products) AS sub  WHERE sub.r between (?-1)*?+1 AND ?*?";
		   System.out.println("connected!");
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   pstm.setInt(1, start);
		   pstm.setInt(2, total);
		   pstm.setInt(3, start);
		   pstm.setInt(4, total);
		   ResultSet rs = pstm.executeQuery();
		   System.out.println("connected!");
		   List<Products> list = new ArrayList<Products>();
		   while (rs.next()) {

			   Products us = ProductMapping.maProducts(rs); 
		      list.add(us);
		   }
		   System.out.println("select list py page of product list - ProductUtils!");
		   return list;
	}
	
	public static Products getProByID(Connection conn, int id) throws SQLException {
		   System.out.println("Begin- getProByID - ProUtil");
		   String sql = "EXEC getProByID @id = ?";
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   pstm.setInt(1, id);
		   ResultSet rs = pstm.executeQuery();
		   while (rs.next()) {
			   Products us = ProductMapping.maProducts(rs); 
			   System.out.println("found pro - getProByID - ProUtil");
			   return us;
		   }
		   System.out.println("Not found - getProByID - ProUtil");
		   return null;
	}

	public static void InsertPro(Connection conn, int productID, String name, String description, int price,
			int quantity, String categoryID, int viewed, InputStream file) {
		// TODO Auto-generated method stub
		String sql="";
		try {
			if (productID==0)
			{
				sql = "INSERT INTO Products (name,price,categoryID,description,pic,quantity,viewed) "
						+ "values (?, ?, ?, ?, ?, ?, ?)";
				System.out.println("insert");

				System.out.println(sql);
				   PreparedStatement pstm = conn.prepareStatement(sql);
				   //pstm.setInt(1, productID);
				   pstm.setString(1, name);
				   pstm.setString(4, description);
				   pstm.setInt(2, price);
				   pstm.setInt(6, quantity);
				   //pstm.setString(3, categoryID);
				   pstm.setString(3, categoryID);
				   pstm.setInt(7, viewed);
		       		if (file != null) {
		               // fetches input stream of the upload file for the blob column
		       			pstm.setBinaryStream(5, file);
		           }
		       		pstm.executeUpdate();
		       		System.out.println("inserted pro - InsertPro - ProUtil");
			}
			else {

	       		System.out.println("update pro - InsertPro - ProUtil");
				sql = "EXEC dbo.updatePro @id=?, @name=?, @price=?, @categoryID=?, @description=?, @pic=?, @quantity=?, @viewed=?";
				PreparedStatement pstm1 = conn.prepareStatement(sql);
				   pstm1.setInt(1, productID);
				   pstm1.setString(2, name);
				   pstm1.setString(5, description);
				   pstm1.setInt(3, price);
				   pstm1.setInt(7, quantity);
				   //pstm1.setInt(4, categoryID);
				   pstm1.setString(4, categoryID);
				   pstm1.setInt(8, viewed);
		       		if (file != null) {
		               // fetches input stream of the upload file for the blob column
		       			pstm1.setBinaryStream(6, file);
		           }
		       		pstm1.executeUpdate();
			}
		} catch (SQLException e) {
	        // process sql exception
	        e.printStackTrace();
		}
	}

	public static void delProByID(Connection conn, String id) {
		// TODO Auto-generated method stub
		try {
			System.out.println("begin - getProByID - ProUtil");
		   String sql = "DELETE FROM Products WHERE productID=?";
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   
			pstm.setInt(1, Integer.parseInt(id));
			pstm.executeUpdate();
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static List<Products> listPro(Connection conn) throws SQLException {
		   String sql = "SELECT * FROM Products";
		   PreparedStatement pstm = conn.prepareStatement(sql);
		   ResultSet rs = pstm.executeQuery();
		   System.out.println("connected to product list!");
		   List<Products> list = new ArrayList<Products >();
		   while (rs.next()) {
			   Products  pd = ProductMapping.maProducts(rs);
		      list.add(pd);
		   }
		   System.out.println("connect prodcut!");
		   return list;
	}
}
