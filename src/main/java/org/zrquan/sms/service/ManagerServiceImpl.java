package org.zrquan.sms.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zrquan.sms.dao.*;
import org.zrquan.sms.entity.*;
import org.zrquan.sms.service.interfaces.ManagerService;

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
		String result = JSON.toJSONString(students, SerializerFeature.DisableCircularReferenceDetect);
		return result;
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
	public String auditScore() {
		//TODO: 成绩审核功能
		return null;
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
	public boolean addTeacher(Teacher teacher, int deptId) {
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

				return userDao.addUser(newUser) > 0;
			}
		}
		return false;
	}

	@Override
	public boolean addStudent(Student student, int majorId) {
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

				return userDao.addUser(newUser) > 0;
			}
		}
		return false;
	}

	@Override
	public boolean addManager(Manager manager, int deptId, String email, String phone) {
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
}
