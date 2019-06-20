package org.zrquan.sms.service.interfaces;

public interface CommonService {
	/**
	 * 所有学院信息
	 *
	 * @return Json
	 */
	String retrieveDept();

	/**
	 * 所有专业信息
	 *
	 * @return Json
	 */
	String retrieveMajor();

	/**
	 * 某课程学生人数
	 *
	 * @param courseId 课程ID
	 * @return 人数
	 */
	int getCourseStudentCount(int courseId);

	boolean feedback(String account, String content);
}
