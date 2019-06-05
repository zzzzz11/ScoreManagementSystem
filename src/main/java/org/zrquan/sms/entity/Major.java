package org.zrquan.sms.entity;

import com.alibaba.fastjson.annotation.JSONField;

public class Major {
	private int id;

	@JSONField(name = "name")
	private String name;

	@JSONField(name = "dept")
	private Department dept;

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

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}
}
