package org.zrquan.sms.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zrquan.sms.BaseTest;

import static org.junit.Assert.assertTrue;

public class UserServiceImplTest extends BaseTest {
	@Autowired
	UserServiceImpl userService;

	@Test
	public void testVerify() {
		boolean flag = false;
		flag = userService.verify("16369003", "1234");
		assertTrue(flag);
	}
}