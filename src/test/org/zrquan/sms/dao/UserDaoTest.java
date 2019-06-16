package org.zrquan.sms.dao;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zrquan.sms.BaseTest;
import org.zrquan.sms.entity.User;

import java.util.List;

public class UserDaoTest extends BaseTest {
	@Autowired
	UserDao userDao;

	@Test
	public void testSearchByCondition() {
		List<User> users = userDao.searchByCondition("type", "teacher");
		Assert.assertFalse(users.isEmpty());
	}
}