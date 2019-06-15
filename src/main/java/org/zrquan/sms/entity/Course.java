package org.zrquan.sms.entity;

public class Course {
	private int id;
	private String name;
	private int credit;
	private String type;
	private int period;
	private double average;
	private String normalDistribution;
	private Teacher teacher;
	private String test_form;
	private String term;
	private String year;

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

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public double getAverage() {
		return average;
	}

	public void setAverage(double average) {
		this.average = average;
	}

	public String getNormalDistribution() {
		return normalDistribution;
	}

	public void setNormalDistribution(String normalDistribution) {
		this.normalDistribution = normalDistribution;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public String getTest_form() {
		return test_form;
	}

	public void setTest_form(String test_form) {
		this.test_form = test_form;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
}
