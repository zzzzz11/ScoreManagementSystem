package org.zrquan.sms.service.interfaces;

import org.zrquan.sms.entity.Teacher;

public interface TeacherService {

    /**
     * 学生个人信息
     *
     * @param number 学号
     * @return 学生对象
     */
    Teacher getTeacherInfo(String number);

    /**
     * 获取成绩信息
     *
     * @param number 学生学号
     * @return JSON字符串
     */
    String getCourseInfo(String number);
}
