package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Manager;

public interface ManagerDao {
	Manager getManagerByNumber(@Param("number") String number);

	int create(@Param("manager") Manager manager);
}
