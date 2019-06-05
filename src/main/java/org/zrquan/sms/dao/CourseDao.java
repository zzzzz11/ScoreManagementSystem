package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Course;

public interface CourseDao {
	Course getCourseById(@Param("id") int id);
}
