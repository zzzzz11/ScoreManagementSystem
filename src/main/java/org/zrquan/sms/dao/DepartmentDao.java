package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Department;

public interface DepartmentDao {
	Department getDeptById(@Param("id") int id);
}
