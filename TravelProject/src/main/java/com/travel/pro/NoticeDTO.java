package com.travel.pro;

public class NoticeDTO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String created;
	private String updated;
	
	public NoticeDTO() {
	}	
	public NoticeDTO(int bno, String title, String content, String writer, String created, String updated) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.created = created;
		this.updated = updated;
	}

	
	public String getUpdated() {
		return updated;
	}
	public void setUpdated(String updated) {
		this.updated = updated;
	}
	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}
	
}
