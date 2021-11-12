package conn;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection()
	        throws ClassNotFoundException, SQLException {
	 // su dung DB nao thi mo ra o day
	 //return OracleConnUtils.getOracleConnection();
	 // return OracleConnutils.getOracleConnection();
	 // return MySQLConnection.getMySQLConnection();
	 return SQLServerConnection.initializeDatabase();
	 // return SQLServerConnUtils SQLJDBC.getSQLServerConnection SQLJDBC();
	 // return PostGresConnutils.getPostGresConnection();
	}

}
