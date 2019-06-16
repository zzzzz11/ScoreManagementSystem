package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Major;

import java.util.List;

public interface MajorDao {
	Major getMajorById(@Param("id") int id);

	List<Major> retrieveMajor();
}
