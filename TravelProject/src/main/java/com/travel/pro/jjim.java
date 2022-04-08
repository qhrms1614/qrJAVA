package com.travel.pro;

public class jjim {
		String userid;
		int id;
		String loc;
		public jjim(String userid, int id, String loc) {
			super();
			this.userid = userid;
			this.id = id;
			this.loc = loc;
		}
		public jjim() {
			super();
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getLoc() {
			return loc;
		}
		public void setLoc(String loc) {
			this.loc = loc;
		}
		
}
