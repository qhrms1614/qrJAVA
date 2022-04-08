package com.travel.pro;

public class member {
	
	String userid;
	String password;
	String username;
	String birthday;
	String phone;
	
	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getBirthday() {
		return birthday;
	}


	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	public member() {
		super();
	}

	public member(String userid, String password, String username, String birthday, String phone) {
		super();
		this.userid = userid;
		this.password = password;
		this.username = username;
		this.birthday = birthday;
		this.phone = phone;
	}
	
	
}
