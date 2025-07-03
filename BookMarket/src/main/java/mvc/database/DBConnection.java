package mvc.database;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;


public class DBConnection {

	
	public static Connection getConnection() throws SQLException,ClassNotFoundException {
		
		Connection conn = null;
		
		String url = "jdbc:mysql://192.168.111.102:3306/bookmarket";
		String user = "bookmarket";
		String password = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,password);
		
		return conn;
	}
}
