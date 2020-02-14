package net.Comment.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class commentDAO {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	
	//디비 연결
	private Connection getConnection() throws Exception{
		Context init =new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/LOLSearchDB");
		con=ds.getConnection();
		return con;
	}
	private void closeDB(){
		try{
		if(con!=null) con.close();
		if(pstmt!=null) pstmt.close();
		if(rs!=null) rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertcomment(commentBean cb){
		int check=-1;
		try{
			getConnection();
			sql="select max(comment_num) from comment";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				sql="insert into comment values(?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt(1)+1);
				pstmt.setInt(2, cb.getBoard_num());
				pstmt.setString(3, cb.getUser_id());
				pstmt.setString(4, cb.getUser_nickname());
				pstmt.setString(5, cb.getContent());
				pstmt.setTimestamp(6, cb.getReg_date());
				
				check=pstmt.executeUpdate();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
	public ArrayList<commentBean> selectcomment(int w_num){
		ArrayList<commentBean> cbList=new ArrayList<commentBean>();
		try {
			System.out.println("실행1");
			System.out.println("w_num="+w_num);
			getConnection();
			sql="select * from comment where board_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, w_num);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				System.out.println("실행2");
			commentBean cb= new commentBean();
			cb.setComment_num(rs.getInt(1));
			cb.setBoard_num(rs.getInt(2));
			cb.setUser_id(rs.getString(3));
			cb.setUser_nickname(rs.getString(4));
			cb.setContent(rs.getString(5));
			cb.setReg_date(rs.getTimestamp(6));
			cbList.add(cb);
			System.out.println(cb.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return cbList;
	}
	public int commentcount(int w_num){
		int count=0;
		try {
			getConnection();
			sql="select count(*) from comment where board_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,w_num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return count;
	}
	public void deletecomment(int w_num){
		
		try{
			getConnection();
			sql="delete from comment where board_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, w_num);
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
	}
}
