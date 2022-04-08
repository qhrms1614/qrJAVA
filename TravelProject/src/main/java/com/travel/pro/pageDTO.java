package com.travel.pro;

public class pageDTO {
   private int startPage;       // 시작페이지
   private int endPage;         // 끝페이지
   private boolean prev,next;   // 이전페이지, 다음페이지 존재 유무
   private int total;           // 전체 게시물 수
   private Criteria cri;        // 현재페이지, 페이지 당 게시물 표시수 정보
   private N_Criteria ncri;
   
   public pageDTO() {
   }
   public pageDTO(int total,N_Criteria ncri) {
      this.total = total;
      this.ncri=ncri;
      
      this.endPage=(int)(Math.ceil(ncri.getPageNum()/10.0))*10;
      this.startPage=this.endPage-9;
      
      int realEnd=(int)(Math.ceil(total*1.0/ncri.getAmount()));
      
      if(realEnd<this.endPage) {
         this.endPage=realEnd;
      }
      
      this.prev=this.startPage>1;
      this.next=this.endPage<realEnd;
   }
   public pageDTO(int total, Criteria cri) {
      this.total = total;
      this.cri = cri;
      
      this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10;
      this.startPage=this.endPage-9;
      
      int realEnd=(int)(Math.ceil(total*1.0/cri.getAmount()));
      
      if(realEnd<this.endPage) {
         this.endPage=realEnd;
      }
      
      this.prev=this.startPage>1;
      this.next=this.endPage<realEnd;
   }
   public int getStartPage() {
      return startPage;
   }
   public void setStartPage(int startPage) {
      this.startPage = startPage;
   }
   public int getEndPage() {
      return endPage;
   }
   public void setEndPage(int endPage) {
      this.endPage = endPage;
   }
   public boolean isPrev() {
      return prev;
   }
   public void setPrev(boolean prev) {
      this.prev = prev;
   }
   public boolean isNext() {
      return next;
   }
   public void setNext(boolean next) {
      this.next = next;
   }
   public int getTotal() {
      return total;
   }
   public void setTotal(int total) {
      this.total = total;
   }
   public Criteria getCri() {
      return cri;
   }
   public void setCri(Criteria cri) {
      this.cri = cri;
   }
   
   public N_Criteria getNcri() {
      return ncri;
   }
   public void setNcri(N_Criteria ncri) {
      this.ncri = ncri;
   }
   @Override
   public String toString() {
      return "pageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
            + ", total=" + total + ", cri=" + cri + ", ncri=" + ncri + "]";
   }
   
}