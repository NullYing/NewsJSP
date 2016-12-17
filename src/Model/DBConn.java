package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException; 

public class DBConn {
	
	public Connection getConn(){
		
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("加载数据库驱动时抛出异常，内容如下：");
			e.printStackTrace();
		}
		
		String url = "jdbc:mysql://127.0.0.1:3306/news?useUnicode=true&characterEncoding=utf-8&useSSL=true";
		String user = "news";
		String password = "q9lQib5wofeYC61l";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
		
	}

}
