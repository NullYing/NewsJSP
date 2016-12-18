package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Type extends DBConn {
	public List<String> getTypeList() {
		Connection conn = getConn();
		String sql = "select * from type";
		List<String> typeList = new ArrayList<String>();
		try {
			java.sql.Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				typeList.add(rs.getString(2));
			}
			rs.close();
			return typeList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
