package org.zrquan.sms.service;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zrquan.sms.dao.CourseDao;
import org.zrquan.sms.dao.UserDao;
import org.zrquan.sms.entity.Course;
import org.zrquan.sms.entity.User;
import org.zrquan.sms.service.interfaces.ManagerService;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	CourseDao courseDao;
	@Autowired
	UserDao userDao;

	@Override
	public String getCourseInfo() {
		List<Course> courses = courseDao.retrieveCourse();

		String result = JSON.toJSONString(courses);

		return result;
	}

	@Override
	public String getUserInfo() {
		List<User> users = userDao.retrieveUser();
		String result = JSON.toJSONString(users);

		return result;
	}

	@Override
	public String auditScore() {
		return null;
	}
}
