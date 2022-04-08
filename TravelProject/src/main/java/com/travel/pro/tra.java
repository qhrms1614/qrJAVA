package com.travel.pro;

public class tra {
String cod;
String adr;
int id;
String name;
String loc;
public tra() {
}
public tra(String cod, String adr, int id, String name, String loc) {
   this.cod = cod;
   this.adr = adr;
   this.id = id;
   this.name = name;
   this.loc=loc;
}
public String getCod() {
   return cod;
}
public void setCod(String cod) {
   this.cod = cod;
}
public String getAdr() {
   return adr;
}
public void setAdr(String adr) {
   this.adr = adr;
}
public int getId() {
   return id;
}
public String getLoc() {
   return loc;
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
public void setLoc(String loc) {
   this.loc = loc;
}

}