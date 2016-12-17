package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.New;

public class News extends DBConn {
	public int AddNews(String title, String content,int type,String username) {
		int flag = 0;
		int user_id = 0;
		Connection conn = getConn();
		
		String sql = "select * from account where name=\'"+username + "\'";
		
		try {
			java.sql.Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				user_id = rs.getInt("user_id");
			}else{
				return 0;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		sql="insert into news(title,type,content,user_id) values(?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setInt(2, type);
			pstmt.setString(3, content);
			pstmt.setInt(4, user_id);
			flag = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	//分页获取全部新闻
	public List<New> AllNewsPage(int page,int type){
		int startnum = page*10 - 10;
		int endnum = page*10 - 1;
		System.out.println("start:" + startnum + ",endnum:"+endnum);
		List<New> list = new ArrayList<New>();
		Connection conn = getConn();
		String sql = null;
		if(type == -1){
			sql = "select news.news_id,news.title,news.content,account.name,type.name as typename,news.post_time from news join account on news.user_id=account.user_id join type on news.type=type.type_id order by news_id DESC limit "+ startnum +","+ endnum +"";
		}else{
			sql = "select news.news_id,news.title,news.content,account.name,type.name as typename,news.post_time from news join account on news.user_id=account.user_id join type on news.type=type.type_id where news.type="+type+" order by news_id DESC limit "+ startnum +","+ endnum +"";
		}
		try {
			java.sql.Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while( rs.next() )
			{
				New m = new New();
				m.setId(rs.getInt("news_id"));
				m.setTitle(rs.getString("title"));
				m.setContent(rs.getString("content"));
				m.setAuthor(rs.getString("name"));
				m.setType(rs.getString("typename"));
				m.setPosttime(rs.getString("post_time"));
				list.add(m);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	//获取一条新闻
	public New getOneNews(int id){
		
		New m = new New();
		Connection conn = getConn();
		
		String sql = "select * from news join account on news.user_id=account.user_id where news_id = " + id;
		
		try {
			java.sql.Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				m.setId(rs.getInt("news_id"));
				m.setTitle(rs.getString("title"));
				m.setContent(rs.getString("content"));
				m.setAuthor(rs.getString("name"));
				m.setPosttime(rs.getString("post_time"));
			}
			return m;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public int DeleteNews(int newid) {
		// TODO Auto-generated method stub
		int flag = 0;
		Connection conn = getConn();
		String sql = "delete from news where news_id=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, newid);
			flag = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
}
