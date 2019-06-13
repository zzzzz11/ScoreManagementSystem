package org.zrquan.sms.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zrquan.sms.BaseTest;

public class ManagerServiceImplTest extends BaseTest {
	@Autowired
	ManagerServiceImpl managerService;

	@Test
	public void testGetCourseInfo() {
		String json = managerService.getCourseInfo();

		System.out.println(json);
	}
}