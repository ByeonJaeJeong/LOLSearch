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
	public int insertUser(UserBean ub){
		int check=-2;
		try {
			getConnection();
			System.out.println("ub값:"+ub.toString());
			sql="insert into user values(?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ub.getId());
			pstmt.setString(2, ub.getPass());
			pstmt.setString(3, ub.getName());
			pstmt.setString(4, ub.getNickname());
			pstmt.setString(5, ub.getBirth());
			pstmt.setString(6, ub.getGender());
			pstmt.setString(7, ub.getEmail());
			pstmt.setTimestamp(8, ub.getReg_date());
			pstmt.setString(9, ub.getProfileicon());
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
	public int LoginUser(String user_id,String user_pass){
		int check=-1;
		try {
			getConnection();
			sql="select pass from user where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				check=0;
				if(user_pass.equals(rs.getString(1)))
					check=1;
			}else{
				check=-1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}//Login
	public UserBean UserInfo(String user_id){
		UserBean ub= new UserBean();
		try{
			getConnection();
			sql="select * from user where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,user_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				ub.setId(rs.getString(1));
				ub.setPass(rs.getString(2));
				ub.setName(rs.getString(3));
				ub.setNickname(rs.getString(4));
				ub.setBirth(rs.getString(5));
				ub.setGender(rs.getString(6));
				ub.setEmail(rs.getString(7));
				ub.setReg_date(rs.getTimestamp(8));
				ub.setProfileicon(rs.getString(9));
				System.out.println(ub.toString());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return ub;
	}//UserInfo
	public int deleteUser(String id,String pass){
		int check=0;
		try {
			getConnection(); //DB연결
			sql="select pass from user where id=?"; //sql문
			pstmt=con.prepareStatement(sql);//pstmt객체에 con을 연결 
			pstmt.setString(1, id);//pstmt객체에 id값저장
			rs=pstmt.executeQuery();//rs에 처리후 데이터 저장
			if(rs.next()){
				if(pass.equals(rs.getString(1))){
					sql="delete from user where id=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					check=pstmt.executeUpdate();
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}//delete User
	public int updateprofile(String id,String profile){
		int check=-1;
		try{
			getConnection();
			sql="update user set profileicon=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, profile);
			pstmt.setString(2, id);
			
			check=pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
	public int updatenickname(String id, String nickname){
		int check=-1;
		try{
			getConnection();
			sql="update user set nickname=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
}
