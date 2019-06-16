package org.zrquan.sms.service;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zrquan.sms.BaseTest;

public class CommonServiceImplTest extends BaseTest {
	@Autowired
	CommonServiceImpl commonService;

	@Test
	public void testRetrieveDept() {
	}

	@Test
	public void testRetrieveMajor() {
	}

	@Test
	public void testGetCourseStudentCount() {
		int count = commonService.getCourseStudentCount(1);
		Assert.assertEquals(1, count);
	}
}