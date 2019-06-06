package org.zrquan.sms.service;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zrquan.sms.dao.ScoreDao;
import org.zrquan.sms.dao.StudentDao;
import org.zrquan.sms.entity.Score;
import org.zrquan.sms.entity.Student;
import org.zrquan.sms.service.interfaces.StudentService;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	StudentDao studentDao;
	@Autowired
	ScoreDao scoreDao;

	@Override
	public Student getStudentInfo(String number) {
		Student student = studentDao.getStudentByNumber(number);

		return student;
	}

	@Override
	public String getScoreInfo(String number) {
		List<Score> score = scoreDao.getScoreByStudentNumber(number);

		String result = JSON.toJSONString(score);

		return result;
	}

	@Override
	public void addStudent(Student student) {

	}

	@Override
	public void updateStudent(Student student) {

	}

	@Override
	public void deleteStudentByNumber(String number) {

	}
}
