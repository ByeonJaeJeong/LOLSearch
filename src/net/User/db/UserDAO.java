package net.User.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {

	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	
	//디비 연결
	private Connection getConnection() throws Exception{
		Context init =new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/LOLSearchDB");
		con=ds.getConnection();
		System.out.println("DB연결 성공");
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
		System.out.println("자원정리 완료");
	}
	public int insertMember(UserBean ub){
		int check=-2;
		try {
			getConnection();
			System.out.println("ub값:"+ub.toString());
			sql="insert into user values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ub.getId());
			pstmt.setString(2, ub.getPass());
			pstmt.setString(3, ub.getName());
			pstmt.setString(4, ub.getBirth());
			pstmt.setString(5, ub.getGender());
			pstmt.setString(6, ub.getEmail());
			pstmt.setTimestamp(7, ub.getReg_date());
			check=pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
	
	public int idcheck(String user_id){
		int check=-1;
		try {
			getConnection();
			sql="select * from user where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,user_id);
			
			rs=pstmt.executeQuery();
			System.out.println("실행성공");
			if(rs.next()){
				check=0;
			}else{
				check=1;
				if(user_id.equals(""))
					check=2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}//id check
	
	
	
}
