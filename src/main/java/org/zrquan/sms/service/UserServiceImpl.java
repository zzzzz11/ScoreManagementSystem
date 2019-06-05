package org.zrquan.sms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zrquan.sms.dao.UserDao;
import org.zrquan.sms.entity.User;
import org.zrquan.sms.service.interfaces.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public boolean verify(String accountNumber, String password) {
		User loginUser = getUer(accountNumber);

		if (loginUser != null)
			return password.equals(loginUser.getPassword());
		else
			return false;
	}

	@Override
	public User getUer(String accountNumber) {
		return userDao.getUserByAccountNumber(accountNumber);
	}
}
