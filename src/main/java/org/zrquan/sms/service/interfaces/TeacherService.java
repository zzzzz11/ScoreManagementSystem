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
	 * 添加教师
	 *
	 * @param teacher
	 */
	void addTeacher(Teacher teacher);

	/**
	 * 修改教师信息
	 *
	 * @param teacher
	 */
	void updateTeacher(Teacher teacher);

	/**
	 * 删除教师
	 *
	 * @param number
	 */
	void deleteTeacherByNumber(String number);
}
