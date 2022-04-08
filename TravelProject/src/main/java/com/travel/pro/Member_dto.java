package com.travel.pro;

public class Member_dto {
		private String userid;
		private String password;
		private String phone;
		private String username;
		private String birthday;
		private String user_type;		
		
		public Member_dto() {
			super();
		}
		public Member_dto(String userid, String password,String birthday, String phone, String user_type, String username) {
			super();
			this.userid = userid;
			this.password = password;
			this.username = username;
			this.phone = phone;
			this.birthday= birthday;
			this.user_type = user_type;
		}
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
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getUser_type() {
			return user_type;
		}
		public void setUser_type(String user_type) {
			this.user_type = user_type;
		}
		public String getBirthday() {
			return birthday;
		}
		public void setBirthday(String birthday) {
			this.birthday = birthday;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}

	}