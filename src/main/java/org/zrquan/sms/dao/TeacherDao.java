package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Teacher;

import java.util.List;

public interface TeacherDao {
	Teacher getTeacherByNumber(@Param("number") String number);

	Teacher getTeacherById(@Param("id") int id);

	Teacher getTeacherByName(@Param("teacherName") String teacherName);

	int create(@Param("teacher") Teacher teacher);

	int deleteById(@Param("id") int id);

	List<Teacher> retrieveTeacher();

	List<Teacher> searchByName(@Param("name") String name);
}
