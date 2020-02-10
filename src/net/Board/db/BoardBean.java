package net.Board.db;

import java.sql.Timestamp;

public class BoardBean {
	private int writenum;
	private String id;
	private String nickname;
	private String subject;
	private String content;
	private int readcount;
	private int re_ref;
	private int re_lev;
	private int re_seq;
	private Timestamp reg_date;
	private String ip;
	private String boardType;
	public int getWritenum() {
		return writenum;
	}
	public void setWritenum(int writenum) {
		this.writenum = writenum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	@Override
	public String toString() {
		return "BoardBean [writenum=" + writenum + ", id=" + id + ", nickname=" + nickname + ", subject=" + subject
				+ ", content=" + content + ", readcount=" + readcount + ", re_ref=" + re_ref + ", re_lev=" + re_lev
				+ ", re_seq=" + re_seq + ", reg_date=" + reg_date + ", ip=" + ip + ", boardType=" + boardType + "]";
	}
	
	
	
}
