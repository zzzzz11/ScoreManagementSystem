package org.zrquan.sms.service.interfaces;

import org.zrquan.sms.entity.Teacher;

public interface TeacherService {

	/**
	 * 获取教师个人信息
	 *
	 * @param number 工号
	 * @return 教师对象
	 */
	Teacher getTeacherInfo(String number);

	/**
	 * 获取某个教师的课程信息
	 *
	 * @param number 工号
	 * @return JSON 字符串
	 */
	String getCourseInfo(String number);

	/**
	 * 提交成绩（未审核）
	 *
	 * @param scoreJson 成绩列表
	 * @return 是否成功
	 */
	boolean submitScore(String scoreJson);

	/**
	 * 修改个人信息
	 *
	 * @param teacher 教师对象
	 */
	boolean updateTeacher(Teacher teacher);

	String getCourseScore(int courseId);

	String getCourseTempScore(int courseId);
}
