package org.zrquan.sms;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zrquan.sms.dao.DepartmentDao;
import org.zrquan.sms.entity.Teacher;

//整合spring和junit
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml"})
public class BaseTest {
	@Autowired
	DepartmentDao departmentDao;

	public Teacher setTestTeacher() {
		Teacher teacher = new Teacher();
		teacher.setName("测试");
		teacher.setNumber("1234");
		teacher.setDept(departmentDao.getDeptById(1));
		teacher.setTitle("教授");

		return teacher;
	}
}
