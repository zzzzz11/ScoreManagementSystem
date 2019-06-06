package org.zrquan.sms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zrquan.sms.dao.TeacherDao;
import org.zrquan.sms.entity.Teacher;
import org.zrquan.sms.service.interfaces.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService {
	@Autowired
	TeacherDao teacherDao;

	@Override
	public Teacher getTeacherInfo(String number) {

		return teacherDao.getTeacherByNumber(number);
	}

	@Override
	public String getCourseInfo(String number) {
		return null;
	}
}
