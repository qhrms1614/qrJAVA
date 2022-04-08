package com.travel.pro;

public class Reply {
	private int rno;
	private int grp;     // 댓글이 속한 그룹(부모댓글과 자식댓글이 서로 같은 grp를 가짐)
	private int grpl;    // 그룹 내 댓글 깊이
	private String writer;
	private String content;
	private String created;
	private String updated;
	
	public Reply() {
	}
	public Reply(int rno, int grp, int grpl, String writer, String content, String created, String updated) {
		this.rno = rno;
		this.grp = grp;
		this.grpl = grpl;
		this.writer = writer;
		this.content = content;
		this.created = created;
		this.updated = updated;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}	
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	public int getGrpl() {
		return grpl;
	}
	public void setGrpl(int grpl) {
		this.grpl = grpl;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getUpdated() {
		return updated;
	}
	public void setUpdated(String updated) {
		this.updated = updated;
	}
	
}
