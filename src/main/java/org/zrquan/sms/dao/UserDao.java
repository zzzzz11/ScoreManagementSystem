package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.User;

public interface UserDao {

	User getUserByAccountNumber(@Param("accountNumber") String accountNumber);

	void addUser(@Param("user") User user);
}