package net.Board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
				pstmt.setInt(7, rs.getInt(1)+1);
				pstmt.setInt(8, 0);
				pstmt.setInt(9, 0);
				pstmt.setTimestamp(10, bb.getReg_date());
				pstmt.setString(11, "127.0.0.1");
				pstmt.setString(12, bb.getBoardType());
				
				pstmt.executeUpdate();
				check=(rs.getInt(1)+1);
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
	
	public int reInsertBoard(BoardBean bb){
		int check=-1;
		int num=-1;
		try{
			getConnection();
			sql="select max(writenum) from board ";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1)+1;
			}
			sql="update board set re_seq=re_seq+1 where re_ref=? and re_seq>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			
			pstmt.executeUpdate();
			
			
				sql="insert into board values(?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1,num);
				pstmt.setString(2, bb.getId());
				pstmt.setString(3, bb.getNickname());
				pstmt.setString(4, bb.getSubject());
				pstmt.setString(5, bb.getContent());
				pstmt.setInt(6, 0);
				pstmt.setInt(7, bb.getRe_ref());
				pstmt.setInt(8, bb.getRe_lev()+1);
				pstmt.setInt(9, bb.getRe_seq()+1);
				pstmt.setTimestamp(10, bb.getReg_date());
				pstmt.setString(11, "127.0.0.1");
				pstmt.setString(12, bb.getBoardType());
				
				check=pstmt.executeUpdate();
				if(check==1){
				check=num;
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
	
	public ArrayList<BoardBean> selectBoardList(String type,int startPage,int PageSize){
		ArrayList<BoardBean> bbList=new ArrayList<BoardBean>();
		try{
			getConnection();
			sql="select * from board where boardtype=? order by  re_ref desc, re_seq asc limit ?,?";
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
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return bbList;
		
	}
	public ArrayList<BoardBean> AllselectBoardList(int startPage,int PageSize){
		ArrayList<BoardBean> bbList=new ArrayList<BoardBean>();
		try{
			System.out.println("실행1");
			getConnection();
			sql="select * from board order by  re_ref desc, re_seq asc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startPage-1);
			pstmt.setInt(2, PageSize);
			
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
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return bbList;
	}
	public ArrayList<BoardBean> MainselectBoardList(int startPage,int PageSize){
		ArrayList<BoardBean> bbList=new ArrayList<BoardBean>();
		try{
			System.out.println("실행1");
			getConnection();
			sql="select * from board where re_seq=0 order by  re_ref desc, re_seq asc limit ?,? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startPage-1);
			pstmt.setInt(2, PageSize);
			
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
	public BoardBean selectBoard(int w_num){
		BoardBean bb= new BoardBean();
		try {
			getConnection();
			sql="select * from board where writenum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, w_num);
			rs=pstmt.executeQuery();
			if(rs.next()){
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return bb;
	}
	public void addreadCount(int w_num){
		try{
			getConnection();
			sql="select readcount from board where writenum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, w_num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				sql="update board set readcount=? where writenum=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt(1)+1);
				pstmt.setInt(2, w_num);
				
				pstmt.executeUpdate();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	public int deleteBoard(int w_num){
		int check=-1;
		try{
			getConnection();
			sql="delete from board where writenum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, w_num);
			
			check=pstmt.executeUpdate();
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
	
	
}
