package net.User.db;

import java.sql.Timestamp;

public class UserBean {
	String id;
	String pass;
	String name;
	String nickname;
	String birth;
	String gender;
	String email;
	Timestamp reg_date;
	String profileicon;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
	public String getProfileicon() {
		return profileicon;
	}
	public void setProfileicon(String profileicon) {
		this.profileicon = profileicon;
	}
	
	@Override
	public String toString() {
		return "UserBean [id=" + id + ", pass=" + pass + ", name=" + name + ", nickname=" + nickname + ", birth="
				+ birth + ", gender=" + gender + ", email=" + email + ", reg_date=" + reg_date + ", profileicon="
				+ profileicon + "]";
	}
	
	
	
	
	
}
