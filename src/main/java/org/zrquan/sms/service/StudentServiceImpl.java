package org.zrquan.sms.service;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zrquan.sms.dao.CourseDao;
import org.zrquan.sms.dao.ScoreDao;
import org.zrquan.sms.dao.StudentDao;
import org.zrquan.sms.dao.TempScoreDao;
import org.zrquan.sms.entity.Course;
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
	@Autowired
	CourseDao courseDao;
	@Autowired
	TempScoreDao tempScoreDao;

	@Override
	public Student getStudentInfo(String number) {
		Student student = studentDao.getStudentByNumber(number);

		return student;
	}

	@Override
	public String getScoreInfo(String number) {
		List<Score> scores = scoreDao.getScoreByStudentNumber(number);
		for (Score score : scores) {
			// 课程排名
			int sid = score.getStudent().getId();
			Course course = score.getCourse();
			int cid = course.getId();
			score.setCrank(getCourseRank(sid, cid));
			// 课程人数
			int count = scoreDao.getCourseStudentCount(cid) + tempScoreDao.getCourseStudentCount(cid);
			course.setStudentCount(count);
		}

		String result = JSON.toJSONString(scores);
		return result;
	}

	/**
	 * 获取某学生在某课程的排名
	 */
	private int getCourseRank(int sid, int cid) {
		List<Double> total = courseDao.getValueList(cid);
		Double myScore = studentDao.getCourseScore(cid, sid);
		if (total.contains(myScore)) {
			return total.indexOf(myScore) + 1;
		}
		return -1;
	}
}
