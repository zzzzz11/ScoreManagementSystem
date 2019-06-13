package org.zrquan.sms.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zrquan.sms.BaseTest;
import org.zrquan.sms.entity.Course;

import java.util.List;

public class CourseDaoTest extends BaseTest {
	@Autowired
	CourseDao courseDao;

	@Test
	public void testRetrieveCourse() {
		List<Course> list = courseDao.retrieveCourse();

		System.out.println(list.toString());
	}
}
