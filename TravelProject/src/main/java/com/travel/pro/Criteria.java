package com.travel.pro;

public class Criteria {
   private int pageNum; //           
   private int amount;  //                      Խù    
   private int skip;
   private String st;
   public Criteria() {
      this(1, 12); //pageNum, amount  ⺻   
      this.skip=0;
   }
   public Criteria(int pageNum, int amount) {
      this.pageNum = pageNum; //    ϴ  pageNum, amount
      this.amount = amount;
      this.skip=(pageNum-1)*amount;
   }
   public int getPageNum() {
      return pageNum;
   }
   public void setPageNum(int pageNum) {
      this.pageNum = pageNum;
      this.skip=(pageNum-1)*amount;
   }
   public int getAmount() {
      return amount;
   }
   public void setAmount(int amount) {
      this.amount = amount;
      this.skip=(pageNum-1)*amount;
   }
   public int getSkip() {
   return skip;
}
public void setSkip(int skip) {
   this.skip = skip;
}
public String getSt() {
   return st;
}
public void setSt(String st) {
   this.st = st;
}
@Override
public String toString() {
   return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", st=" + st + "]";
}


}