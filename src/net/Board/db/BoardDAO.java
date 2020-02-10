package net.Board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
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
	
	public int insertBoard(BoardBean bb){
		int check=-1;
		try{
			getConnection();
			sql="select max(writenum) from board ";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				sql="insert into board values(?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt(1)+1);
				pstmt.setString(2, bb.getId());
				pstmt.setString(3, bb.getNickname());
				pstmt.setString(4, bb.getSubject());
				pstmt.setString(5, bb.getContent());
				pstmt.setInt(6, 0);
				pstmt.setInt(7, 0);
				pstmt.setInt(8, 0);
				pstmt.setInt(9, 0);
				pstmt.setTimestamp(10, bb.getReg_date());
				pstmt.setString(11, "127.0.0.1");
				pstmt.setString(12, bb.getBoardType());
				
				check=pstmt.executeUpdate();
			}else{
				check=-2;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return check;
	}
	
	public ArrayList<BoardBean> selectBoard(String type,int startPage,int PageSize){
		ArrayList<BoardBean> bbList=new ArrayList<BoardBean>();
		try{
			getConnection();
			sql="select * from board where boardtype=? order by re_ref desc, re_seq asc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setInt(2, startPage-1);
			pstmt.setInt(3, PageSize);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				BoardBean bb=new BoardBean();
				bb.setWritenum(rs.getInt(1));
				bb.setId(rs.getString(2));
				bb.setNickname(rs.getString(3));
				bb.setSubject(rs.getString(4));
				bb.setContent(rs.getString(5));
				bb.setReadcount(rs.getInt(6));
				bb.setRe_ref(rs.getInt(7));
				bb.setRe_lev(rs.getInt(8));
				bb.setRe_seq(rs.getInt(9));
				bb.setReg_date(rs.getTimestamp(10));
				bb.setIp(rs.getString(11));
				bb.setBoardType(rs.getString(12));
				bbList.add(bb);
				System.out.println(bb.toString());
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return bbList;
		
	}
	public int countBoard(String type){
		int check=0;
		try{
			getConnection();
			if(type.equals("*")){
				sql="select count(*) from board";
				pstmt=con.prepareStatement(sql);
			}else{
				sql="select count(*) from board where boardtype=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, type);
			}
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				check=rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
}
