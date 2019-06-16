package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Department;

import java.util.List;

public interface DepartmentDao {
	Department getDeptById(@Param("id") int id);

	List<Department> retrieveDept();
}
