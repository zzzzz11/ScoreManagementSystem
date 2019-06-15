package org.zrquan.sms.service;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zrquan.sms.BaseTest;
import org.zrquan.sms.entity.Teacher;

public class ManagerServiceImplTest extends BaseTest {
	@Autowired
	ManagerServiceImpl managerService;

	@Test
	public void testGetCourseInfo() {
		String json = managerService.getCourseInfo();

		System.out.println(json);
	}

	@Test
	public void testAddTeacher() {
		Teacher teacher = setTestTeacher();
		boolean flag = managerService.addTeacher(teacher, 1);
		Assert.assertTrue(flag);
	}
}