package org.zrquan.sms.entity;

import com.alibaba.fastjson.annotation.JSONField;

public class Student {
	private int id;

	@JSONField(name = "number")
	private String number;

	@JSONField(name = "name")
	private String name;

	@JSONField(name = "major")
	private Major major;

	@JSONField(name = "clazz")
	private String clazz;

	@JSONField(name = "gpa")
	private double gpa;

	@JSONField(name = "credit")
	private int credit;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Major getMajor() {
		return major;
	}

	public void setMajor(Major major) {
		this.major = major;
	}

	public String getClazz() {
		return clazz;
	}

	public void setClazz(String clazz) {
		this.clazz = clazz;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}
}
