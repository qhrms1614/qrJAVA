package com.travel.pro;

public class city {
   int id;
   String kloc;
   String name;
   public city() {
   }
   public city(int id, String name, String kloc) {
      this.id = id;
      this.name = name;
      this.kloc = kloc;
   }
   public int getId() {
      return id;
   }
   public void setId(int id) {
      this.id = id;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   
   public String getKloc() {
	      return kloc;
	   }
	   public void setKloc(String kloc) {
	      this.kloc = kloc;
	   }
   
}