package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Major;

public interface MajorDao {
	Major getMajorById(@Param("id") int id);
}
