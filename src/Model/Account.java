package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Account extends DBConn {
	
	public int AddUser(String name, String password, String phone, int sex, String address) {
		int flag = 0;
		Connection conn = getConn();
		
		String sql="insert into account(name,password,phone,sex,address) values(?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, phone);
			pstmt.setInt(4, sex);
			pstmt.setString(5, address);
			flag = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public int checkUserExist(String name){
		Connection conn = getConn();
		String sql = "select * from account where name=\'"+name + "\'";
		
		try {
			java.sql.Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				return 1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	public int checkPassword(String name,String password){
		Connection conn = getConn();
		String sql = "select * from account where name="+name;
		
		try {
			java.sql.Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			if(rs.next()){
				String r_password = rs.getString("password");
				if(r_password.equals(password)){
					return 1;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
