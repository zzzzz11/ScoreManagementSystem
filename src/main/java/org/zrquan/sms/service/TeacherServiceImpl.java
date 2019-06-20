package org.zrquan.sms.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zrquan.sms.dao.*;
import org.zrquan.sms.entity.Course;
import org.zrquan.sms.entity.Score;
import org.zrquan.sms.entity.Student;
import org.zrquan.sms.entity.Teacher;
import org.zrquan.sms.service.interfaces.TeacherService;

import java.util.ArrayList;
import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {
	@Autowired
	TeacherDao teacherDao;
	@Autowired
	ScoreDao scoreDao;
	@Autowired
	CourseDao courseDao;
	@Autowired
	TempScoreDao tempScoreDao;
	@Autowired
	StudentDao studentDao;

	@Override
	public Teacher getTeacherInfo(String number) {
		Teacher teacher = teacherDao.getTeacherByNumber(number);

		return teacher;
	}

	@Override
	public String getCourseInfo(String number) {
		List<Course> course = courseDao.getCourseByTeacherNumber(number);
		String result = JSON.toJSONString(course);
		return result;
	}

	@Override
	public boolean submitScore(String scoreJson) {
		JSONArray scores = JSON.parseArray(scoreJson);
		for (int i = 0; i < scores.size(); i++) {
			JSONObject score = scores.getJSONObject(i);
			Score param = new Score();

			String snumber = score.getString("snumber");
			Student stu = studentDao.getStudentByNumber(snumber);

			int cid = score.getIntValue("cid");
			Course course = courseDao.getCourseById(cid);

			int value = score.getIntValue("score");
			double gpa = score.getDoubleValue("gpa");

			param.setStudent(stu);
			param.setCourse(course);
			param.setValue(value);
			param.setGpa(gpa);

			int flag = tempScoreDao.addTempScore(param);
			if (flag <= 0) return false;
		}

		return true;
	}

	@Override
	public boolean updateTeacher(Teacher teacher) {

		return false;
	}

	@Override
	public String getCourseScore(int courseId) {
		List<Score> scores = scoreDao.retrieveScores();
		List<Score> resultScores = new ArrayList<>();

		for (Score score : scores) {
			if (score.getCourse().getId() == courseId) {
				resultScores.add(score);
			}
		}

		if (resultScores.size() == 0)
			return "";
		else
			return JSON.toJSONString(resultScores, SerializerFeature.DisableCircularReferenceDetect);
	}

	@Override
	public String getCourseTempScore(int courseId) {
		List<Score> tScores = tempScoreDao.retrieveScores();
		List<Score> resultScores = new ArrayList<>();

		for (Score score : tScores) {
			if (score.getCourse().getId() == courseId) {
				resultScores.add(score);
			}
		}

		if (resultScores.size() == 0)
			return "";
		else
			return JSON.toJSONString(resultScores, SerializerFeature.DisableCircularReferenceDetect);
	}
}
