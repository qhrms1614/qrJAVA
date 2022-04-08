package com.travel.pro;

import java.util.Arrays;

public class N_Criteria {
	private int pageNum; // 현재페이지
	private int amount;  // 한 페이지 당 보여질 게시물 수
	private int skip;
	private String keyword;
	private String type;
	private String[] typeArr;
	public N_Criteria() {
		this(1, 10); //pageNum, amount 기본 세팅
		this.skip=0;
	}
	public N_Criteria(int pageNum, int amount) {
		this.pageNum = pageNum; // 원하는 pageNum, amount
		this.amount = amount;
		this.skip=(pageNum-1)*amount;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		this.skip=(pageNum-1)*this.amount;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
		this.skip=(this.pageNum-1)*amount;
	}
	public int getSkip() {
		return skip;
	}
	public void setSkip(int skip) {
		this.skip = skip;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
		this.typeArr=type.split("");
	}
	public String[] getTypeArr() {
		return typeArr;
	}
	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}
	@Override
	public String toString() {
		return "N_Criteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", keyword=" + keyword
				+ ", type=" + type + ", typeArr=" + Arrays.toString(typeArr) + "]";
	}
	
	
}
