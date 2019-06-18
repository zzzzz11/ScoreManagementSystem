package org.zrquan.sms.service.interfaces;

import org.zrquan.sms.entity.Course;
import org.zrquan.sms.entity.Manager;
import org.zrquan.sms.entity.Student;
import org.zrquan.sms.entity.Teacher;

public interface ManagerService {

	/**
	 * 所有课程信息
	 *
	 * @return Json
	 */
	String getCourseInfo();

	/**
	 * 所有教师信息
	 *
	 * @return Json
	 */
	String getTeacherInfo();

	/**
	 * 所有学生信息
	 *
	 * @return Json
	 */
	String getStudentInfo();

	/**
	 * 所用用户信息
	 *
	 * @return Json
	 */
	String getUserInfo();

	/**
	 * 审核成绩
	 */
	String auditScore();

	/**
	 * 查询课程
	 *
	 * @param condition 查询条件
	 * @param keyword   检索词
	 * @return Json
	 */
	String searchCourse(String condition, String keyword);

	/**
	 * 查询用户
	 *
	 * @param condition 查询条件
	 * @param keyword   检索词
	 * @return Json
	 */
	String searchUser(String condition, String keyword);

	/**
	 * 管理员个人信息
	 *
	 * @param accountNumber 账号（工号）
	 * @return 管理员对象
	 */
	Manager getPersonalInfo(String accountNumber);

	/**
	 * 添加课程
	 *
	 * @param course      课程对象
	 * @param teacherName 教师名称
	 * @return 是否成功
	 */
	boolean addCourse(Course course, String teacherName);

	/**
	 * 添加教师
	 *
	 * @param teacher 教师对象
	 * @param deptId  学院ID
	 */
	boolean addTeacher(Teacher teacher, int deptId);

	/**
	 * 添加学生
	 *
	 * @param student 学生对象
	 * @param majorId 专业ID
	 */
	boolean addStudent(Student student, int majorId);

	/**
	 * 添加管理员
	 */
	boolean addManager(Manager manager, int deptId, String email, String phone);

	String getAuditCourse();

	String getAuditStudent(int courseId);
}
