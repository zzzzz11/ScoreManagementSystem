package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.User;

import java.util.List;

public interface UserDao {

	User getUserByAccountNumber(@Param("accountNumber") String accountNumber);

	int addUser(@Param("user") User user);

	List<User> retrieveUser();

	List<User> searchByCondition(@Param("condition") String condition, @Param("keyword") String keyword);
}