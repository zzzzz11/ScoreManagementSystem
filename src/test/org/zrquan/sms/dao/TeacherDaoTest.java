package org.zrquan.sms.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zrquan.sms.BaseTest;
import org.zrquan.sms.entity.Teacher;

public class TeacherDaoTest extends BaseTest {
	@Autowired
	TeacherDao teacherDao;
	@Autowired
	DepartmentDao departmentDao;

	@Test
	public void testCreate() {
		Teacher teacher = setTestTeacher();
		int count = teacherDao.create(teacher);
		if (count > 0)
			teacherDao.deleteById(teacher.getId());
	}
}