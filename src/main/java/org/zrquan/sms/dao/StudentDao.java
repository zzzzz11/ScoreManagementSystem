package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Student;

import java.util.List;

public interface StudentDao {
	Student getStudentByNumber(@Param("number") String number);

	Student getStudentById(@Param("id") int id);

	int create(@Param("student") Student student);

	List<Student> retrieveStudent();
}
