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
			System.out.println("�������ݿ�����ʱ�׳��쳣���������£�");
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
