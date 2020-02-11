package net.Comment.db;

import java.sql.Timestamp;

public class commentBean {

	private int comment_num;
	private int board_num;
	private String user_id;
	private String user_nickname;
	private String content;
	private Timestamp reg_date;
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "commentBean [comment_num=" + comment_num + ", board_num=" + board_num + ", user_id=" + user_id
				+ ", user_nickname=" + user_nickname + ", content=" + content + ", reg_date=" + reg_date + "]";
	}
	
	
}
