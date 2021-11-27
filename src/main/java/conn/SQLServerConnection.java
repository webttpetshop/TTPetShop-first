package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class SQLServerConnection {
	public static Connection initializeDatabase()
	        throws SQLException, ClassNotFoundException {

			ResourceBundle tst = ResourceBundle.getBundle("messages");
			String dbDriver =tst.getString("dbDriver") ;
	        String dbURL = "jdbc:sqlserver://localhost:1433";
	        //Database name to access
	        String dbName = "TTPetShop";
	        String dbusername ="sa";
	        String dbPassword ="sa";
	        String connectionURL = dbURL + ";databasename=" + dbName;//?
	        Connection conn= null;
	        try {
	             Class.forName (dbDriver);
	            conn = DriverManager.getConnection(connectionURL, dbusername, dbPassword);
	            System.out.println("connect successfully!");
	         } catch (Exception ex) {
	            System.out.println("connect failure!");
	            ex.printStackTrace();
	         }
	        
	                                         
	        return conn;
	}
	//test connection
//	public static void main(String[] args) {
//	try {
//		System.out.println(new SQLServerConnection().initializeDatabase());
//	} catch (Exception e) {
//		
//	}
//}

}
