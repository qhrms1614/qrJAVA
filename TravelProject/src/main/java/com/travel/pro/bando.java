package com.travel.pro;

public class bando {
	String loc;
	int id;
	String name;
	String cod;
	String adr;
	String kloc;
	int hit;
	
	public bando() {
		super();
	}
	public bando(String loc, int id, String name, String cod, String adr, String kloc, int hit) {
		super();
		this.loc = loc;
		this.id = id;
		this.name = name;
		this.cod = cod;
		this.adr = adr;
		this.kloc = kloc;
		this.hit = hit;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
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
	public String getKloc() {
		return kloc;
	}
	public void setKloc(String kloc) {
		this.kloc = kloc;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
}