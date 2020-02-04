package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	
	//디비 연결
	private Connection getConnection() throws Exception{
		Context init =new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/model2DB");
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
	
}
