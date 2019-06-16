package org.zrquan.sms.entity;

import com.alibaba.fastjson.annotation.JSONField;

public class Score {
	private int id;

	@JSONField(name = "course")
	private Course course;

	@JSONField(name = "student")
	private Student student;

	@JSONField(name = "value")
	private double value;

	@JSONField(name = "gpa")
	private double gpa;

	@JSONField(name = "crank")
	private int crank;

	@JSONField(name = "identity")
	private int identity;  // 重考标识，0为不需要重考

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}

	public int getIdentity() {
		return identity;
	}

	public void setIdentity(int identity) {
		this.identity = identity;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

	public int getCrank() {
		return crank;
	}

	public void setCrank(int crank) {
		this.crank = crank;
	}
}
