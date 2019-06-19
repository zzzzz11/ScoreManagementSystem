package org.zrquan.sms.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.zrquan.sms.dao.*;
import org.zrquan.sms.entity.*;
import org.zrquan.sms.service.interfaces.ManagerService;

import java.util.ArrayList;
import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	CourseDao courseDao;
	@Autowired
	UserDao userDao;
	@Autowired
	TeacherDao teacherDao;
	@Autowired
	StudentDao studentDao;
	@Autowired
	ManagerDao managerDao;
	@Autowired
	DepartmentDao departmentDao;
	@Autowired
	MajorDao majorDao;
	@Autowired
	ScoreDao scoreDao;
	@Autowired
	TempScoreDao tempScoreDao;
	@Autowired
	FeedbackDao feedbackDao;

	@Override
	public String getCourseInfo() {
		List<Course> courses = courseDao.retrieveCourse();
		String result = JSON.toJSONString(courses, SerializerFeature.DisableCircularReferenceDetect);
		return result;
	}

	@Override
	public String getTeacherInfo() {
		List<Teacher> teachers = teacherDao.retrieveTeacher();
		String result = JSON.toJSONString(teachers, SerializerFeature.DisableCircularReferenceDetect);
		return result;
	}

	@Override
	public String getStudentInfo() {
		List<Student> students = studentDao.retrieveStudent();

		for (Student stu : students) {
			List<Score> scores = scoreDao.getScoreByStudentNumber(stu.getNumber());
			int totalCredit = getTotalCredit(scores);
			double averageGpa = getAverageGpa(scores);

			stu.setCredit(totalCredit);
			stu.setGpa(averageGpa);
		}

		String result = JSON.toJSONString(students, SerializerFeature.DisableCircularReferenceDetect);
		return result;
	}

	private int getTotalCredit(List<Score> scores) {
		if (scores.size() == 0) return 0;

		int sum = 0;
		for (Score score : scores) {
			sum += score.getCourse().getCredit();
		}

		return sum;
	}

	private double getAverageGpa(List<Score> scores) {
		if (scores.size() == 0) return 0;

		double sum = 0;
		for (Score score : scores) {
			sum += score.getGpa();
		}

		return sum / scores.size();
	}

	private double getAverageValue(List<Score> scores) {
		if (scores.size() == 0) return 0;

		int sum = 0;
		for (Score score : scores) {
			sum += score.getValue();
		}

		return sum / scores.size();
	}

	@Override
	public String getUserInfo() {
		List<User> users = userDao.retrieveUser();
		String result = JSON.toJSONString(users,
			SerializerFeature.DisableCircularReferenceDetect,
			SerializerFeature.WriteDateUseDateFormat);
		return result;
	}

	@Override
	public String searchCourse(String condition, String keyword) {
		List<Course> courses = courseDao.searchByCondition(condition, keyword);
		String result = JSON.toJSONString(courses, SerializerFeature.DisableCircularReferenceDetect);
		return result;
	}

	@Override
	public String searchUser(String condition, String keyword) {
		List<User> users = userDao.searchByCondition(condition, keyword);
		String result = JSON.toJSONString(users, SerializerFeature.DisableCircularReferenceDetect);
		return result;
	}

	@Override
	public boolean addCourse(Course course, String teacherName) {
		Teacher teacher = teacherDao.getTeacherByName(teacherName);
		if (teacher != null) {
			course.setTeacher(teacher);
			int count = courseDao.create(course);

			return count > 0;
		}
		return false;
	}

	@Override
	public Manager getPersonalInfo(String accountNumber) {
		Manager manager = managerDao.getManagerByNumber(accountNumber);
		return manager;
	}

	@Override
	public boolean addTeacher(Teacher teacher, int deptId, String email, String phone)
		throws DuplicateKeyException {
		Teacher existTeacher = teacherDao.getTeacherByNumber(teacher.getNumber());
		Department existDept = departmentDao.getDeptById(deptId);
		if (existTeacher == null && existDept != null) {
			teacher.setDept(existDept);
			int count = teacherDao.create(teacher);

			if (count > 0) {
				Teacher newTeacher = teacherDao.getTeacherById(teacher.getId());
				User newUser = new User();
				String account = newTeacher.getNumber();

				newUser.setAccountNumber(account);
				newUser.setUserName(newTeacher.getName());
				newUser.setUserType("teacher");
				String password = account.substring(account.length() - 4);
				newUser.setPassword(password);

				newUser.setEmail(email);
				newUser.setPhone(phone);

				return userDao.addUser(newUser) > 0;
			}
		}
		return false;
	}

	@Override
	public boolean addStudent(Student student, int majorId, String email, String phone)
		throws DuplicateKeyException {
		Student existStudent = studentDao.getStudentByNumber(student.getNumber());
		Major existMajor = majorDao.getMajorById(majorId);
		if (existStudent == null && existMajor != null) {
			student.setMajor(existMajor);
			int count = studentDao.create(student);

			if (count > 0) {
				Student newStudent = studentDao.getStudentById(student.getId());
				User newUser = new User();
				String account = newStudent.getNumber();

				newUser.setAccountNumber(account);
				newUser.setUserName(newStudent.getName());
				newUser.setUserType("student");
				String password = account.substring(account.length() - 4);
				newUser.setPassword(password);

				newUser.setEmail(email);
				newUser.setPhone(phone);

				return userDao.addUser(newUser) > 0;
			}
		}
		return false;
	}

	@Override
	public boolean addManager(Manager manager, int deptId, String email, String phone)
		throws DuplicateKeyException {
		Manager existManager = managerDao.getManagerByNumber(manager.getNumber());
		Department existDept = departmentDao.getDeptById(deptId);
		if (existManager == null && existDept != null) {
			manager.setDepartment(existDept);
			int count = managerDao.create(manager);

			if (count > 0) {
				Manager newManager = managerDao.getManagerByNumber(manager.getNumber());
				User newUser = new User();
				String account = newManager.getNumber();

				newUser.setAccountNumber(account);
				newUser.setUserName(newManager.getName());
				newUser.setUserType("manager");
				String password = account.substring(account.length() - 4);
				newUser.setPassword(password);

				newUser.setEmail(email);
				newUser.setPhone(phone);

				return userDao.addUser(newUser) > 0;
			}
		}
		return false;
	}

	@Override
	public String getAuditCourse() {
		List<Score> tScores = tempScoreDao.retrieveScores();
		List<Course> tCourses = new ArrayList<>();

		for (Score score : tScores) {
			Course course = score.getCourse();

			if (!tCourses.contains(course))
				tCourses.add(course);
		}

		String result = JSON.toJSONString(tCourses, SerializerFeature.DisableCircularReferenceDetect);

		return result;
	}

	@Override
	public String getAuditStudent(int courseId) {
		List<Score> tScores = tempScoreDao.retrieveScores();
		List<Score> resultScores = new ArrayList<>();

		for (Score score : tScores) {
			if (score.getCourse().getId() == courseId) {
				resultScores.add(score);
			}
		}

		String result = JSON.toJSONString(resultScores, SerializerFeature.DisableCircularReferenceDetect);
		return result;
	}

	@Override
	public boolean submitScore(String scoreJson) {
		JSONArray scores = JSON.parseArray(scoreJson);
		int cid = scores.getJSONObject(0).getIntValue("cid");

		// 删除score_check中的记录
		if (cid >= 0) {
			int count = tempScoreDao.deleteByCourseId(cid);
			if (count <= 0) return false;
		}

		for (int i = 0; i < scores.size(); i++) {
			JSONObject score = scores.getJSONObject(i);
			Score param = new Score();

			String snumber = score.getString("snumber");
			Student stu = studentDao.getStudentByNumber(snumber);

			Course course = courseDao.getCourseById(cid);

			int value = score.getIntValue("score");
			double gpa = score.getDoubleValue("gpa");

			int identity = 0;
			if (value >= 0 && value < 60) {
				identity = 1;
			} else if (value < 0 || value > 100) {
				identity = -1;
			}

			param.setStudent(stu);
			param.setCourse(course);
			param.setValue(value);
			param.setGpa(gpa);
			param.setIdentity(identity);

			int flag = scoreDao.addScore(param);
			if (flag <= 0) return false;
		}

		return true;
	}

	@Override
	public String searchTeacher(String name) {
		List<Teacher> teachers = teacherDao.searchByName(name);
		String result = JSON.toJSONString(teachers, SerializerFeature.DisableCircularReferenceDetect);
		return result;
	}

	@Override
	public String searchStudent(String name) {
		List<Student> students = studentDao.searchByName(name);
		String result = JSON.toJSONString(students, SerializerFeature.DisableCircularReferenceDetect);
		return result;
	}

	@Override
	public String getFeedback() {
		List<Feedback> feedbacks = feedbackDao.retrieve();
		return JSON.toJSONString(feedbacks, SerializerFeature.DisableCircularReferenceDetect);
	}

	@Override
	public void deleteFeedback(int id) {
		feedbackDao.delete(id);
	}
}
