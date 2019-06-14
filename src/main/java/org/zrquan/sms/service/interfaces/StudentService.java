package org.zrquan.sms.service.interfaces;
import java.util.ArrayList;
import java.util.List;

import org.zrquan.sms.entity.Student;

public interface StudentService {
	/**
	 * 学生个人信息
	 *
	 * @param number 学号
	 * @return 学生对象
	 */
	Student getStudentInfo(String number);

	/**
	 * 获取成绩信息
	 *
	 * @param number 学生学号
	 * @return JSON字符串
	 */
	String getScoreInfo(String number);

}
