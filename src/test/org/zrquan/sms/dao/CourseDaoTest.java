package org.zrquan.sms.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zrquan.sms.BaseTest;
import org.zrquan.sms.entity.Course;

import java.util.List;

public class CourseDaoTest extends BaseTest {
	@Autowired
	CourseDao courseDao;
	@Autowired
	TeacherDao teacherDao;

	@Test
	public void testRetrieveCourse() {
		List<Course> list = courseDao.retrieveCourse();

		System.out.println(list.toString());
	}

	@Test
	public void testCreate() {
		Course course = new Course();
		course.setName("name");
		course.setTeacher(teacherDao.getTeacherById(1));
		course.setCredit(3);
		course.setPeriod(22);
		course.setType("公必");

		courseDao.create(course);
		int id = course.getId();

		if (id >= 0)
			courseDao.deleteById(id);
	}
}
